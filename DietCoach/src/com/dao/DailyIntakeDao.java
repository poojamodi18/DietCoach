package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.DailyIntake;

public interface DailyIntakeDao {

	ArrayList<DailyIntake> getUserTodayIntake(Connection connection, int userId) throws SQLException;

	void InsertUserTodayIntake(Connection connection, DailyIntake dailyIntake) throws SQLException;

}
