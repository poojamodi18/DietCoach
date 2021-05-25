package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.AdminService;
import com.service.impl.AdminServiceImpl;

/**
 * Servlet implementation class GetTotalIncome
 */
public class GetTotalIncome extends HttpServlet {
	private static final long serialVersionUID = 1L;
    AdminService adminService = new AdminServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTotalIncome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("type");
		int income = adminService.getIncomeBytype(type);
		response.setContentType("text/plain");
		response.getWriter().write(String.valueOf(income));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int income = adminService.getTodayIncome();
		response.setContentType("text/plain");
		response.getWriter().write(String.valueOf(income));
	}

}
