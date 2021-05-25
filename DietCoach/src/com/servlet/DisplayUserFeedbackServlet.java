package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Feedback;
import com.service.FeedbackService;
import com.service.impl.FeedbackServiceImpl;

/**
 * Servlet implementation class DisplayUserFeedbackServlet
 */
public class DisplayUserFeedbackServlet extends HttpServlet {
	FeedbackService feedbackService = new FeedbackServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayUserFeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Feedback> feedbacks = feedbackService.getAllFeedback();
		request.setAttribute("feedbacklist", feedbacks);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("DisplayFeedback.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
