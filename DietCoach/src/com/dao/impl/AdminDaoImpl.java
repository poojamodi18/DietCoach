package com.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.User;
import com.dao.AdminDao;

public class AdminDaoImpl implements AdminDao{
String query="select * from user_details where i_status=0";
String deletedquery="select * from user_details where i_status=1";
String activatequery="update user_details set i_status =0 where i_user_id=?";
String userprofileQuery = "select * from user_details where c_role='Admin' and i_user_id=?";
String deleteQuery="update user_details set i_status =1 where i_user_id=?";
String updateQuery="update user_details set c_first_name=?,c_last_name=?,c_email=? where i_user_id=?";
String changePass = "update user_details set c_password =? where c_email=?;";
String newAdmin = "insert into user_details(c_first_name,c_last_name,c_email,c_password,i_age,c_gender,c_user_type,c_role,d_birthdate,d_register_date) values (?,?,?,?,?,?,?,?,?,?)";
String usernumberbytype = "SELECT count(*) FROM user_details where i_status = 0 and c_user_type=?;";
String usernumberbymonth = "SELECT COUNT(*) FROM dietplan.user_details WHERE i_status = 0 and  YEAR(d_register_date) = ? AND MONTH(d_register_date) = ?;";
String todayUsernumber = "SELECT count(*) FROM user_details where i_status = 0 and d_register_date >= curdate();";
String getAllincome = "SELECT sum(d_txn_amount) FROM payment;";
String getBookincome = "SELECT sum(d_txn_amount) FROM payment where d_txn_amount<100;";
String getPlanincome = "SELECT sum(d_txn_amount) FROM payment where d_txn_amount>100;";
String getMonthlyIncome = "SELECT sum(d_txn_amount) FROM payment WHERE YEAR(d_txn_date) = ? AND MONTH(d_txn_date) = ?;";
String todayincome = "SELECT sum(d_txn_amount) FROM payment WHERE d_txn_date >= curdate();";
	@Override
	public ArrayList<User> getUserList(Connection connection) throws SQLException {
		ArrayList<User> users = new ArrayList<User>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(query))
		{
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					
					User user = new User();
					user.setUserId(resultSet.getInt("i_user_id"));
					user.setFirstName(resultSet.getString("c_first_name"));
					user.setLastName(resultSet.getString("c_last_name"));
					user.setEmailId(resultSet.getString("c_email"));
					user.setAge(resultSet.getInt("i_age"));
					user.setGender(resultSet.getString("c_gender"));
					user.setUserType(resultSet.getString("c_user_type"));
					user.setDob(resultSet.getDate("d_birthdate"));
					user.setRegisterDate(resultSet.getDate("d_register_date"));
					if(resultSet.getString("c_role").equalsIgnoreCase("user"))
					{
						users.add(user);
					}
				}
			}
		}
		return users;
	}
	@Override
	public int deleteUserDetails(Connection connection,int id) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery))
		{
			preparedStatement.setInt(1, id);
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public int updateUserDetails(Connection connection,User user) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(updateQuery))
		{
			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getLastName());
			preparedStatement.setString(3, user.getEmailId());
			preparedStatement.setInt(4, user.getUserId());
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public User getUserProfile(Connection connection,int userid) throws SQLException {
		User user = new User();
		try(PreparedStatement preparedStatement = connection.prepareStatement(userprofileQuery))
		{
			preparedStatement.setInt(1, userid);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{	
					user.setUserId(resultSet.getInt("i_user_id"));
					user.setFirstName(resultSet.getString("c_first_name"));
					user.setLastName(resultSet.getString("c_last_name"));
					user.setEmailId(resultSet.getString("c_email"));
					user.setPassword(resultSet.getString("c_password"));
					user.setAge(resultSet.getInt("i_age"));
					user.setGender(resultSet.getString("c_gender"));
					user.setUserType(resultSet.getString("c_user_type"));
					user.setDob(resultSet.getDate("d_birthdate"));
					user.setRegisterDate(resultSet.getDate("d_register_date"));
				}
			}
		}
		return user;
	}
	@Override
	public int changePassword(Connection connection, User user) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(changePass))
		{
			System.out.println(user.getPassword());
			System.out.println(user.getEmailId());
			preparedStatement.setString(1, user.getPassword());
			preparedStatement.setString(2, user.getEmailId());
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public int insertNewAdmin(Connection connection, User u) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(newAdmin))
		{
			preparedStatement.setString(1, u.getFirstName());
			preparedStatement.setString(2, u.getLastName());
			preparedStatement.setString(3, u.getEmailId());
			preparedStatement.setString(4, u.getPassword());
			preparedStatement.setInt(5, u.getAge());
			preparedStatement.setString(6, u.getGender());
			preparedStatement.setString(7, u.getUserType());
			preparedStatement.setString(8, u.getUserRole());
			java.sql.Date mysqlDatedob = new Date(u.getDob().getTime());
			preparedStatement.setDate(9, mysqlDatedob);
			java.sql.Date mysqlDateregister = new Date(u.getRegisterDate().getTime());
			preparedStatement.setDate(10, mysqlDateregister);
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public ArrayList<User> getDeleteUserList(Connection connection) throws SQLException {
		ArrayList<User> users = new ArrayList<User>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(deletedquery))
		{
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					
					User user = new User();
					user.setUserId(resultSet.getInt("i_user_id"));
					user.setFirstName(resultSet.getString("c_first_name"));
					user.setLastName(resultSet.getString("c_last_name"));
					user.setEmailId(resultSet.getString("c_email"));
					user.setAge(resultSet.getInt("i_age"));
					user.setGender(resultSet.getString("c_gender"));
					user.setUserType(resultSet.getString("c_user_type"));
					user.setDob(resultSet.getDate("d_birthdate"));
					user.setRegisterDate(resultSet.getDate("d_register_date"));
					if(resultSet.getString("c_role").equalsIgnoreCase("user"))
					{
						users.add(user);
					}
				}
			}
		}
		return users;
	}
	@Override
	public int activateUserDetails(Connection connection, int userid) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(activatequery))
		{
			preparedStatement.setInt(1, userid);
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public int getUserNumberByType(Connection connection, String type) throws SQLException {
		int numbers = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(usernumberbytype))
		{
			preparedStatement.setString(1, type);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{	
					numbers=resultSet.getInt(1);
					
				}
			}
		}
		return numbers;
	}
	@Override
	public int getUserNumberByMonth(Connection connection, int year, int month) throws SQLException {
		int numbers = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(usernumberbymonth))
		{
			preparedStatement.setInt(1, year);
			preparedStatement.setInt(2, month);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{	
					numbers=resultSet.getInt(1);
				}
			}
		}
		return numbers;
	}
	@Override
	public int getTodayUserNumber(Connection connection) throws SQLException {
		int numbers = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(todayUsernumber))
		{
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{	
					numbers=resultSet.getInt(1);
				}
			}
		}
		return numbers;
	}
	@Override
	public int getTotalAllPayment(Connection connection) throws SQLException {
		int numbers = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(getAllincome))
		{
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{	
					numbers=resultSet.getInt(1);
				}
			}
		}
		return numbers;
	}
	@Override
	public int getPlanPayment(Connection connection) throws SQLException {
		int numbers = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(getPlanincome))
		{
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{	
					numbers=resultSet.getInt(1);
					System.out.println(numbers+"dao");
				}
			}
		}
		return numbers;
	}
	@Override
	public int getBookPayment(Connection connection) throws SQLException {
		int numbers = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(getBookincome))
		{
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{	
					numbers=resultSet.getInt(1);
					System.out.println(numbers+"dao");
				}
			}
		}
		return numbers;
	}
	@Override
	public int getIncomeByMonth(Connection connection, int year, int month) throws SQLException {
		int numbers = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(getMonthlyIncome))
		{
			preparedStatement.setInt(1, year);
			preparedStatement.setInt(2, month);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{	
					numbers=resultSet.getInt(1);
				}
			}
		}
		return numbers;
	}
	@Override
	public int getTodayIncome(Connection connection) throws SQLException {
		int numbers = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(todayincome))
		{
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{	
					numbers=resultSet.getInt(1);
				}
			}
		}
		return numbers;
	}

}
