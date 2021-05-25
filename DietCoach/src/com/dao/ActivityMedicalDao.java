package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.DailyActivity;
import com.beans.MedicalCondition;

public interface ActivityMedicalDao {

	ArrayList<MedicalCondition> selectMedicalCondition(Connection connection) throws SQLException;
	public int insertMedicalCondition(Connection connection,MedicalCondition medicalcondition) throws SQLException;
	public int delete(Connection connection, int id) throws SQLException ;
	ArrayList<DailyActivity> selectDailyActivity(Connection connection) throws SQLException;
	public int updateMedicalCondition(Connection connection,MedicalCondition medicalCondition) throws SQLException;
	
	
	public MedicalCondition selectDietById(Connection connection,int id) throws SQLException;
	MedicalCondition getMedicalConditionByID(Connection connection, int id) throws SQLException;
}
