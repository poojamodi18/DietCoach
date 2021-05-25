package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Feedback;
import com.dao.FeedbackDao;

public class FeedbackDaoImpl implements FeedbackDao{
	String insertQuery = "insert into feedback (user_id, c_user_name, descripton, ratings) values(?,?,?,?);";
	String selectAll = "select * from feedback;";
	String deletebyid = "DELETE FROM feedback WHERE feedback_id = ?;";
	@Override
	public int addUserFeedback(Connection connection, Feedback feedback) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(insertQuery))
		{
			preparedStatement.setInt(1, feedback.getUserid());
			preparedStatement.setString(2, feedback.getUsername());
			preparedStatement.setString(3, feedback.getFeedback());
			preparedStatement.setInt(4, feedback.getRating());
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public ArrayList<Feedback> selectAllFeedback(Connection connection) throws SQLException {
		ArrayList<Feedback> list = new ArrayList<Feedback>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectAll))
		{
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					Feedback feedback = new Feedback();
					feedback.setId(resultSet.getInt("feedback_id"));
					feedback.setUserid(resultSet.getInt("user_id"));
					feedback.setUsername(resultSet.getString("c_user_name"));
					feedback.setFeedback(resultSet.getString("descripton"));
					feedback.setRating(resultSet.getInt("ratings"));
					list.add(feedback);
				}
			}
		}
		return list;
	}
	@Override
	public int deleteFeedback(Connection connection, int fid) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(deletebyid))
		{
			preparedStatement.setInt(1, fid);
			return preparedStatement.executeUpdate();
		}
	}

}
