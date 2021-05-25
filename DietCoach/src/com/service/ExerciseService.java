package com.service;

import java.util.ArrayList;

import com.beans.Exercise;

public interface ExerciseService {

	ArrayList<Exercise> displayAllExercise();

	Exercise getExerciseByID(int id);

	int updateExercise(Exercise exercise);

	int insertExercise(Exercise exercise);

}
