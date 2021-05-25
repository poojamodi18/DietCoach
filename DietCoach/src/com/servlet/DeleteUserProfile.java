package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.AdminService;
import com.service.impl.AdminServiceImpl;

/**
 * Servlet implementation class DeleteUserProfile
 */
public class DeleteUserProfile extends HttpServlet {
	AdminService adminService = new AdminServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userid = Integer.parseInt(request.getParameter("id"));
		String i = adminService.deleteUser(userid);
		if(i.equalsIgnoreCase("Deleted")) {
			response.sendRedirect("UserListServlet");
		}else {
			response.sendRedirect("UserListServlet");			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
