package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.User;
import com.service.AdminService;
import com.service.UserService;
import com.service.impl.AdminServiceImpl;
import com.service.impl.UserServiceImpl;

/**
 * Servlet implementation class UserPasswordServlet
 */
public class UserPasswordServlet extends HttpServlet {
	UserService service = new UserServiceImpl();
	AdminService adminService = new AdminServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPasswordServlet() {
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
		int userid = user.getUserId();
		User u = service.getUserProfile(userid);
		request.setAttribute("user", u);
		RequestDispatcher dispatcher = null;
		if(u.getUserType().equalsIgnoreCase("Free")) {
			dispatcher = request.getRequestDispatcher("UserFreePassword.jsp");
		}
		else {
			dispatcher = request.getRequestDispatcher("UserPassword.jsp");
		}
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = new User();
		user.setEmailId(request.getParameter("mail"));
		System.out.println(user.getEmailId()+" Email of user");
		user.setPassword(request.getParameter("pass"));
		int i=adminService.updatePassword(user);
		if(i>0) {
			response.sendRedirect("UserProfileServlet");
		}else {
			response.sendRedirect("UserProfileServlet");
		}
	}

}
