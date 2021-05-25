package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.FoodRecipes;

public interface FoodRecipesDao {

	ArrayList<FoodRecipes> getFoodRecipe(Connection connection) throws SQLException;

	int deleteFoodRecipe(Connection connection, int id) throws SQLException;

	FoodRecipes fetchRecipeByID(Connection connection, int id) throws Exception;

	int addRecipe(Connection connection, FoodRecipes foodRecipes) throws SQLException;

	int updateRecipe(Connection connection, FoodRecipes foodRecipes) throws SQLException;

}
