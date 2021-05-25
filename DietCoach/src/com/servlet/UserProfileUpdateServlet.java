package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.User;
import com.service.UserService;
import com.service.impl.UserServiceImpl;

/**
 * Servlet implementation class UserProfileUpdateServlet
 */
public class UserProfileUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserService service = new UserServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User u = new User();
		u.setUserId(Integer.parseInt(request.getParameter("userid")));
		u.setFirstName(request.getParameter("fname"));
		u.setLastName(request.getParameter("lname"));
		u.setEmailId(request.getParameter("email"));
		int i = service.updateUserGenInfo(u);
		u.setAge(Integer.parseInt(request.getParameter("age")));
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
		Date date1 = new Date();
		u.setRegisterDate(date1);
		if(i>0) {
			int j=service.UpdateUserBMIInfo(u);
		}
		response.sendRedirect("UserProfileServlet");
	}

}
