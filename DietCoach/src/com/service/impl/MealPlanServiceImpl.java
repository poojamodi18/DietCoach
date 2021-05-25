package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;

import com.beans.MealPlan;
import com.dao.MealPlanDao;
import com.dao.impl.MealPlanDaoImpl;
import com.service.MealPlanService;
import com.utility.CommonUtility;

public class MealPlanServiceImpl implements MealPlanService{
	MealPlanDao mealPlanDao = new MealPlanDaoImpl();
	@Override
	public void checkAndInsert(MealPlan mealPlan) {
		try(Connection connection = CommonUtility.getconnection()){
			int planId = mealPlanDao.chechTodayRecord(connection,mealPlan);
			if(planId>0) {
				mealPlanDao.updateUserMeal(connection,mealPlan,planId);
			}
			else if(planId==0) {
				mealPlanDao.insertUserMeal(connection,mealPlan);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	public MealPlan getUserTodayMeal(int userId) {
		try(Connection connection = CommonUtility.getconnection()){
			return mealPlanDao.getUserTodayPlan(connection,userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
