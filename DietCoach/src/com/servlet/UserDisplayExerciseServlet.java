package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Exercise;
import com.service.ExerciseService;
import com.service.impl.ExerciseServiceImpl;

/**
 * Servlet implementation class UserDisplayExerciseServlet
 */
public class UserDisplayExerciseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ExerciseService exerciseService = new ExerciseServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDisplayExerciseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Exercise> exercises = exerciseService.displayAllExercise();
		request.setAttribute("exerciselist", exercises);
		RequestDispatcher dispatcher = request.getRequestDispatcher("UserDisplayExercise.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
