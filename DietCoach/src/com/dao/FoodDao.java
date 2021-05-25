package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Food;

public interface FoodDao {

	int insertfood(Connection connection, Food food) throws SQLException;
	public ArrayList<Food> select(Connection connection) throws SQLException;
	public int delete(Connection connection,int id) throws SQLException;
	public int update(Connection connection, Food food, String imgMessage) throws SQLException;
	public Food selectFoodbyId(Connection connection, int id) throws SQLException;
	ArrayList<Food> selectFoodByCalories(Connection connection, int cal) throws SQLException;
	int addRecipeId(Connection connection, int foodId, int id) throws SQLException;
	int insertfoodwithRecipe(Connection connection, Food food) throws SQLException;
	ArrayList<Food> selectWithoutAllergy(Connection connection, String allergy, int i, int j) throws SQLException;
	ArrayList<Food> selectwithdietcategory(Connection connection, int i, int j) throws SQLException;
	ArrayList<Food> selectwithdietcategory(Connection connection, int i, int j, int k) throws SQLException;
	ArrayList<Food> selectWithoutAllergy(Connection connection, String allergy, int i, int j, int k) throws SQLException;
}
