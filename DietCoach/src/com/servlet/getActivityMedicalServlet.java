package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.DietCategory;
import com.service.ActivityMedicalService;
import com.service.impl.ActivityMedicalServiceImpl;

/**
 * Servlet implementation class getActivityMedicalServlet
 */
public class getActivityMedicalServlet extends HttpServlet {
	ActivityMedicalService activitymedicalservice=new ActivityMedicalServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getActivityMedicalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//ArrayList<DietCategory> dietcategorylist = activitymedicalservice.getMedicalCondition();
		//request.setAttribute("dietcatlist", dietcategorylist);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("InsertFood.jsp");
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
