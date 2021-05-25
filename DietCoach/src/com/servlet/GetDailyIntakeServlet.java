package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.DailyIntake;
import com.beans.ExerciseIntake;
import com.beans.User;
import com.google.gson.Gson;
import com.service.DailyIntakeService;
import com.service.ExerciseIntakeService;
import com.service.impl.DailyIntakeServiceImpl;
import com.service.impl.ExerciseIntakeServiceImpl;

/**
 * Servlet implementation class GetDailyIntakeServlet
 */
public class GetDailyIntakeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     DailyIntakeService dailyIntakeService = new DailyIntakeServiceImpl();
     ExerciseIntakeService exerciseIntakeService = new ExerciseIntakeServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetDailyIntakeServlet() {
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
		Gson gson = new Gson();
		ArrayList<DailyIntake> dailyIntake = dailyIntakeService.getUserTodayIntake(user.getUserId());
		String intakeString = "";
		if(dailyIntake.size()>0) {
			intakeString = gson.toJson(dailyIntake);
			response.setContentType("text/plain");
			response.getWriter().write(intakeString);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			user = (User)session.getAttribute("userlogin");
		}
		Gson gson = new Gson();
		ArrayList<ExerciseIntake> dailyIntake = exerciseIntakeService.getUserTodayIntake(user.getUserId());
		String intakeString = "";
		if(dailyIntake.size()>0) {
			intakeString = gson.toJson(dailyIntake);
			response.setContentType("text/plain");
			response.getWriter().write(intakeString);
		}
	}

}
