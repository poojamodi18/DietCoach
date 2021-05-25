package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.User;

public interface AdminDao {

	ArrayList<User> getUserList(Connection connection) throws SQLException;

	int deleteUserDetails(Connection connection, int id) throws SQLException;

	int updateUserDetails(Connection connection,User user) throws SQLException;

	User getUserProfile(Connection connection, int userid) throws SQLException;

	int changePassword(Connection connection, User user) throws SQLException;

	int insertNewAdmin(Connection connection, User u) throws SQLException;

	ArrayList<User> getDeleteUserList(Connection connection) throws SQLException;

	int activateUserDetails(Connection connection, int userid) throws SQLException;

	int getUserNumberByType(Connection connection, String type)throws SQLException;

	int getUserNumberByMonth(Connection connection, int year, int month) throws SQLException;

	int getTodayUserNumber(Connection connection) throws SQLException;

	int getTotalAllPayment(Connection connection) throws SQLException;

	int getPlanPayment(Connection connection) throws SQLException;

	int getBookPayment(Connection connection) throws SQLException;

	int getIncomeByMonth(Connection connection, int year, int month) throws SQLException;

	int getTodayIncome(Connection connection) throws SQLException;

}
