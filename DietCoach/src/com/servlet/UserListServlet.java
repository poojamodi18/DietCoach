package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.User;
import com.dao.impl.AdminDaoImpl;
import com.service.AdminService;
import com.service.impl.AdminServiceImpl;

/**
 * Servlet implementation class UserListServlet
 */
public class UserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminService adminService = new AdminServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<User> users = adminService.getUserDetails();
		request.setAttribute("userlist", users);
		System.out.println("List Size:"+users.size());
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("tables.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
