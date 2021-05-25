package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.FeedbackService;
import com.service.impl.FeedbackServiceImpl;

/**
 * Servlet implementation class DeleteUserFeedbackServlet
 */
public class DeleteUserFeedbackServlet extends HttpServlet {
	FeedbackService feedbackService = new FeedbackServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserFeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int fid = Integer.parseInt(request.getParameter("id"));
		int i = feedbackService.deleteFeedback(fid);
		if(i>0) {
			response.sendRedirect("DisplayUserFeedbackServlet");
		}else {
			response.sendRedirect("DisplayUserFeedbackServlet");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
