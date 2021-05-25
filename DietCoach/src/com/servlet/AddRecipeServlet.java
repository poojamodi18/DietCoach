package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.FoodRecipes;
import com.service.FoodRecipesService;
import com.service.impl.FoodRecipesServiceImpl;

/**
 * Servlet implementation class AddRecipeServlet
 */
public class AddRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    FoodRecipesService foodRecipesService = new FoodRecipesServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRecipeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FoodRecipes foodRecipes = new FoodRecipes();
		foodRecipes.setFoodName(request.getParameter("fooditemname"));
		foodRecipes.setFoodIngredients(request.getParameter("ingredientname").trim());
		foodRecipes.setFoodId(Integer.parseInt(request.getParameter("fooditemid")));
		foodRecipes.setRecipe(request.getParameter("steplist"));
		String message = foodRecipesService.addRecipe(foodRecipes);
		response.setContentType("text/plain");
		response.getWriter().write(message);
	}

}
