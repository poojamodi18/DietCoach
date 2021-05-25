package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

/**
 * Servlet implementation class UserGetTodayIntakeServlet
 */
public class UserGetTodayIntakeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService service = new UserServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserGetTodayIntakeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = new User();
		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			user = (User)session.getAttribute("userlogin");
		}
		String mealtype = request.getParameter("type");
		int cal = service.getTodayMealCalorie(user.getUserId(),mealtype);
		response.setContentType("text/plain");
		response.getWriter().write(String.valueOf(cal));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			user = (User)session.getAttribute("userlogin");
		}
		int glass = service.getTodayWaterintake(user.getUserId());
		response.setContentType("text/plain");
		response.getWriter().write(String.valueOf(glass));
	}

}
