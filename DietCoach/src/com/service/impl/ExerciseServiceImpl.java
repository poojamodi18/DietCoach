package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Exercise;
import com.dao.ExerciseDao;
import com.dao.impl.ExerciseDaoImpl;
import com.service.ExerciseService;
import com.utility.CommonUtility;

public class ExerciseServiceImpl implements ExerciseService{
	ExerciseDao exerciseDao = new ExerciseDaoImpl();
	@Override
	public ArrayList<Exercise> displayAllExercise() {
		ArrayList<Exercise> exercises = new ArrayList<Exercise>();
		try(Connection connection = CommonUtility.getconnection())
		{
			exercises = exerciseDao.getExerciseList(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return exercises;
	}
	@Override
	public Exercise getExerciseByID(int id) {
		Exercise exercise = new Exercise();
		try(Connection connection=CommonUtility.getconnection())
		{
			exercise = exerciseDao.getExerciseById(connection,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return exercise;
	}
	@Override
	public int updateExercise(Exercise exercise) {
		try(Connection connection = CommonUtility.getconnection()){
			return exerciseDao.updateExercise(connection,exercise);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int insertExercise(Exercise exercise) {
		try(Connection connection = CommonUtility.getconnection()){
			return exerciseDao.insertExercise(connection,exercise);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
