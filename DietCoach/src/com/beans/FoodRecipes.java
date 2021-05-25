package com.beans;

import java.io.InputStream;

public class FoodRecipes {
	private int foodRecipeId;
	private int foodId;
	private String FoodName;
	private String foodIngredients;
	private String recipe;
	public int getFoodRecipeId() {
		return foodRecipeId;
	}
	public void setFoodRecipeId(int foodRecipeId) {
		this.foodRecipeId = foodRecipeId;
	}
	public int getFoodId() {
		return foodId;
	}
	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}
	public String getFoodName() {
		return FoodName;
	}
	public void setFoodName(String foodName) {
		FoodName = foodName;
	}
	public String getFoodIngredients() {
		return foodIngredients;
	}
	public void setFoodIngredients(String foodIngredients) {
		this.foodIngredients = foodIngredients;
	}
	public String getRecipe() {
		return recipe;
	}
	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}
	@Override
	public String toString() {
		return "FoodRecipes [foodRecipeId=" + foodRecipeId + ", foodId=" + foodId + ", FoodName=" + FoodName
				+ ", foodIngredients=" + foodIngredients + ", recipe=" + recipe + "]";
	}
}
