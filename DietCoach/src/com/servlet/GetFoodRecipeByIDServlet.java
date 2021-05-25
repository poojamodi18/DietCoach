package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.FoodRecipes;
import com.google.gson.Gson;
import com.service.FoodRecipesService;
import com.service.impl.FoodRecipesServiceImpl;

/**
 * Servlet implementation class GetFoodRecipeByIDServlet
 */
public class GetFoodRecipeByIDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      FoodRecipesService foodRecipesService = new FoodRecipesServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFoodRecipeByIDServlet() {
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
		
		int foodid = Integer.parseInt(request.getParameter("foodid"));
		System.out.println("food recipe id : "+foodid);
		FoodRecipes recipes = foodRecipesService.getRecipeDetailsById(foodid);
		Gson gson = new Gson();
		String recipeString = gson.toJson(recipes);
		response.setContentType("text/plain");
		response.getWriter().write(recipeString);
	}

}
