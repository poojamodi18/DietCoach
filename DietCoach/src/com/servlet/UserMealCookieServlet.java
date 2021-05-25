package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.MealPlan;
import com.beans.User;
import com.service.MealPlanService;
import com.service.impl.MealPlanServiceImpl;

/**
 * Servlet implementation class UserMealCookieServlet
 */
public class UserMealCookieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    MealPlanService mealPlanService = new MealPlanServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserMealCookieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MealPlan mealPlan = new MealPlan();
		mealPlan.setBreakfast(request.getParameter("breakfast").substring(2));
		mealPlan.setLunch(request.getParameter("lunch").substring(2));
		mealPlan.setDinner(request.getParameter("dinner").substring(2));
		mealPlan.setSnack(request.getParameter("snack").substring(2));
		mealPlan.setUserid(Integer.parseInt(request.getParameter("userId")));
		mealPlanService.checkAndInsert(mealPlan);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
