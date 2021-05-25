package com.beans;

public class ExerciseIntake {
	private int id;
	private int userId;
	private int exerciseId;
	private int calories;
	private int time;
	private String date;
	
	@Override
	public String toString() {
		return "ExerciseIntake [id=" + id + ", userId=" + userId + ", exerciseId=" + exerciseId + ", calories="
				+ calories + ", time=" + time + ", date=" + date + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getExerciseId() {
		return exerciseId;
	}
	public void setExerciseId(int exerciseId) {
		this.exerciseId = exerciseId;
	}
	public int getCalories() {
		return calories;
	}
	public void setCalories(int calories) {
		this.calories = calories;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
