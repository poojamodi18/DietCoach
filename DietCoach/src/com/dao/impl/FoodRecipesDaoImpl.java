package com.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.FoodRecipes;
import com.dao.FoodRecipesDao;
import com.mysql.cj.protocol.Resultset;
import com.sun.xml.internal.bind.util.Which;

public class FoodRecipesDaoImpl implements FoodRecipesDao {
	String selectQuery = "select * from food_receipe";
	String deleteQuery = "delete from food_receipe where food_receipes_id=?";
	String selectByIdQuery = "select * from food_receipe where food_receipes_id=?";
	String insertQuery = "insert into food_receipe(c_food_name,c_food_ingredients,c_receipe) values(?,?,?);";
	String updateQuery = "update food_receipe set c_food_name=?,c_food_ingredients=?,c_receipe=? where food_receipes_id=?";
	@Override
	public ArrayList<FoodRecipes> getFoodRecipe(Connection connection) throws SQLException {
		ArrayList<FoodRecipes> foodRecipes = new ArrayList<FoodRecipes>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectQuery))
		{
			try(ResultSet resultset=preparedStatement.executeQuery())
			{
				while (resultset.next()) {
					FoodRecipes fr = new FoodRecipes();
					fr.setFoodRecipeId(resultset.getInt("food_receipes_id"));
					fr.setFoodName(resultset.getString("c_food_name"));
					fr.setFoodIngredients(resultset.getString("c_food_ingredients"));
					fr.setRecipe(resultset.getString("c_receipe"));
					foodRecipes.add(fr);
				}
			}
		}
		return foodRecipes;
	}
	@Override
	public int deleteFoodRecipe(Connection connection, int id) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery))
		{
			preparedStatement.setInt(1, id);
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public FoodRecipes fetchRecipeByID(Connection connection, int id) throws Exception {
		FoodRecipes foodRecipes = new FoodRecipes();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectByIdQuery))
		{
			preparedStatement.setInt(1, id);
			try(ResultSet resultSet=preparedStatement.executeQuery())
			{
				while(resultSet.next()) {
				foodRecipes.setFoodRecipeId(resultSet.getInt("food_receipes_id"));
				foodRecipes.setFoodName(resultSet.getString("c_food_name"));
				foodRecipes.setFoodIngredients(resultSet.getString("c_food_ingredients"));
				foodRecipes.setRecipe(resultSet.getString("c_receipe"));
				}
			}
		}
		return foodRecipes;
	}
	@Override
	public int addRecipe(Connection connection, FoodRecipes foodRecipes) throws SQLException {
		int id=0;
		try(PreparedStatement preparedStatement=connection.prepareStatement(insertQuery,java.sql.Statement.RETURN_GENERATED_KEYS))
		{
			preparedStatement.setString(1, foodRecipes.getFoodName());
			preparedStatement.setString(2, foodRecipes.getFoodIngredients());
			preparedStatement.setString(3, foodRecipes.getRecipe());
			
			int i = preparedStatement.executeUpdate();
			ResultSet resultSet = preparedStatement.getGeneratedKeys();
			if(resultSet.next())	
				id=resultSet.getInt(1);
		}
		return id;
	}
	@Override
	public int updateRecipe(Connection connection, FoodRecipes foodRecipes) throws SQLException {
		try(PreparedStatement preparedStatement=connection.prepareStatement(updateQuery))
		{
			preparedStatement.setString(1, foodRecipes.getFoodName());
			preparedStatement.setString(2, foodRecipes.getFoodIngredients());
			preparedStatement.setString(3, foodRecipes.getRecipe());
			preparedStatement.setInt(4, foodRecipes.getFoodRecipeId());
			return preparedStatement.executeUpdate();
		}
	}

}
