package com.service;

import java.util.ArrayList;

import com.beans.ExerciseIntake;

public interface ExerciseIntakeService {

	void addUserIntake(ExerciseIntake exerciseIntake);

	ArrayList<ExerciseIntake> getUserTodayIntake(int userId);

}
