package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Exercise;
import com.beans.Feedback;
import com.dao.ExerciseDao;

public class ExerciseDaoImpl implements ExerciseDao {
	String insert = "insert into exercise(c_name, i_calories, i_minutes) values(?,?,?)";
	String selectAll = "SELECT * FROM exercise;";
	String selectById = "select * from exercise where i_exercise_id=?";
	String update = "update exercise set c_name=?, i_calories=?, i_minutes=? where i_exercise_id=?";
	@Override
	public ArrayList<Exercise> getExerciseList(Connection connection) throws SQLException {
		ArrayList<Exercise> exercises = new ArrayList<Exercise>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectAll))
		{
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					Exercise exercise = new Exercise();
					exercise.setExerciseId(resultSet.getInt("i_exercise_id"));
					exercise.setName(resultSet.getString("c_name"));
					exercise.setCalories(resultSet.getInt("i_calories"));
					exercise.setMinutes(resultSet.getInt("i_minutes"));
					exercises.add(exercise);
				}
			}
		}
		return exercises;
	}

	@Override
	public Exercise getExerciseById(Connection connection, int id) throws SQLException {
		Exercise exercise = new Exercise();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectById))
		{
			preparedStatement.setInt(1, id);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					exercise.setExerciseId(resultSet.getInt("i_exercise_id"));
					exercise.setName(resultSet.getString("c_name"));
					exercise.setCalories(resultSet.getInt("i_calories"));
					exercise.setMinutes(resultSet.getInt("i_minutes"));
				}
			}
		}
		return exercise;
	}

	@Override
	public int updateExercise(Connection connection, Exercise exercise) throws SQLException {
		try(PreparedStatement preparedStatement=connection.prepareStatement(update))
		{
			preparedStatement.setString(1, exercise.getName());
			preparedStatement.setInt(2, exercise.getCalories());
			preparedStatement.setInt(3, exercise.getMinutes());
			preparedStatement.setInt(4, exercise.getExerciseId());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int insertExercise(Connection connection, Exercise exercise) throws SQLException {
		try(PreparedStatement preparedStatement=connection.prepareStatement(insert))
		{
			preparedStatement.setString(1, exercise.getName());
			preparedStatement.setInt(2, exercise.getCalories());
			preparedStatement.setInt(3, exercise.getMinutes());
			return preparedStatement.executeUpdate();
		}
	}
}
