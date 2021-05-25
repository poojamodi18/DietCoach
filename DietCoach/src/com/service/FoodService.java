package com.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.beans.Food;
import com.beans.FoodRecipes;
import com.beans.User;

public interface FoodService {

	int insertFoodDetails(Food food);
	public ArrayList<Food> getFood();
	public void delete(int id);
	public Food selectbyId(int id);
	int updateFoodDetails(Food f, String imgMessage);
	List<String> getBreakfastList(ArrayList<Food> foodList, User u, String mealtype);
	int insertFoodandReciepe(Food food, FoodRecipes foodRecipes);
	ArrayList<Food> getFoodwithoutAllegy(String allergy, int dietcategory);
	ArrayList<Food> getFood(int dietcategory);
}
