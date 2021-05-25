package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.User;
import com.service.AdminService;
import com.service.impl.AdminServiceImpl;

/**
 * Servlet implementation class UserProfileUpdate
 */
public class UserProfileUpdate extends HttpServlet {
	AdminService adminService = new AdminServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileUpdate() {
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
		User user = new User();
		user.setUserId(Integer.parseInt(request.getParameter("id")));
		user.setFirstName(request.getParameter("fname"));
		user.setLastName(request.getParameter("lname"));
		user.setEmailId(request.getParameter("email"));
		User u = adminService.updateUser(user);
		response.sendRedirect("UserListServlet");
	}

}
