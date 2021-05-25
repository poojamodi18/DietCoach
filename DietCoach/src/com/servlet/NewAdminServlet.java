package com.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.User;
import com.service.AdminService;
import com.service.impl.AdminServiceImpl;
import com.utility.BmiAndCaloryCalculator;

/**
 * Servlet implementation class NewAdminServlet
 */
public class NewAdminServlet extends HttpServlet {
	AdminService adminService=new AdminServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User u = new User();
		u.setFirstName(request.getParameter("fname"));
		u.setLastName(request.getParameter("lname"));
		u.setEmailId(request.getParameter("email"));
		SimpleDateFormat oldFormat = new SimpleDateFormat("MM/dd/yyyy");
		try {
			u.setDob((Date) oldFormat.parse(request.getParameter("dob")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date date1 = new Date();
		System.out.println("today : " + date1);
		u.setRegisterDate(date1);
		u.setGender(request.getParameter("gender"));
		u.setPassword(request.getParameter("password"));
		u.setUserType("Admin");
		u.setUserRole("Admin");
		u.setAge(BmiAndCaloryCalculator.getAgeCalulator(u.getRegisterDate(), u.getDob()));
		adminService.addNewAdmin(u);
		response.sendRedirect("NewAdmin.jsp");
	}

}
