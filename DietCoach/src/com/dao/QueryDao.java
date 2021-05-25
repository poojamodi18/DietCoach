package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Query;

public interface QueryDao {

	int insertQuery(Query query, Connection connection) throws SQLException;

	ArrayList<Query> getAllQuery(Connection connection) throws SQLException;

	String insertAnswer(Connection connection, Query query) throws SQLException;

	int deleteQuery(Connection connection, int id) throws SQLException;

}
