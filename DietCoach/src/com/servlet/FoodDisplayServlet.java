package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.DietCategory;
import com.beans.Food;
import com.beans.FoodRecipes;
import com.google.gson.Gson;
import com.service.DietCategoryService;
import com.service.FoodRecipesService;
import com.service.FoodService;
import com.service.impl.DietCategoryServiceImpl;
import com.service.impl.FoodRecipesServiceImpl;
import com.service.impl.FoodServiceImpl;

/**
 * Servlet implementation class FoodDisplayServlet
 */
public class FoodDisplayServlet extends HttpServlet {
	FoodService foodservice = new FoodServiceImpl();
	DietCategoryService dietService = new DietCategoryServiceImpl(); 
	FoodRecipesService foodRecipesService = new FoodRecipesServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodDisplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		Gson gson = new Gson();
		ArrayList<Food> foodlist = foodservice.getFood();
		System.out.println("food list : "+foodlist.size());
		ArrayList<FoodRecipes> foodRecipeslist = foodRecipesService.getRecipe();
		System.out.println("Recipes list "+ foodRecipeslist.size());
		String foodrecipeJsonString = gson.toJson(foodRecipeslist);
		request.setAttribute("foodrecipelist", foodrecipeJsonString);
		request.setAttribute("foodlist", foodlist);
		ArrayList<DietCategory> dietcategorylist = dietService.getDietCategory();
		request.setAttribute("dietcatlist", dietcategorylist);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("FoodTable.jsp");
		requestDispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
