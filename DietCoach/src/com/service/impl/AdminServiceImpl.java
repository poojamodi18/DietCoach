package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.User;
import com.dao.AdminDao;
import com.dao.impl.AdminDaoImpl;
import com.service.AdminService;
import com.utility.CommonUtility;
import com.utility.Mail;

public class AdminServiceImpl implements AdminService{
	AdminDao admindao = new AdminDaoImpl();
	@Override
	public ArrayList<User> getUserDetails() {
		ArrayList<User> userslist = new ArrayList<User>();
		try(Connection connection = CommonUtility.getconnection())
		{
			userslist=admindao.getUserList(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userslist;
	}
	@Override
	public String deleteUser(int id) {
		String message = null;
		try(Connection connection = CommonUtility.getconnection())
		{
			int value=admindao.deleteUserDetails(connection,id);
			if(value>0)
			{
				message="Deleted";
			}
			else
			{
				message="Failed";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return message;
	}
	@Override
	public User updateUser(User user) {
		String message = null;
		User u = new User();
		try(Connection connection = CommonUtility.getconnection())
		{
			int value=admindao.updateUserDetails(connection,user);
			u= admindao.getUserProfile(connection,user.getUserId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}
	@Override
	public User getAdminProfile(int userid) {
		User user = new User();
		try(Connection connection = CommonUtility.getconnection())
		{
			user = admindao.getUserProfile(connection,userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	@Override
	public int updatePassword(User user) {
		int i=0;
		try(Connection connection = CommonUtility.getconnection())
		{
			i=admindao.changePassword(connection,user);
			System.out.println("i="+i);
			if(i==1) {
				Mail.sendMail(user.getEmailId(), "Your password has been changed successfully.", "Password Changed");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public void addNewAdmin(User u) {
		try(Connection connection = CommonUtility.getconnection())
		{
			int i = admindao.insertNewAdmin(connection,u);
			if(i>0) {
				System.out.println("Mail");
				Mail.sendMail(u.getEmailId(), "Hey "+u.getFirstName()+",\nYour account as the admin of DietCoach has been created successfully.", "Welcome To Diet Coach");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	public ArrayList<User> getDeletedUser() {
		ArrayList<User> userslist = new ArrayList<User>();
		try(Connection connection = CommonUtility.getconnection())
		{
			userslist=admindao.getDeleteUserList(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userslist;
	}
	@Override
	public String activateUser(int userid) {
		String message = null;
		try(Connection connection = CommonUtility.getconnection())
		{
			int value=admindao.activateUserDetails(connection,userid);
			if(value>0)
			{
				message="Activate";
			}
			else
			{
				message="Failed";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return message;
	}
	@Override
	public int getTotaltypeUsernumber(String type) {
		try(Connection connection = CommonUtility.getconnection()){
			return admindao.getUserNumberByType(connection,type);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int getTotalMonthUsernumber(int year, int month) {
		try(Connection connection = CommonUtility.getconnection()){
			return admindao.getUserNumberByMonth(connection,year,month);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int getTodayUsernumber() {
		try(Connection connection = CommonUtility.getconnection()){
			return admindao.getTodayUserNumber(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int getIncomeBytype(String type) {
		try(Connection connection = CommonUtility.getconnection()){
			if(type.equalsIgnoreCase("all")) {
				return admindao.getTotalAllPayment(connection);
			}
			if(type.equalsIgnoreCase("plan")) {
				return admindao.getPlanPayment(connection);
			}
			if(type.equalsIgnoreCase("book")) {
				return admindao.getBookPayment(connection);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int getMonthIncome(int year, int month) {
		try(Connection connection = CommonUtility.getconnection()){
			return admindao.getIncomeByMonth(connection,year,month);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int getTodayIncome() {
		try(Connection connection = CommonUtility.getconnection()){
			return admindao.getTodayIncome(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	

}
