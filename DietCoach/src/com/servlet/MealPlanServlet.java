package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Food;
import com.beans.User;
import com.google.gson.Gson;
import com.service.FoodService;
import com.service.UserService;
import com.service.impl.FoodServiceImpl;
import com.service.impl.UserServiceImpl;
import com.utility.BmiAndCaloryCalculator;
import com.utility.MealType;

/**
 * Servlet implementation class MealPlanServlet
 */
public class MealPlanServlet extends HttpServlet {

	FoodService foodservice = new FoodServiceImpl();
	UserService userService = new UserServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MealPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			user = (User)session.getAttribute("userlogin");
		}
		User u = userService.getDailyCalories(user.getUserId());
		int userid = user.getUserId();
		float waterintake =BmiAndCaloryCalculator.waterIntakeLiter(user.getAge(), u.getWeight());
		ArrayList<Food> foodList = new ArrayList<Food>();
		if(u.getAllergy().length()<2) {
			foodList = foodservice.getFood(u.getDietcategory());
		}
		else {
			foodList = foodservice.getFoodwithoutAllegy(u.getAllergy(),u.getDietcategory());
		}

		Gson gson = new Gson();
		String foodListString = gson.toJson(foodList);
		request.setAttribute("allFoodList", foodListString);
		List<String> breakFastCombinationList = foodservice.getBreakfastList(foodList, u,MealType.BREAKFAST.getMealCharCode());
		List<String> lunchCombinationList = foodservice.getBreakfastList(foodList, u, MealType.LUNCH.getMealCharCode()); 
		List<String> snackCombinations = foodservice.getBreakfastList(foodList, u, MealType.SNACK.getMealCharCode());
		List<String> dinnerCombinations = foodservice.getBreakfastList(foodList, u, MealType.DINNER.getMealCharCode());
		
		
		String breakFastCombinationJsonString = gson.toJson(breakFastCombinationList);
		String lunchCombinationJsonString = gson.toJson(lunchCombinationList);
		String snackCombinationJsonString = gson.toJson(snackCombinations);
		String dinnerCombinationJsonString = gson.toJson(dinnerCombinations);
		String waterIntakeJsonString = gson.toJson(waterintake);
		String userIdJsonString = gson.toJson(userid);
		
		request.setAttribute("breakFastCombinations", breakFastCombinationJsonString);
		request.setAttribute("lunchCombinations", lunchCombinationJsonString);
		request.setAttribute("dinnerCombinations", dinnerCombinationJsonString);
		request.setAttribute("snackCombinations", snackCombinationJsonString);
		request.setAttribute("waterIntake", waterIntakeJsonString);
		request.setAttribute("userId", userIdJsonString);
		RequestDispatcher requestDispatcher = null;
		if(user.getUserType().equalsIgnoreCase("Premium")) {
			requestDispatcher=request.getRequestDispatcher("Mealplan.jsp");
			requestDispatcher.forward(request, response);
		}
		else {
			requestDispatcher=request.getRequestDispatcher("MealplanFree.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
