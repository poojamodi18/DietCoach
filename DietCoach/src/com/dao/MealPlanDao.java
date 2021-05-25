package com.dao;

import java.sql.Connection;
import java.sql.SQLException;

import com.beans.MealPlan;

public interface MealPlanDao {

	int chechTodayRecord(Connection connection, MealPlan mealPlan) throws SQLException;

	void updateUserMeal(Connection connection, MealPlan mealPlan, int planId) throws SQLException;

	void insertUserMeal(Connection connection, MealPlan mealPlan) throws SQLException;

	MealPlan getUserTodayPlan(Connection connection, int userId) throws SQLException;

}
