package com.beans;

public class MealPlan {
	private int mealplanId;
	private int userid;
	private String breakfast;
	private String lunch;
	private String dinner;
	private String snack;
	private String date;
	
	@Override
	public String toString() {
		return "MealPlan [mealplanId=" + mealplanId + ", userid=" + userid + ", breakfast=" + breakfast + ", lunch="
				+ lunch + ", dinner=" + dinner + ", snack=" + snack + ", date=" + date + "]";
	}
	public int getMealplanId() {
		return mealplanId;
	}
	public void setMealplanId(int mealplanId) {
		this.mealplanId = mealplanId;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}
	public String getLunch() {
		return lunch;
	}
	public void setLunch(String lunch) {
		this.lunch = lunch;
	}
	public String getDinner() {
		return dinner;
	}
	public void setDinner(String dinner) {
		this.dinner = dinner;
	}
	public String getSnack() {
		return snack;
	}
	public void setSnack(String snack) {
		this.snack = snack;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
