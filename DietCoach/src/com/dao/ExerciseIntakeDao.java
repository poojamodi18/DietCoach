package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.ExerciseIntake;

public interface ExerciseIntakeDao {

	void insertUserIntake(Connection connection, ExerciseIntake exerciseIntake) throws SQLException;

	ArrayList<ExerciseIntake> getUserIntake(Connection connection, int userId) throws SQLException;

}
