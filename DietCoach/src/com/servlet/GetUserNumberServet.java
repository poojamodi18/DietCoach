package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.AdminService;
import com.service.impl.AdminServiceImpl;

/**
 * Servlet implementation class GetUserNumberServet
 */
public class GetUserNumberServet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminService adminService = new AdminServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserNumberServet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int users = adminService.getTotalMonthUsernumber(year,month);
		response.setContentType("text/plain");
		response.getWriter().write(String.valueOf(users));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
