package com.dao;

import java.sql.Connection;
import java.sql.SQLException;

import com.beans.User;

public interface UserDao {

	int userRegistration(Connection connection,User user) throws SQLException;

	int userRegistrationDetails(Connection connection, User u, int userid) throws SQLException;

	User userLogin(Connection connection, String email, String password) throws SQLException;

	String getPassword(Connection connection, String email) throws SQLException;

	int getUserCalories(Connection connection, int userId) throws SQLException;

	User getUserDetailsForMeal(Connection connection, int userId) throws SQLException;

	User getUserProfile(Connection connection, int userid) throws SQLException;

	String getUserName(Connection connection, int id) throws SQLException;

	int checkNewUser(Connection connection, String email) throws SQLException;

	int newDiabetesRegister(Connection connection, User u, int userid) throws SQLException;

	int checkUserPassword(Connection connection, String email, String pass) throws SQLException;

	int changePremiumUser(Connection connection, int userid) throws SQLException;

	int updateGenInfo(Connection connection, User u)throws SQLException;

	int changeToFree(Connection connection, int userId) throws SQLException;

	int getTodayWater(Connection connection, int userId) throws SQLException;

	int getTodayMeal(Connection connection, int userId, String mealtype) throws SQLException;

	int getTodayExercise(Connection connection, int userId) throws SQLException;

	int getTodayIntake(Connection connection, int userId, int day) throws SQLException;

	int getTodayBurned(Connection connection, int userId, int day) throws SQLException;



}
