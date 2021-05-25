package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.DietCategory;
import com.beans.Food;
import com.dao.DietCategoryDao;
import com.dao.impl.DietCategoryDaoimpl;
import com.service.DietCategoryService;
import com.utility.CommonUtility;

public class DietCategoryServiceImpl implements DietCategoryService
{
	CommonUtility commonutil = new CommonUtility();
	DietCategoryDao dietcategorydao = new DietCategoryDaoimpl();
	@Override
	public void insertdietCategory(DietCategory dietcategory) {
		// TODO Auto-generated method stub
		try(Connection connection=commonutil.getconnection())
		{
			int i=dietcategorydao.insertDietCategory(connection,dietcategory);
			if(i>0)
			{
				System.out.println("Diet Category Inserted");
			}
			else
			{
				System.out.println("Diet Category fail to Insert");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public ArrayList<DietCategory> getDietCategory() {
		ArrayList<DietCategory> dietcategorylist=new ArrayList<DietCategory>();
		try(Connection connection=commonutil.getconnection())
		{
			dietcategorylist=dietcategorydao.selectDietCategory(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dietcategorylist;
	}
	@Override
	public void deleteDietCategory(int id)
	{
		int deleterows=0;
		try(Connection connection=commonutil.getconnection())
		{
			deleterows=dietcategorydao.delete(connection, id);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public DietCategory selectDietById(int id)
	{
		DietCategory category= new DietCategory();
		try(Connection connection=commonutil.getconnection())
		{
			category=dietcategorydao.selectDietById(connection, id);
			System.out.println("Service Diet id"+category.getDietcategoryid());
			System.out.println("Service diet name"+category.getCategoryname());
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return category;
	}
	public void update(DietCategory dietcategory)
	{
			int updatedrows=0;
			try(Connection connection=commonutil.getconnection())
			{
				updatedrows=dietcategorydao.updateDietCategory(connection, dietcategory);
				if (updatedrows>0) 
				{
					System.out.println("Updated Successfully");
				}
				else
				{
					System.out.println("Update failed");
				}
			} 
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
