package com.service;

import com.beans.MealPlan;

public interface MealPlanService {

	void checkAndInsert(MealPlan mealPlan);

	MealPlan getUserTodayMeal(int userId);

}
