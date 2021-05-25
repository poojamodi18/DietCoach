package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.ExerciseIntake;
import com.dao.ExerciseIntakeDao;
import com.dao.impl.ExerciseIntakeDaoImpl;
import com.service.ExerciseIntakeService;
import com.utility.CommonUtility;

public class ExerciseIntakeServiceImpl implements ExerciseIntakeService{
	ExerciseIntakeDao exerciseIntakeDao = new ExerciseIntakeDaoImpl(); 
	@Override
	public void addUserIntake(ExerciseIntake exerciseIntake) {
		try(Connection connection = CommonUtility.getconnection()){
			exerciseIntakeDao.insertUserIntake(connection,exerciseIntake);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public ArrayList<ExerciseIntake> getUserTodayIntake(int userId) {
		try(Connection connection = CommonUtility.getconnection()){
			return exerciseIntakeDao.getUserIntake(connection,userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
