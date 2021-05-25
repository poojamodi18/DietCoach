package com.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.DailyActivity;
import com.beans.DietCategory;
import com.beans.MedicalCondition;
import com.beans.User;
import com.service.ActivityMedicalService;
import com.service.DietCategoryService;
import com.service.UserService;
import com.service.impl.ActivityMedicalServiceImpl;
import com.service.impl.DietCategoryServiceImpl;
import com.service.impl.UserServiceImpl;

/**
 * Servlet implementation class RegistrationServlet
 */
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService = new UserServiceImpl();
	DietCategoryService dietService = new DietCategoryServiceImpl();
	ActivityMedicalService activityMedicalService = new ActivityMedicalServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<DietCategory> dietcategorylist = dietService.getDietCategory();
		System.out.println(dietcategorylist);
		request.setAttribute("dietcatlist", dietcategorylist);
		ArrayList<MedicalCondition> medicalconditionlist = activityMedicalService.getMedicalCondition();
		request.setAttribute("medicalconditionlist", medicalconditionlist);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Registration.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		User u = new User();
		u.setFirstName(request.getParameter("firstname"));
		u.setLastName(request.getParameter("lastname"));
		u.setEmailId(request.getParameter("email"));
		u.setPassword(request.getParameter("password"));		
		SimpleDateFormat oldFormat = new SimpleDateFormat("MM/dd/yyyy");
		try {
			u.setDob((Date) oldFormat.parse(request.getParameter("dob")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		u.setGender(request.getParameter("gender"));
		u.setHeight(Integer.parseInt(request.getParameter("height")));
		u.setWeight(Float.valueOf(request.getParameter("weight")));
		u.setActivityId(Float.valueOf(request.getParameter("activity")));
		String medical[] = request.getParameterValues("medicalcondition"); 
		String medicalconditionid="";
		if(null!=medical)
		{
			for(String m : medical)
			{
				medicalconditionid+=m+"~";
			}
		}
		if(null!=request.getParameter("bloodsugar")) {
			u.setBloodsugar(Integer.parseInt(request.getParameter("bloodsugar")));
		}
		String allergy[]= request.getParameterValues("allergy");
		String allergyString ="";
		if(null!=allergy)
		{
			for(String a : allergy)
			{
				allergyString+=a+"~";
			}
		}
		u.setMedicalConditionIds(medicalconditionid);
		u.setDietcategory(Integer.parseInt(request.getParameter("diettype")));
		u.setAllergy(allergyString);
		System.out.println("Object birth Date : " + u.getDob());
		Date date1 = new Date();
		System.out.println("today : " + date1);
		u.setRegisterDate(date1);
		int check = userService.userRegister(u);
		if(check>0)
		{
			u.setUserId(check);
			HttpSession httpSession = request.getSession(true);
			httpSession.setAttribute("userlogin", u);
			response.sendRedirect("pricing.jsp");
		}
	}

}
