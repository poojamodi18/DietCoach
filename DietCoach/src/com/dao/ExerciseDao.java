package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Exercise;

public interface ExerciseDao {

	ArrayList<Exercise> getExerciseList(Connection connection) throws SQLException;

	Exercise getExerciseById(Connection connection, int id) throws SQLException;

	int updateExercise(Connection connection, Exercise exercise) throws SQLException;

	int insertExercise(Connection connection, Exercise exercise) throws SQLException;

}
