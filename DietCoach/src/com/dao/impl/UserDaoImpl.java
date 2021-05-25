package com.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.naming.java.javaURLContextFactory;

import com.beans.User;
import com.dao.UserDao;
import com.sun.org.apache.regexp.internal.recompile;

public class UserDaoImpl implements UserDao{
	String selectcalbyid="select i_daily_calories from user_bmi_history_details where i_user_id=?";
	String selectuserhistorybyid="select * from user_bmi_history_details T1 where i_user_id=? and d_updated_date = ( select max(d_updated_date) from user_bmi_history_details T2 where i_user_id=? and T1.i_user_id=T2.i_user_id)";
	String selectuserProfile="select * from user_details where i_user_id=?";
	String selectuserName = "select c_first_name from user_details where i_user_id=?";
	String checknewUser = "select count(*) as 'count' from user_details where c_email=?";
	String diabetesinsertQuery="insert into diabetes(i_user_id, i_blood_sugar, d_update_date) values(?,?,?)";
	String checkUserPasswordString ="select count(*) as 'count' from user_details where c_email=? and c_password=?";
	String changetoPremiumUser = "update user_details set c_user_type='Premium' where i_user_id=?";
	String updateGenInfoQuery = "update user_details set c_first_name=?, c_last_name=? ,c_email=? where i_user_id=?";
	String changeToFree = "update user_details set c_user_type='Free' where i_user_id=?";
	String todayWater = "SELECT i_quantity FROM dietplan.daily_intake WHERE c_meal_type='water' AND i_user_id=? AND YEAR(d_date) = YEAR(curdate()) AND MONTH(d_date) = MONTH(curdate()) AND DAY(d_date) = DAY(curdate());";
	String todayMeal = "SELECT sum(i_calorie) FROM daily_intake WHERE c_meal_type=? AND i_user_id=? AND YEAR(d_date) = YEAR(curdate()) AND MONTH(d_date) = MONTH(curdate()) AND DAY(d_date) = DAY(curdate());";
	String todayExercise = "SELECT sum(i_calorie) FROM exercise_intake where i_user_id=? and i_date >=curdate();";
	String todayTotalCal = "SELECT sum(i_calorie) FROM daily_intake WHERE i_user_id=? AND YEAR(d_date) = YEAR(curdate()) AND MONTH(d_date) = MONTH(curdate()) AND DAY(d_date) = DAY(curdate()-?);";
	String todayBurned = "SELECT sum(i_calorie) FROM exercise_intake WHERE i_user_id=? AND YEAR(i_date) = YEAR(curdate()) AND MONTH(i_date) = MONTH(curdate()) AND DAY(i_date) = DAY(curdate()-?);";
	@Override
	public int userRegistration(Connection connection,User user) throws SQLException {
		int userid=0;
		String insertuserquery="insert into user_details(c_first_name, c_last_name, c_email,c_password, i_age, c_gender, c_user_type, c_role,d_birthdate,d_register_date) values (?,?,?,?,?,?,?,?,?,?)";
		try(PreparedStatement preparedStatement=connection.prepareStatement(insertuserquery,java.sql.Statement.RETURN_GENERATED_KEYS))
		{
			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getLastName());
			preparedStatement.setString(3, user.getEmailId());
			preparedStatement.setString(4, user.getPassword());
			preparedStatement.setInt(5, user.getAge());
			preparedStatement.setString(6, user.getGender());
			preparedStatement.setString(7, user.getUserType());
			preparedStatement.setString(8, user.getUserRole());
			java.sql.Date mysqlDatedob = new Date(user.getDob().getTime());
			preparedStatement.setDate(9, mysqlDatedob);
			java.sql.Date mysqlDateregister = new Date(user.getRegisterDate().getTime());
			preparedStatement.setDate(10, mysqlDateregister);
			//int i=preparedStatement.executeUpdate();
			int i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			if(resultSet.next())	
				userid=resultSet.getInt(1);
//			System.out.println("User id"+userid);
		}
		return userid;
	}

	@Override
	public int userRegistrationDetails(Connection connection, User u, int userid) throws SQLException {
		String insertUserDetails="insert into user_bmi_history_details(i_user_id, "
				+ "i_height, f_weight, i_activity_id, "
				+ "f_bmi, i_daily_calories, i_diet_id, c_medical_condition, c_allergy, d_updated_date) values(?,?,?,?,?,?,?,?,?,curdate())";
		try(PreparedStatement preparedStatement=connection.prepareStatement(insertUserDetails))
		{
			preparedStatement.setInt(1, userid);
			preparedStatement.setInt(2, u.getHeight());
			preparedStatement.setFloat(3, u.getWeight());
			preparedStatement.setFloat(4, u.getActivityId());
			preparedStatement.setFloat(5, u.getBmi());
			preparedStatement.setInt(6, u.getDailyCalories());
			preparedStatement.setInt(7, u.getDietcategory());
			preparedStatement.setString(8, u.getMedicalConditionIds());
			preparedStatement.setString(9, u.getAllergy());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public User userLogin(Connection connection, String email, String password) throws SQLException {
		String loginQuery="select * from user_details where c_email = ? AND c_password = ?";
		User user = new User();
		try(PreparedStatement preparedStatement=connection.prepareStatement(loginQuery))
		{
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					user.setUserId(resultSet.getInt("i_user_id"));
					user.setFirstName(resultSet.getString("c_first_name"));
					user.setLastName(resultSet.getString("c_last_name"));
					user.setEmailId(resultSet.getString("c_email"));
					user.setAge(resultSet.getInt("i_age"));
					user.setGender(resultSet.getString("c_gender"));
					user.setUserType(resultSet.getString("c_user_type"));
					user.setUserRole(resultSet.getString("c_role"));
					user.setDob(resultSet.getDate("d_birthdate"));
					user.setRegisterDate(resultSet.getDate("d_register_date"));
				}
			}
		}
		return user;
	}

	@Override
	public String getPassword(Connection connection, String email) throws SQLException {
		String getPassword="select c_password from user_details where c_email=?";
		String password=null;
		try(PreparedStatement preparedStatement = connection.prepareStatement(getPassword))
		{
			preparedStatement.setString(1, email);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					password=resultSet.getString(1);
				}
			}
			
		}
		return password;
	}

	@Override
	public int getUserCalories(Connection connection, int userId) throws SQLException {
		int cal=0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectcalbyid))
		{
			preparedStatement.setInt(1, userId);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					cal=resultSet.getInt(1);
				}
			}
		}
		return cal;
	}

	@Override
	public User getUserDetailsForMeal(Connection connection, int userId) throws SQLException {
		User u = new User();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectuserhistorybyid))
		{
			preparedStatement.setInt(1, userId);
			preparedStatement.setInt(2, userId);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				//i_user_id, i_height, f_weight, i_activity_id, f_bmi, 
				//i_daily_calories, i_diet_id, i_medical_condition_id, d_updated_date
				while(resultSet.next())
				{
					u.setHeight(resultSet.getInt("i_height"));
					u.setWeight(resultSet.getFloat("f_weight"));
					u.setActivityId(resultSet.getFloat("i_activity_id"));
					u.setBmi(resultSet.getFloat("f_bmi"));
					u.setDailyCalories(resultSet.getInt("i_daily_calories"));
					u.setDietcategory(resultSet.getInt("i_diet_id")); 
					u.setMedicalConditionIds(resultSet.getString("c_medical_condition"));
					u.setAllergy(resultSet.getString("c_allergy"));
				}
			}
		}
		return u;
	}

	@Override
	public User getUserProfile(Connection connection, int userid) throws SQLException {
		User u = new User();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectuserProfile))
		{
			preparedStatement.setInt(1, userid);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					u.setUserId(resultSet.getInt("i_user_id"));
					u.setFirstName(resultSet.getString("c_first_name"));
					u.setLastName(resultSet.getString("c_last_name"));
					u.setEmailId(resultSet.getString("c_email"));
					u.setPassword(resultSet.getString("c_password"));
					u.setAge(resultSet.getInt("i_age"));
					u.setGender(resultSet.getString("c_gender"));
					u.setUserType(resultSet.getString("c_user_type"));
					u.setUserRole(resultSet.getString("c_role"));
					u.setDob(resultSet.getDate("d_birthdate"));
					u.setRegisterDate(resultSet.getDate("d_register_date"));
				}
			}
		}
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectuserhistorybyid))
		{
			preparedStatement.setInt(1, userid);
			preparedStatement.setInt(2, userid);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				//i_user_id, i_height, f_weight, i_activity_id, f_bmi, 
				//i_daily_calories, i_diet_id, i_medical_condition_id, d_updated_date
				while(resultSet.next())
				{
					u.setHeight(resultSet.getInt("i_height"));
					u.setWeight(resultSet.getFloat("f_weight"));
					u.setActivityId(resultSet.getFloat("i_activity_id"));
					u.setBmi(resultSet.getFloat("f_bmi"));
					u.setDailyCalories(resultSet.getInt("i_daily_calories"));
					u.setDietcategory(resultSet.getInt("i_diet_id")); 
					u.setMedicalConditionIds(resultSet.getString("c_medical_condition"));
					u.setAllergy(resultSet.getString("c_allergy"));
				}
			}
		}
		return u;
	}

	@Override
	public String getUserName(Connection connection, int id) throws SQLException {
		String name = "";
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectuserName))
		{
			preparedStatement.setInt(1, id);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					name = resultSet.getString(1);
				}
			}
		}
		return name;
	}

	@Override
	public int checkNewUser(Connection connection, String email) throws SQLException {
		int number = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(checknewUser))
		{
			preparedStatement.setString(1, email);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					number = resultSet.getInt(1);
				}
			}
		}
		return number;
	}

	@Override
	public int newDiabetesRegister(Connection connection, User u, int userid) throws SQLException {
		// TODO Auto-generated method stub
		int number = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(diabetesinsertQuery))
		{
			preparedStatement.setInt(1, userid);
			preparedStatement.setInt(2, u.getBloodsugar());
			java.sql.Date mysqlDateregister = new Date(u.getRegisterDate().getTime());
			preparedStatement.setDate(3, mysqlDateregister);
			number = preparedStatement.executeUpdate();
		}
		return number;
	}

	@Override
	public int checkUserPassword(Connection connection, String email, String pass) throws SQLException {
		int number = 0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(checkUserPasswordString))
		{
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, pass);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					number = resultSet.getInt(1);
				}
			}
		}
		return number;
	}

	@Override
	public int changePremiumUser(Connection connection, int userid) throws SQLException {
		int i =0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(changetoPremiumUser))
		{
			System.out.println("DAo USER ID : "+userid);
			preparedStatement.setInt(1, userid);
			i = preparedStatement.executeUpdate();
		}
		return i;
	}

	@Override
	public int updateGenInfo(Connection connection, User u) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(updateGenInfoQuery)) {
			preparedStatement.setString(1, u.getFirstName());
			preparedStatement.setString(2, u.getLastName());
			preparedStatement.setString(3, u.getEmailId());
			preparedStatement.setInt(4, u.getUserId());
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int changeToFree(Connection connection, int userId) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(changeToFree))
		{
			preparedStatement.setInt(1, userId);
			return preparedStatement.executeUpdate();
		}
	}

	@Override
	public int getTodayWater(Connection connection, int userId) throws SQLException {
		int glass=0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(todayWater))
		{
			preparedStatement.setInt(1, userId);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					glass= resultSet.getInt(1);
				}
			}
		}
		return glass;
	}

	@Override
	public int getTodayMeal(Connection connection, int userId, String mealtype) throws SQLException {
		int cal=0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(todayMeal))
		{
			preparedStatement.setString(1, mealtype);
			preparedStatement.setInt(2, userId);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					cal = resultSet.getInt(1);
				}
			}
		}
		return cal;
	}

	@Override
	public int getTodayExercise(Connection connection, int userId) throws SQLException {
		int cal=0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(todayExercise))
		{
			preparedStatement.setInt(1, userId);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					cal = resultSet.getInt(1);
				}
			}
		}
		return cal;
	}

	@Override
	public int getTodayIntake(Connection connection, int userId, int day) throws SQLException {
		int cal=0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(todayTotalCal))
		{
			preparedStatement.setInt(1, userId);
			preparedStatement.setInt(2, day);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					cal = resultSet.getInt(1);
				}
			}
		}
		return cal;
	}

	@Override
	public int getTodayBurned(Connection connection, int userId, int day) throws SQLException {
		int cal=0;
		try(PreparedStatement preparedStatement = connection.prepareStatement(todayBurned))
		{
			preparedStatement.setInt(1, userId);
			preparedStatement.setInt(2, day);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					cal = resultSet.getInt(1);
				}
			}
		}
		return cal;
	}


}
