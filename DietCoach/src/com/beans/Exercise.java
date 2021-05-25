package com.beans;

public class Exercise {
	private int exerciseId;
	private String name;
	private int calories;
	private int minutes;
	public int getExerciseId() {
		return exerciseId;
	}
	public void setExerciseId(int exerciseId) {
		this.exerciseId = exerciseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCalories() {
		return calories;
	}
	public void setCalories(int calories) {
		this.calories = calories;
	}
	public int getMinutes() {
		return minutes;
	}
	public void setMinutes(int minutes) {
		this.minutes = minutes;
	}
	@Override
	public String toString() {
		return "Exercise [exerciseId=" + exerciseId + ", name=" + name + ", calories=" + calories + ", minutes="
				+ minutes + "]";
	}
	
}
