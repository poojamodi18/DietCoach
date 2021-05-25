package com.service;

import java.util.ArrayList;

import com.beans.DailyIntake;

public interface DailyIntakeService {

	ArrayList<DailyIntake> getUserTodayIntake(int userId);

	void addUserIntake(DailyIntake dailyIntake);

}
