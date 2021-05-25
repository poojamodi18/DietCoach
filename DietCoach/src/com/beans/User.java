package com.beans;

import java.util.Date;

public class User {
	private int userId;
	private String firstName;
	private String lastName;
	private String emailId;
	private String password;
	private int age;
	private String gender;
	private int height;
	private float weight;
	private String userType;
	private String userRole;
	private float activityId;
	private String weightChoice;
	private float bmi;
	private int dailyCalories;
	private String medicalConditionIds;
	private int dietcategory;
	private Date dob;
	private Date registerDate;
	private int bloodsugar;
	private String allergy;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public float getActivityId() {
		return activityId;
	}
	public void setActivityId(float activityId) {
		this.activityId = activityId;
	}
	public String getWeightChoice() {
		return weightChoice;
	}
	public void setWeightChoice(String weightChoice) {
		this.weightChoice = weightChoice;
	}
	public float getBmi() {
		return bmi;
	}
	public void setBmi(float bmi) {
		this.bmi = bmi;
	}
	public int getDailyCalories() {
		return dailyCalories;
	}
	public void setDailyCalories(int dailyCalories) {
		this.dailyCalories = dailyCalories;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", firstName=" + firstName + ", lastName=" + lastName + ", emailId=" + emailId
				+ ", password=" + password + ", age=" + age + ", gender=" + gender + ", height=" + height + ", weight="
				+ weight + ", userType=" + userType + ", userRole=" + userRole + ", activityId=" + activityId
				+ ", weightChoice=" + weightChoice + ", bmi=" + bmi + ", dailyCalories=" + dailyCalories
				+ ", medicalConditionIds=" + medicalConditionIds + ", dietcategory=" + dietcategory + ", dob=" + dob
				+ ", registerDate=" + registerDate + ", bloodsugar=" + bloodsugar + ", allergy=" + allergy + "]";
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	public int getDietcategory() {
		return dietcategory;
	}
	public void setDietcategory(int dietcategory) {
		this.dietcategory = dietcategory;
	}
	public String getMedicalConditionIds() {
		return medicalConditionIds;
	}
	public void setMedicalConditionIds(String medicalConditionIds) {
		this.medicalConditionIds = medicalConditionIds;
	}
	public int getBloodsugar() {
		return bloodsugar;
	}
	public void setBloodsugar(int bloodsugar) {
		this.bloodsugar = bloodsugar;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	
}
