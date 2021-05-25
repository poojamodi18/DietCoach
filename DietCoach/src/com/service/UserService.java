package com.service;

import com.beans.User;

public interface UserService {

	int userRegister(User u);

	User loginUser(String email, String password);

	void forgotPassword(String email);

	User getDailyCalories(int parseInt);

	User getUserProfile(int userid);

	String getUserName(int id);

	String checkNewUser(String email);

	String checkOldUser(String email);

	String checkUserPassword(String pass, String email);

	void addPremiumUser(User user);

	int updateUserGenInfo(User u);

	int UpdateUserBMIInfo(User u);

	void changeToFree(User user);

	int getTodayWaterintake(int userId);

	int getTodayMealCalorie(int userId, String mealtype);

	int getTodayExerciseCalorie(int userId);

	int getTodayIntakeCal(int userId, int day);

	int getTodayBurendCal(int userId, int day);

}
