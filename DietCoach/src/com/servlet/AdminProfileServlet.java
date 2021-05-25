package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.User;
import com.service.AdminService;
import com.service.impl.AdminServiceImpl;

/**
 * Servlet implementation class AdminProfileServlet
 */
public class AdminProfileServlet extends HttpServlet {
	AdminService adminService = new AdminServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		User user = new User();
		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			user = (User)session.getAttribute("userlogin");
		}
		int userid = user.getUserId();
		User u = adminService.getAdminProfile(userid);
		request.setAttribute("user", u);
		RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = new User();
		user.setUserId(Integer.parseInt(request.getParameter("id")));
		user.setFirstName(request.getParameter("fname"));
		user.setLastName(request.getParameter("lname"));
		user.setEmailId(request.getParameter("email"));
		User u = adminService.updateUser(user);
		request.setAttribute("user", u);
		RequestDispatcher rdis = request.getRequestDispatcher("user.jsp");
		rdis.forward(request, response);
	}

}
