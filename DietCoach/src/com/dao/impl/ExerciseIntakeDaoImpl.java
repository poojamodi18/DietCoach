package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.DailyIntake;
import com.beans.ExerciseIntake;
import com.dao.ExerciseIntakeDao;

public class ExerciseIntakeDaoImpl implements ExerciseIntakeDao{
	String insertInake = "insert into exercise_intake(i_user_id, i_exercise_id, i_calorie, i_time, i_date) values(?,?,?,?,curdate());";
	String selecttodayintake = "SELECT * FROM exercise_intake where i_user_id=? and i_date>=curdate();";
	@Override
	public void insertUserIntake(Connection connection, ExerciseIntake exerciseIntake) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(insertInake)){
			preparedStatement.setInt(1, exerciseIntake.getUserId());
			preparedStatement.setInt(2, exerciseIntake.getExerciseId());
			preparedStatement.setInt(3, exerciseIntake.getCalories());
			preparedStatement.setInt(4, exerciseIntake.getTime());
			preparedStatement.executeUpdate();
		}
	}
	@Override
	public ArrayList<ExerciseIntake> getUserIntake(Connection connection, int userId) throws SQLException {
		ArrayList<ExerciseIntake> intakes = new ArrayList<ExerciseIntake>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selecttodayintake)){
			preparedStatement.setInt(1, userId);
			try(ResultSet resultSet = preparedStatement.executeQuery()){
				while(resultSet.next()) {
					ExerciseIntake dailyIntake = new ExerciseIntake();
					dailyIntake.setId(resultSet.getInt("i_id"));
					dailyIntake.setUserId(resultSet.getInt("i_user_id"));
					dailyIntake.setExerciseId(resultSet.getInt("i_exercise_id"));
					dailyIntake.setCalories(resultSet.getInt("i_calorie"));
					dailyIntake.setTime(resultSet.getInt("i_time"));
					dailyIntake.setDate(resultSet.getString("i_date"));
					intakes.add(dailyIntake);
				}
			}
		}
		return intakes;
	}

}
