package com.beans;

public class DailyActivity {
	private int activityID;
	private String activityName;
	private String activityDescription;
	private Float activityValue;
	public String getActivityName() {
		return activityName;
	}
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}
	public int getActivityID() {
		return activityID;
	}
	public void setActivityID(int activityID) {
		this.activityID = activityID;
	}
	@Override
	public String toString() {
		return "DailyActivity [activityID=" + activityID + ", activityName=" + activityName + "]";
	}
	public String getActivityDescription() {
		return activityDescription;
	}
	public void setActivityDescription(String activityDescription) {
		this.activityDescription = activityDescription;
	}
	public Float getActivityValue() {
		return activityValue;
	}
	public void setActivityValue(Float activityValue) {
		this.activityValue = activityValue;
	}
	
}
