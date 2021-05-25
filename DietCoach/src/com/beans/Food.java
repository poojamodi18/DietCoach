package com.beans;

import java.io.InputStream;

public class Food 
{
	private int foodid;
	private String foodname;
	private String mealtype;
	private String submealtype;
	private int dietid;
	private int calories;
	private float carbs;
	private float protein;
	private float sugar;
	private float fat;
	private float fiber;
	private String nutritionalInfo;
	private int quantity;
	private String servingType;
	private InputStream foodImageInputStream;
	private String foodImageString;
	private int isactive;
	private int foodrecipeId;
	@Override
	public String toString() {
		return "Food [foodid=" + foodid + ", foodname=" + foodname + ", mealtype=" + mealtype + ", submealtype="
				+ submealtype + ", dietid=" + dietid + ", calories=" + calories + ", carbs=" + carbs + ", protein="
				+ protein + ", sugar=" + sugar + ", fat=" + fat + ", fiber=" + fiber + ", nutritionalInfo="
				+ nutritionalInfo + ", quantity=" + quantity + ", servingType=" + servingType
				+ ", foodImageInputStream=" + foodImageInputStream + ", foodImageString=" + foodImageString
				+ ", isactive=" + isactive + ", foodrecipeId=" + foodrecipeId + "]";
	}
	public String getNutritionalInfo() {
		return nutritionalInfo;
	}
	public void setNutritionalInfo(String nutritionalInfo) {
		this.nutritionalInfo = nutritionalInfo;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getServingType() {
		return servingType;
	}
	public void setServingType(String servingType) {
		this.servingType = servingType;
	}
	public InputStream getFoodImageInputStream() {
		return foodImageInputStream;
	}
	public void setFoodImageInputStream(InputStream foodImageInputStream) {
		this.foodImageInputStream = foodImageInputStream;
	}
	public String getFoodImageString() {
		return foodImageString;
	}
	public void setFoodImageString(String foodImageString) {
		this.foodImageString = foodImageString;
	}
	public int getFoodid() {
		return foodid;
	}
	public void setFoodid(int foodid) {
		this.foodid = foodid;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public String getMealtype() {
		return mealtype;
	}
	public void setMealtype(String mealtype) {
		this.mealtype = mealtype;
	}
	public int getDietid() {
		return dietid;
	}
	public void setDietid(int dietid) {
		this.dietid = dietid;
	}
	public int getCalories() {
		return calories;
	}
	public void setCalories(int calories) {
		this.calories = calories;
	}
	public float getCarbs() {
		return carbs;
	}
	public void setCarbs(float carbs) {
		this.carbs = carbs;
	}
	public float getProtein() {
		return protein;
	}
	public void setProtein(float protein) {
		this.protein = protein;
	}
	public float getSugar() {
		return sugar;
	}
	public void setSugar(float sugar) {
		this.sugar = sugar;
	}
	public float getFat() {
		return fat;
	}
	public void setFat(float fat) {
		this.fat = fat;
	}
	public float getFiber() {
		return fiber;
	}
	public void setFiber(float fiber) {
		this.fiber = fiber;
	}
	public int getIsactive() {
		return isactive;
	}
	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}
	public String getSubmealtype() {
		return submealtype;
	}
	public void setSubmealtype(String submealtype) {
		this.submealtype = submealtype;
	}
	public int getFoodrecipeId() {
		return foodrecipeId;
	}
	public void setFoodrecipeId(int foodrecipeId) {
		this.foodrecipeId = foodrecipeId;
	}
	
}
