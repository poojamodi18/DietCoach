package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.DailyIntake;
import com.beans.Exercise;
import com.beans.Food;
import com.beans.FoodRecipes;
import com.beans.MealPlan;
import com.beans.User;
import com.google.gson.Gson;
import com.service.DailyIntakeService;
import com.service.ExerciseService;
import com.service.FoodRecipesService;
import com.service.FoodService;
import com.service.MealPlanService;
import com.service.impl.DailyIntakeServiceImpl;
import com.service.impl.ExerciseServiceImpl;
import com.service.impl.FoodRecipesServiceImpl;
import com.service.impl.FoodServiceImpl;
import com.service.impl.MealPlanServiceImpl;

/**
 * Servlet implementation class FoodSearchServlet
 */
public class FoodSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FoodService foodservice = new FoodServiceImpl();
	ExerciseService exerciseService = new ExerciseServiceImpl();
	MealPlanService mealPlanService = new MealPlanServiceImpl();
	DailyIntakeService dailyIntakeService = new DailyIntakeServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = new User();
		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			user = (User)session.getAttribute("userlogin");
		}
		
		ArrayList<Food> foodList = foodservice.getFood();
		Gson gson = new Gson();
		String foodListString = gson.toJson(foodList);
		request.setAttribute("allFoodList", foodListString);
		
		MealPlan plan = mealPlanService.getUserTodayMeal(user.getUserId());
		String mealplanString = "";
		if(plan.getMealplanId()!=0) {
			mealplanString = gson.toJson(plan);
			request.setAttribute("mealplan", mealplanString);
		}
				
		ArrayList<Exercise> exercises = exerciseService.displayAllExercise();
		String exerciseString = gson.toJson(exercises);
		request.setAttribute("exercise", exerciseString);
		
		RequestDispatcher requestDispatcher = null;
		if(user.getUserType().equalsIgnoreCase("Premium")) {
			requestDispatcher=request.getRequestDispatcher("Intake.jsp");
			requestDispatcher.forward(request, response);
		}
		else {
			requestDispatcher=request.getRequestDispatcher("IntakeFree.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
