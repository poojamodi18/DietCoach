package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.FoodRecipes;
import com.dao.FoodDao;
import com.dao.FoodRecipesDao;
import com.dao.impl.FoodDaoImpl;
import com.dao.impl.FoodRecipesDaoImpl;
import com.service.FoodRecipesService;
import com.utility.CommonUtility;

public class FoodRecipesServiceImpl implements FoodRecipesService{
	FoodRecipesDao recipeDao = new FoodRecipesDaoImpl();
	FoodDao foodDao = new FoodDaoImpl();
	@Override
	public ArrayList<FoodRecipes> getRecipe() {
		try(Connection connection=CommonUtility.getconnection())
		{
			return recipeDao.getFoodRecipe(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public void removeFoodRecipe(int id) {
		try(Connection connection = CommonUtility.getconnection())
		{
			int deleterow=recipeDao.deleteFoodRecipe(connection,id);
			if(deleterow>0)
			{
				System.out.println("recipe deleted");
			}
			else
			{
				System.out.println("recipe deletion failed");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public FoodRecipes getRecipeDetailsById(int id) {
		FoodRecipes foodRecipes = new FoodRecipes();
		try(Connection connection = CommonUtility.getconnection())
		{
			foodRecipes=recipeDao.fetchRecipeByID(connection,id);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return foodRecipes;
	}
	@Override
	public String addRecipe(FoodRecipes foodRecipes) {
		String message = "";
		try(Connection connection = CommonUtility.getconnection())
		{
			connection.setAutoCommit(false);
			int id=recipeDao.addRecipe(connection,foodRecipes);
			System.out.println("Recipe ID:"+id);
			if(id>0) {
				int i=foodDao.addRecipeId(connection,foodRecipes.getFoodId(),id);
				if(i>0) {
					connection.setAutoCommit(true);
					message="Inserted";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return message;
	}
	@Override
	public int updateRecipe(FoodRecipes foodRecipes) {
		try(Connection connection = CommonUtility.getconnection())
		{
			return recipeDao.updateRecipe(connection,foodRecipes);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
