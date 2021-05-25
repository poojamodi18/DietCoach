package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.beans.MealPlan;
import com.dao.MealPlanDao;

public class MealPlanDaoImpl implements MealPlanDao{
	String todayRecord = "SELECT * FROM mealplan where i_user_id = ? and d_date >= curdate();";
	String insertTodayMeal ="insert into mealplan(i_user_id, c_breakfast, c_lunch, c_dinner, c_snack, d_date) values(?,?,?,?,?,curdate())";
	String updateToday = "update mealplan set c_breakfast=?, c_lunch=?, c_dinner=?, c_snack=? where i_mealplan_id=?";
	@Override
	public int chechTodayRecord(Connection connection, MealPlan mealPlan) throws SQLException {
		int planID = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(todayRecord)){
			preparedStatement.setInt(1, mealPlan.getUserid());
			try(ResultSet resultSet = preparedStatement.executeQuery()){
				while(resultSet.next()) {
					planID = resultSet.getInt("i_mealplan_id");
				}
			}
		}
		return planID;
	}
	@Override
	public void updateUserMeal(Connection connection, MealPlan mealPlan, int planId) throws SQLException {
//		c_breakfast=?, c_lunch=?, c_dinner=?, c_snack=? where i_mealplan_id=?";
		try(PreparedStatement preparedStatement = connection.prepareStatement(updateToday)){
			preparedStatement.setString(1, mealPlan.getBreakfast());
			preparedStatement.setString(2, mealPlan.getLunch());
			preparedStatement.setString(3, mealPlan.getDinner());
			preparedStatement.setString(4, mealPlan.getSnack());
			preparedStatement.setInt(5, planId);
			preparedStatement.executeUpdate();
		}
	}
	@Override
	public void insertUserMeal(Connection connection, MealPlan mealPlan) throws SQLException {
		try(PreparedStatement preparedStatement=connection.prepareStatement(insertTodayMeal))
		{
			preparedStatement.setInt(1, mealPlan.getUserid());
			preparedStatement.setString(2, mealPlan.getBreakfast());
			preparedStatement.setString(3, mealPlan.getLunch());
			preparedStatement.setString(4, mealPlan.getDinner());
			preparedStatement.setString(5, mealPlan.getSnack());
			preparedStatement.executeUpdate();
		}
	}
	@Override
	public MealPlan getUserTodayPlan(Connection connection, int userId) throws SQLException {
		MealPlan plan = new MealPlan();
		try(PreparedStatement preparedStatement = connection.prepareStatement(todayRecord)){
			preparedStatement.setInt(1, userId);
			try(ResultSet resultSet = preparedStatement.executeQuery()){
				while(resultSet.next()) {
					plan.setMealplanId(resultSet.getInt("i_mealplan_id"));
					plan.setUserid(resultSet.getInt("i_user_id"));
					plan.setBreakfast(resultSet.getString("c_breakfast"));
					plan.setLunch(resultSet.getString("c_lunch"));
					plan.setDinner(resultSet.getString("c_dinner"));
					plan.setSnack(resultSet.getString("c_snack"));
					plan.setDate(resultSet.getString("d_date"));
				}
			}
		}
		return plan;
	}

}
