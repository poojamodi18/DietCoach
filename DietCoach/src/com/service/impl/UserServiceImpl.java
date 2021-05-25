package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;

import com.beans.User;
import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.service.UserService;
import com.sun.org.apache.regexp.internal.recompile;
import com.utility.BmiAndCaloryCalculator;
import com.utility.CommonUtility;
import com.utility.Mail;

public class UserServiceImpl implements UserService {
	UserDao usrdao = new UserDaoImpl();
	@Override
	public int userRegister(User u) {
		int inserted=0;
		int dia = 0;
		int userid=0;
		try(Connection connection = CommonUtility.getconnection())
		{
			u.setAge(BmiAndCaloryCalculator.getAgeCalulator(u.getRegisterDate(), u.getDob()));
			u.setBmi(BmiAndCaloryCalculator.bmiCalculator(u.getWeight(), u.getHeight()));
			u.setDailyCalories(BmiAndCaloryCalculator.caloriesCalculator(u.getGender(), u.getWeight(), u.getHeight(), u.getAge(), u.getActivityId()));
			u.setUserType("Free");
			u.setUserRole("User");
			connection.setAutoCommit(false);
			userid=usrdao.userRegistration(connection,u);
			if(userid>0)
			{
				inserted=usrdao.userRegistrationDetails(connection,u,userid);
				if(u.getMedicalConditionIds().contains("2"))
				{
					dia = usrdao.newDiabetesRegister(connection,u,userid);
				}
			}
			if(inserted>0)
			{
					connection.setAutoCommit(true);
					Mail.sendMail(u.getEmailId(),"Hi "+u.getFirstName()+"\nWelcome \naccount on DietCoach has been created successfully.","Welcome to Dietcoach");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return userid;
	}
	@Override
	public User loginUser(String email, String password) {
		int rtvalue=0;
		User u = new User();
		try(Connection connection = CommonUtility.getconnection())
		{
			u=usrdao.userLogin(connection,email,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	@Override
	public void forgotPassword(String email) {
		try(Connection connection = CommonUtility.getconnection())
		{
			String password = usrdao.getPassword(connection,email);
			String text = "Password is : "+password;
			String subject = "Password";
			Mail.sendMail(email, text,subject);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public User getDailyCalories(int userId) {
		User u = new User();
		try(Connection connection = CommonUtility.getconnection())
		{
			u = usrdao.getUserDetailsForMeal(connection, userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	@Override
	public User getUserProfile(int userid) {
		User u = new User();
		try(Connection connection = CommonUtility.getconnection())
		{
			u = usrdao.getUserProfile(connection,userid);
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		return u;
	}
	@Override
	public String getUserName(int id) {
		String name="";
		try(Connection connection = CommonUtility.getconnection())
		{
			name = usrdao.getUserName(connection,id);
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		return name;
	}
	@Override
	public String checkNewUser(String email) {
		String msg="";
		try(Connection connection = CommonUtility.getconnection())
		{
			int i = usrdao.checkNewUser(connection,email);
			if(i>0) {
				msg="This email address is already in use. Please supply a different email address or Login.";
			}
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		return msg;
	}
	@Override
	public String checkOldUser(String email) {
		String msg="";
		try(Connection connection = CommonUtility.getconnection())
		{
			int i = usrdao.checkNewUser(connection,email);
			if(i==0) {
				msg="The email address that you've entered doesn't match any account, Please create new account.";
			}
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		return msg;
	}
	@Override
	public String checkUserPassword(String pass, String email) {
		String msg="";
		try(Connection connection = CommonUtility.getconnection())
		{
			int i = usrdao.checkUserPassword(connection,email,pass);
			if(i==0) {
				msg="The password that you've entered doesn't match.";
			}
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		return msg;
	}
	@Override
	public void addPremiumUser(User user) {
		// TODO Auto-generated method stub
		try(Connection connection = CommonUtility.getconnection())
		{
			int i = usrdao.changePremiumUser(connection,user.getUserId());
			if(i==1) {
				Mail.sendMail(user.getEmailId(),"Hi "+user.getFirstName()+"\nYour premium membership at dietcoach start from today, for more information login into your account using the following link : http://localhost:8080/DietPlan/Login.jsp \n","Dietcoach Premium Membership");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public int updateUserGenInfo(User u) {
		try(Connection connection = CommonUtility.getconnection()){
			return usrdao.updateGenInfo(connection,u);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int UpdateUserBMIInfo(User u) {
		int i=0;
		try(Connection connection = CommonUtility.getconnection()){
			u.setBmi(BmiAndCaloryCalculator.bmiCalculator(u.getWeight(), u.getHeight()));
			u.setDailyCalories(BmiAndCaloryCalculator.caloriesCalculator(u.getGender(), u.getWeight(), u.getHeight(), u.getAge(), u.getActivityId()));
			i = usrdao.userRegistrationDetails(connection,u,u.getUserId());
			if(u.getMedicalConditionIds().contains("2"))
			{
					int dia = usrdao.newDiabetesRegister(connection,u,u.getUserId());
			}
			if(i>0)
			{
					Mail.sendMail(u.getEmailId(),"Hi "+u.getFirstName()+"\nYour DietCoach account information has been updated successfully.","Dietcoach Account Updated");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public void changeToFree(User u) {
		try(Connection connection = CommonUtility.getconnection()){
			int i = usrdao.changeToFree(connection,u.getUserId());
			if(i>0) {
				Mail.sendMail(u.getEmailId(),"Hi "+u.getFirstName()+"\nYour Premium membership plan at Diet Coach has been expired so your account has been switched to free account. Renew your membership plan to continue as Premium account.","Dietcoach Membership Ended");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public int getTodayWaterintake(int userId) {
		try(Connection connection = CommonUtility.getconnection()){
			return usrdao.getTodayWater(connection,userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int getTodayMealCalorie(int userId, String mealtype) {
		try(Connection connection = CommonUtility.getconnection()){
			return usrdao.getTodayMeal(connection,userId,mealtype);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int getTodayExerciseCalorie(int userId) {
		try(Connection connection = CommonUtility.getconnection()){
			return usrdao.getTodayExercise(connection,userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int getTodayIntakeCal(int userId, int day) {
		try(Connection connection = CommonUtility.getconnection()){
			return usrdao.getTodayIntake(connection,userId,day);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int getTodayBurendCal(int userId, int day) {
		try(Connection connection = CommonUtility.getconnection()){
			return usrdao.getTodayBurned(connection,userId,day);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	

}
