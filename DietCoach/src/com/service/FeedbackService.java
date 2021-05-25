package com.service;

import java.util.ArrayList;

import com.beans.Feedback;

public interface FeedbackService {

	void addFeedback(Feedback feedback);

	ArrayList<Feedback> getAllFeedback();

	int deleteFeedback(int fid);

}
