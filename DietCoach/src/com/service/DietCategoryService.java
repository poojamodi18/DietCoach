package com.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.beans.DietCategory;
import com.beans.Food;

public interface DietCategoryService {

	void insertdietCategory(DietCategory dietcategory);
	public ArrayList<DietCategory> getDietCategory();
	public void update(DietCategory dietcategory);
	public void deleteDietCategory(int id);
	public DietCategory selectDietById(int id);
}
