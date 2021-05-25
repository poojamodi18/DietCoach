package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Feedback;
import com.beans.User;
import com.service.FeedbackService;
import com.service.UserService;
import com.service.impl.FeedbackServiceImpl;
import com.service.impl.UserServiceImpl;

/**
 * Servlet implementation class InsertFeedbackServlet
 */
public class InsertFeedbackServlet extends HttpServlet {
	FeedbackService feedbackService = new FeedbackServiceImpl();
	UserService userService = new UserServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User u = new User();
		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			u = (User)session.getAttribute("userlogin");
		}
		
		Feedback feedback = new Feedback();
		
		feedback.setUsername(u.getFirstName());
		feedback.setUserid(u.getUserId());
		feedback.setFeedback(request.getParameter("feedback"));
		feedback.setRating(Integer.parseInt(request.getParameter("rating")));
		feedbackService.addFeedback(feedback);
		if(u.getUserType().equalsIgnoreCase("Free")) {
			response.sendRedirect("InsertFeedback.jsp");
		}
		else {
			response.sendRedirect("InsertUserFeedback.jsp");
		}
	}

}
