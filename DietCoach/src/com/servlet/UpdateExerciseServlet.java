package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Exercise;
import com.service.ExerciseService;
import com.service.impl.ExerciseServiceImpl;

/**
 * Servlet implementation class UpdateExerciseServlet
 */
public class UpdateExerciseServlet extends HttpServlet {
	ExerciseService exerciseService = new ExerciseServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateExerciseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		Exercise exercise = exerciseService.getExerciseByID(id);
		request.setAttribute("exercise", exercise);
		RequestDispatcher dispatcher=request.getRequestDispatcher("EditExercise.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Exercise exercise = new Exercise();
		exercise.setExerciseId(Integer.parseInt(request.getParameter("id")));
		exercise.setName(request.getParameter("name"));
		exercise.setCalories(Integer.parseInt(request.getParameter("calories")));
		exercise.setMinutes(Integer.parseInt(request.getParameter("minutes")));
		int i = exerciseService.updateExercise(exercise);
		if(i>0) {
			response.sendRedirect("DisplayExerciseServlet");
		}else{
			response.sendRedirect("DisplayExerciseServlet");
		}
	}

}
