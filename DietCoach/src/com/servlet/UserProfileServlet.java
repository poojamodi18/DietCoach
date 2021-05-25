package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
 * Servlet implementation class UserProfileServlet
 */
public class UserProfileServlet extends HttpServlet {
	UserService userService = new UserServiceImpl();
	DietCategoryService dietService = new DietCategoryServiceImpl();
	ActivityMedicalService activityMedicalService = new ActivityMedicalServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<DietCategory> dietcategorylist = dietService.getDietCategory();
		System.out.println(dietcategorylist);
		request.setAttribute("dietcatlist", dietcategorylist);
		ArrayList<MedicalCondition> medicalconditionlist = activityMedicalService.getMedicalCondition();
		request.setAttribute("medicalconditionlist", medicalconditionlist);
		User user = new User();
		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			user = (User)session.getAttribute("userlogin");
		}
		User u = userService.getUserProfile(user.getUserId());
		request.setAttribute("user", u);
		RequestDispatcher dispatcher = null;
		if(u.getUserType().equalsIgnoreCase("Free")) {
			dispatcher=request.getRequestDispatcher("UserFreeProfile.jsp");
		}
		else {
			dispatcher=request.getRequestDispatcher("UserProfile.jsp");
		}
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
