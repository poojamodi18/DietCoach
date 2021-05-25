package com.beans;

public class MedicalCondition {
	private int medicalID;
	private String medicalConditionName;
	public String getMedicalConditionName() {
		return medicalConditionName;
	}
	public void setMedicalConditionName(String medicalConditionName) {
		this.medicalConditionName = medicalConditionName;
	}
	public int getMedicalID() {
		return medicalID;
	}
	public void setMedicalID(int medicalID) {
		this.medicalID = medicalID;
	}
	@Override
	public String toString() {
		return "MedicalCondition [medicalID=" + medicalID + ", medicalConditionName=" + medicalConditionName + "]";
	}
	
}
