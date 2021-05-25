package com.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.DailyActivity;
import com.beans.DietCategory;
import com.beans.MedicalCondition;
import com.dao.ActivityMedicalDao;
import com.dao.impl.ActivityMedicalDaoImpl;
import com.service.ActivityMedicalService;
import com.utility.CommonUtility;

public class ActivityMedicalServiceImpl implements ActivityMedicalService {
	CommonUtility commonutil = new CommonUtility(); 
	ActivityMedicalDao activitydao = new ActivityMedicalDaoImpl();
	@Override
	public ArrayList<MedicalCondition> getMedicalCondition() {
		ArrayList<MedicalCondition> medicalcondition = new ArrayList<MedicalCondition>();
		try(Connection connection = CommonUtility.getconnection())
		{
			medicalcondition=activitydao.selectMedicalCondition(connection);
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return medicalcondition;
	}
	public void insertMedicalCondition(MedicalCondition medicalcondition) {
		// TODO Auto-generated method stub
		try(Connection connection=commonutil.getconnection())
		{
			int i=activitydao.insertMedicalCondition(connection, medicalcondition);
			if(i>0)
			{
				System.out.println("Diet Category Inserted");
			}
			else
			{
				System.out.println("Diet Category fail to Insert");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void removeMedicalCondition(int id) {
		int deletedrows=0;
		try(Connection connection=commonutil.getconnection())
		{
			deletedrows=activitydao.delete(connection, id);
		}
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	public MedicalCondition selectDietById(int id)
	{
		MedicalCondition medicalCondition=new MedicalCondition();
		try(Connection connection=commonutil.getconnection())
		{
			medicalCondition=activitydao.selectDietById(connection, id);
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return medicalCondition;
	}

	@Override
	public void updateMedicalCondition(MedicalCondition medicalCondition) {
		int updatedrows=0;
		try(Connection connection=CommonUtility.getconnection())
		{
			updatedrows=activitydao.updateMedicalCondition(connection, medicalCondition);
			if (updatedrows>0) 
			{
				System.out.println("Updated Successfully");
			}
			else
			{
				System.out.println("Update failed");
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	@Override
	public ArrayList<DailyActivity> getDailyActivity() {
		ArrayList<DailyActivity> activities = new ArrayList<DailyActivity>();
		try(Connection connection=commonutil.getconnection())
		{
			activities=activitydao.selectDailyActivity(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return activities;
	}
	@Override
	public MedicalCondition getByIdMedicalCondition(int id) {
		MedicalCondition condition = new MedicalCondition();
		try(Connection connection = CommonUtility.getconnection())
		{
			condition=activitydao.getMedicalConditionByID(connection,id);
			System.out.println("SErvice : "+condition.getMedicalID());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return condition;
	}
	
	
	

}
