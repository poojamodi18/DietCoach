package com.beans;

public class DailyIntake {
	private int intakeId;
	private int userId;
	private String mealtype;
	private int foodid;
	private int quantity;
	private String date;
	private int calorie;
	@Override
	public String toString() {
		return "DailyIntake [intakeId=" + intakeId + ", userId=" + userId + ", mealtype=" + mealtype + ", foodid="
				+ foodid + ", quantity=" + quantity + ", date=" + date + ", calorie=" + calorie + "]";
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getMealtype() {
		return mealtype;
	}
	public void setMealtype(String mealtype) {
		this.mealtype = mealtype;
	}
	public int getFoodid() {
		return foodid;
	}
	public void setFoodid(int foodid) {
		this.foodid = foodid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getIntakeId() {
		return intakeId;
	}
	public void setIntakeId(int intakeId) {
		this.intakeId = intakeId;
	}
	public int getCalorie() {
		return calorie;
	}
	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}
	
}
