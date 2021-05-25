package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.DietCategory;

public interface DietCategoryDao 
{
	public int insertDietCategory(Connection connection, DietCategory dietcategory) throws SQLException;
	public ArrayList<DietCategory> selectDietCategory(Connection connection) throws SQLException;
	public int delete(Connection connection, int id) throws SQLException;
	public int updateDietCategory(Connection connection,DietCategory dietcategory) throws SQLException;
	public DietCategory selectDietById(Connection connection,int id) throws SQLException;
}
