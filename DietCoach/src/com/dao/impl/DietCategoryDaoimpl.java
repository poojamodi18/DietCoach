package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.DietCategory;
import com.dao.DietCategoryDao;
import com.utility.CommonUtility;

public class DietCategoryDaoimpl implements DietCategoryDao 
{
	String insertcategoryquery="insert into diet_category(c_diet_category) values (?);";
	String selectquery="select * from diet_category;";
	String deletedietcategoryquery="delete from diet_category where i_diet_id=?";
	String selectdietbyidquery="select * from diet_category where i_diet_id=?";
	String updatedietcategoryquery="update diet_category set c_diet_category=? where i_diet_id=?";
	public int insertDietCategory(Connection connection,DietCategory dietCategory) throws SQLException
	{
		try(PreparedStatement preparedStatement=connection.prepareStatement(insertcategoryquery))
		{
			preparedStatement.setString(1, dietCategory.getCategoryname());
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public ArrayList<DietCategory> selectDietCategory(Connection connection) throws SQLException {
		ArrayList<DietCategory> dietcategorylist = new ArrayList<DietCategory>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectquery);
				ResultSet resultSet = preparedStatement.executeQuery())
		{
			while(resultSet.next())
			{
				DietCategory dietcategory=new DietCategory();
				dietcategory.setDietcategoryid(resultSet.getInt("i_diet_id"));
				dietcategory.setCategoryname(resultSet.getString("c_diet_category"));
				dietcategorylist.add(dietcategory);
			}
		}
		return dietcategorylist;
	}
	@Override
	public int delete(Connection connection, int id) throws SQLException {
		try (PreparedStatement preparedStatement = connection.prepareStatement(deletedietcategoryquery)) {
			preparedStatement.setInt(1, id);
			return preparedStatement.executeUpdate();
			
		}
	}
	public int updateDietCategory(Connection connection,DietCategory dietcategory) throws SQLException
	{
		try(PreparedStatement preparedStatement=connection.prepareStatement(updatedietcategoryquery))
		{
			preparedStatement.setString(1, dietcategory.getCategoryname());
			preparedStatement.setInt(2, dietcategory.getDietcategoryid());
			return preparedStatement.executeUpdate();
		}
		
	}
	public DietCategory selectDietById(Connection connection,int id) throws SQLException
	{	
		DietCategory dietCategory=new DietCategory();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectdietbyidquery))
		{
			System.out.println("Dao diet id : "+id);
			preparedStatement.setInt(1, id);
			try(ResultSet resultSet=preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					dietCategory.setDietcategoryid(resultSet.getInt("i_diet_id"));
					dietCategory.setCategoryname(resultSet.getString("c_diet_category"));
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dietCategory;
	}
}
