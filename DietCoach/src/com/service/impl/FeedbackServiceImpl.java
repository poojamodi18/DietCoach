package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Feedback;
import com.dao.FeedbackDao;
import com.dao.impl.FeedbackDaoImpl;
import com.service.FeedbackService;
import com.utility.CommonUtility;

public class FeedbackServiceImpl implements FeedbackService{
	FeedbackDao feedbackDao = new FeedbackDaoImpl();
	@Override
	public void addFeedback(Feedback feedback) {
		try(Connection connection = CommonUtility.getconnection())
		{
			int i = feedbackDao.addUserFeedback(connection,feedback);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	@Override
	public ArrayList<Feedback> getAllFeedback() {
		ArrayList<Feedback> feedbacks = new ArrayList<Feedback>();
		try(Connection connection = CommonUtility.getconnection())
		{
			feedbacks = feedbackDao.selectAllFeedback(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return feedbacks;
	}
	@Override
	public int deleteFeedback(int fid) {
		try(Connection connection = CommonUtility.getconnection())
		{
			return feedbackDao.deleteFeedback(connection,fid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
