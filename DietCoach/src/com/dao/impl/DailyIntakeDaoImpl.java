package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.DailyIntake;
import com.dao.DailyIntakeDao;

public class DailyIntakeDaoImpl implements DailyIntakeDao{
	String todayuserintake = "SELECT * FROM daily_intake where i_user_id= ? and d_date >= curdate() ;";
	String insertintake = "insert into daily_intake(i_user_id, c_meal_type, i_food_id, i_quantity, i_calorie, d_date) values(?,?,?,?,?,curdate())";
	@Override
	public ArrayList<DailyIntake> getUserTodayIntake(Connection connection, int userId) throws SQLException {
		ArrayList<DailyIntake> dailyIntakes = new ArrayList<DailyIntake>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(todayuserintake)){
			preparedStatement.setInt(1, userId);
			try(ResultSet resultSet = preparedStatement.executeQuery()){
				while(resultSet.next()) {
					DailyIntake dailyIntake = new DailyIntake();
					dailyIntake.setIntakeId(resultSet.getInt("i_intake_id")); 
					dailyIntake.setUserId(resultSet.getInt("i_user_id"));
					dailyIntake.setMealtype(resultSet.getString("c_meal_type"));
					dailyIntake.setFoodid(resultSet.getInt("i_food_id"));
					dailyIntake.setQuantity(resultSet.getInt("i_quantity"));
					dailyIntake.setCalorie(resultSet.getInt("i_calorie"));
					dailyIntake.setDate(resultSet.getString("d_date"));
					dailyIntakes.add(dailyIntake);
				}
			}
		}
		return dailyIntakes;
	}
	@Override
	public void InsertUserTodayIntake(Connection connection, DailyIntake dailyIntake) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(insertintake)){
			preparedStatement.setInt(1, dailyIntake.getUserId());
			preparedStatement.setString(2, dailyIntake.getMealtype());
			preparedStatement.setInt(3, dailyIntake.getFoodid());
			preparedStatement.setInt(4, dailyIntake.getQuantity());
			preparedStatement.setInt(5, dailyIntake.getCalorie());
			preparedStatement.executeUpdate();
		}
		
	}

}
