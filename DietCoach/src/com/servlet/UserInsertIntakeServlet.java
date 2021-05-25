package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.DailyIntake;
import com.beans.ExerciseIntake;
import com.beans.User;
import com.service.DailyIntakeService;
import com.service.ExerciseIntakeService;
import com.service.impl.DailyIntakeServiceImpl;
import com.service.impl.ExerciseIntakeServiceImpl;

/**
 * Servlet implementation class UserInsertIntakeServlet
 */
public class UserInsertIntakeServlet extends HttpServlet {
	DailyIntakeService dailyIntakeService = new DailyIntakeServiceImpl();
	ExerciseIntakeService exerciseIntakeService = new ExerciseIntakeServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserInsertIntakeServlet() {
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
		DailyIntake dailyIntake = new DailyIntake();
		dailyIntake.setUserId(user.getUserId());
		dailyIntake.setMealtype(request.getParameter("mealtype"));
		dailyIntake.setFoodid(Integer.parseInt(request.getParameter("foodid")));
		dailyIntake.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		dailyIntake.setCalorie(Integer.parseInt(request.getParameter("calorie")));
		dailyIntakeService.addUserIntake(dailyIntake);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User user = new User();
		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			user = (User)session.getAttribute("userlogin");
		}
		ExerciseIntake exerciseIntake = new ExerciseIntake();
		exerciseIntake.setUserId(user.getUserId());
		exerciseIntake.setExerciseId(Integer.parseInt(request.getParameter("exerciseid")));
		exerciseIntake.setTime(Integer.parseInt(request.getParameter("time")));
		exerciseIntake.setCalories(Integer.parseInt(request.getParameter("calorie")));
		exerciseIntakeService.addUserIntake(exerciseIntake);
			
	}

}
