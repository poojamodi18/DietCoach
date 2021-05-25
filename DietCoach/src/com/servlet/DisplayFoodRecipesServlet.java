package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.FoodRecipes;
import com.service.FoodRecipesService;
import com.service.impl.FoodRecipesServiceImpl;

/**
 * Servlet implementation class DisplayFoodRecipesServlet
 */
public class DisplayFoodRecipesServlet extends HttpServlet {
	FoodRecipesService foodRecipesService = new FoodRecipesServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayFoodRecipesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		ArrayList<FoodRecipes> recipelist = foodRecipesService.getRecipe();
		request.setAttribute("foodrecipelist", recipelist);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("Recipelist.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
