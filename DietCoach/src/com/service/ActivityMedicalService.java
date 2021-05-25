package com.service;

import java.util.ArrayList;

import com.beans.DailyActivity;
import com.beans.MedicalCondition;

public interface ActivityMedicalService {

	ArrayList<MedicalCondition> getMedicalCondition();
	public void insertMedicalCondition(MedicalCondition medicalcondition);
	void removeMedicalCondition(int id);
	public MedicalCondition selectDietById(int id);
	public void updateMedicalCondition(MedicalCondition medicalCondition);
	
	ArrayList<DailyActivity> getDailyActivity();
	MedicalCondition getByIdMedicalCondition(int id);

}
