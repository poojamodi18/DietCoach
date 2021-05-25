package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MedicalCondition;
import com.service.ActivityMedicalService;
import com.service.impl.ActivityMedicalServiceImpl;

/**
 * Servlet implementation class DisplayMedicalCondition
 */
public class DisplayMedicalCondition extends HttpServlet {
	ActivityMedicalService activityMedicalService = new ActivityMedicalServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayMedicalCondition() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MedicalCondition> medicalconditionlist = activityMedicalService.getMedicalCondition();
		request.setAttribute("medicalconditionlist", medicalconditionlist);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("MedicalConditionList.jsp");
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
