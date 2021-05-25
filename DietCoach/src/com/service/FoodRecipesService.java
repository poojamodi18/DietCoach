package com.service;

import java.util.ArrayList;

import com.beans.FoodRecipes;

public interface FoodRecipesService {

	ArrayList<FoodRecipes> getRecipe();

	void removeFoodRecipe(int id);

	FoodRecipes getRecipeDetailsById(int id);

	String addRecipe(FoodRecipes foodRecipes);

	int updateRecipe(FoodRecipes foodRecipes);


}
