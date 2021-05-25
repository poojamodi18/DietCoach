package com.service;

import java.util.ArrayList;

import com.beans.User;

public interface AdminService {
	public ArrayList<User> getUserDetails();

	public String deleteUser(int i);

	public User updateUser(User user);

	public User getAdminProfile(int userid);

	public int updatePassword(User user);

	public void addNewAdmin(User u);

	public ArrayList<User> getDeletedUser();

	public String activateUser(int userid);

	public int getTotaltypeUsernumber(String type);

	public int getTotalMonthUsernumber(int year, int month);

	public int getTodayUsernumber();

	public int getIncomeBytype(String type);

	public int getMonthIncome(int year, int month);

	public int getTodayIncome();
}
