package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.MedicalCondition;
import com.service.ActivityMedicalService;
import com.service.impl.ActivityMedicalServiceImpl;

/**
 * Servlet implementation class UpdateMedcicalConditionServlet
 */
public class UpdateMedicalConditionServlet extends HttpServlet {
	ActivityMedicalService activityMedicalService = new ActivityMedicalServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMedicalConditionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("jsp id"+id);
		MedicalCondition condition = activityMedicalService.getByIdMedicalCondition(id);
		System.out.println("id "+condition.getMedicalID());
		System.out.println("id");
		request.setAttribute("condition", condition);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("EditMedicalCondition.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MedicalCondition condition = new MedicalCondition();
		condition.setMedicalID(Integer.parseInt(request.getParameter("id")));
		condition.setMedicalConditionName(request.getParameter("conditionname"));
		activityMedicalService.updateMedicalCondition(condition);
		response.sendRedirect("DisplayMedicalCondition");
	}

}
