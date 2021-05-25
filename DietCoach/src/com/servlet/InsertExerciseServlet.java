package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Exercise;
import com.service.ExerciseService;
import com.service.impl.ExerciseServiceImpl;

/**
 * Servlet implementation class InsertExerciseServlet
 */
public class InsertExerciseServlet extends HttpServlet {
	ExerciseService exerciseService = new ExerciseServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertExerciseServlet() {
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
		Exercise exercise = new Exercise();
		exercise.setName(request.getParameter("name"));
		exercise.setCalories(Integer.parseInt(request.getParameter("calories")));
		exercise.setMinutes(Integer.parseInt(request.getParameter("minutes")));
		int i = exerciseService.insertExercise(exercise);
		if(i>0) {
			response.sendRedirect("DisplayExerciseServlet");
		}else{
			response.sendRedirect("DisplayExerciseServlet");
		}
	}

}
