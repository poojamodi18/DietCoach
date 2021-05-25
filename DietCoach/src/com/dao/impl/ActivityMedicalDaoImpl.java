package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.DailyActivity;
import com.beans.DietCategory;
import com.beans.MedicalCondition;
import com.dao.ActivityMedicalDao;

public class ActivityMedicalDaoImpl implements ActivityMedicalDao{
	String selectmedicalcondition = "select * from medical_condition";
	String selectmedicalconditionbyid = "select * from medical_condition where i_medical_condition_id=?";
	String insertmedicalconditionquery="insert into medical_condition(i_medical_condition_id, c_medical_condition_name) values (?,?);";
	String deletemedicalconditionquery="delete from medical_condition where i_medical_condition_id=?";
	String selectmedicalconditionbyidquery="select * from medical_condition where i_medical_condition_id=?";
	String updatemedicalconditionquery="update medical_condition set c_medical_condition_name=? where i_medical_condition_id=?";
	
	String selectactivity = "select * from daily_activity";
	
	public ArrayList<MedicalCondition> selectMedicalCondition(Connection connection) throws SQLException {
		ArrayList<MedicalCondition> medicalConditions = new ArrayList<MedicalCondition>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectmedicalcondition))
		{
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					MedicalCondition medicalcondition = new MedicalCondition();
					medicalcondition.setMedicalID(resultSet.getInt("i_medical_condition_id"));
					medicalcondition.setMedicalConditionName(resultSet.getString("c_medical_condition_name"));
					medicalConditions.add(medicalcondition);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return medicalConditions;
	}
	@Override
	public int delete(Connection connection, int id) throws SQLException {
		try (PreparedStatement preparedStatement = connection.prepareStatement(deletemedicalconditionquery)) {
			preparedStatement.setInt(1, id);
			return preparedStatement.executeUpdate();
			
		}
	}
	@Override
	public int insertMedicalCondition(Connection connection,MedicalCondition medicalcondition) throws SQLException
	{
		try(PreparedStatement preparedStatement=connection.prepareStatement(insertmedicalconditionquery))
		{
			preparedStatement.setInt(1, medicalcondition.getMedicalID());
			preparedStatement.setString(2, medicalcondition.getMedicalConditionName());
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public MedicalCondition selectDietById(Connection connection, int id) throws SQLException {
		MedicalCondition medicalcondition=new MedicalCondition();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectmedicalconditionbyidquery))
		{
			preparedStatement.setInt(1, id);
			try(ResultSet resultSet=preparedStatement.executeQuery())
			{
				medicalcondition.setMedicalConditionName(resultSet.getString("c_medical_condition_name"));
			}
		}
		return medicalcondition;
	}
	/*
	 public int updateDietCategory(Connection connection,DietCategory dietcategory) throws SQLException
	{
		//int cnt=0;
		try(PreparedStatement preparedStatement=connection.prepareStatement(updatedietcategoryquery))
		{
			preparedStatement.setString(1, dietcategory.getCategoryname());
			preparedStatement.setInt(2, dietcategory.getDietcategoryid());
			return preparedStatement.executeUpdate();
		}
		
	}
	 */
	@Override
	public int updateMedicalCondition(Connection connection, MedicalCondition medicalCondition) throws SQLException {
		int i=0;
		try(PreparedStatement preparedStatement=connection.prepareStatement(updatemedicalconditionquery))
		{
			preparedStatement.setString(1, medicalCondition.getMedicalConditionName());
			preparedStatement.setInt(2, medicalCondition.getMedicalID());
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public ArrayList<DailyActivity> selectDailyActivity(Connection connection) throws SQLException {
		ArrayList<DailyActivity> activities = new ArrayList<DailyActivity>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectactivity))
		{
			try(ResultSet resultSet=preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					DailyActivity dailyActivity = new DailyActivity();
					dailyActivity.setActivityID(resultSet.getInt("i_activity_id"));
					dailyActivity.setActivityName(resultSet.getString("c_activity_name"));
					dailyActivity.setActivityDescription(resultSet.getString("c_activity_description"));
					dailyActivity.setActivityValue(resultSet.getFloat("f_activity_value"));
					activities.add(dailyActivity);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
		return activities;
	}
	@Override
	public MedicalCondition getMedicalConditionByID(Connection connection, int id) throws SQLException {
		MedicalCondition medicalCondition = new MedicalCondition();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectmedicalconditionbyid))
		{
			preparedStatement.setInt(1, id);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					medicalCondition.setMedicalID(resultSet.getInt("i_medical_condition_id"));
					medicalCondition.setMedicalConditionName(resultSet.getString("c_medical_condition_name"));
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("After dao id" +medicalCondition.getMedicalID());
		return medicalCondition;
	}

}
