package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Feedback;

public interface FeedbackDao {

	int addUserFeedback(Connection connection, Feedback feedback) throws SQLException;

	ArrayList<Feedback> selectAllFeedback(Connection connection) throws SQLException;

	int deleteFeedback(Connection connection, int fid) throws SQLException;

}
