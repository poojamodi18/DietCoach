package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.DailyIntake;
import com.dao.DailyIntakeDao;
import com.dao.impl.DailyIntakeDaoImpl;
import com.service.DailyIntakeService;
import com.utility.CommonUtility;

public class DailyIntakeServiceImpl implements DailyIntakeService{
	DailyIntakeDao dailyIntakeDao = new DailyIntakeDaoImpl();
	@Override
	public ArrayList<DailyIntake> getUserTodayIntake(int userId) {
		try(Connection connection = CommonUtility.getconnection()){
			return dailyIntakeDao.getUserTodayIntake(connection,userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public void addUserIntake(DailyIntake dailyIntake) {
		try(Connection connection = CommonUtility.getconnection()){
			dailyIntakeDao.InsertUserTodayIntake(connection,dailyIntake);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
