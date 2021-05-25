package com.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.beans.DietCategory;
import com.beans.Food;
import com.beans.FoodRecipes;
import com.service.DietCategoryService;
import com.service.FoodRecipesService;
import com.service.FoodService;
import com.service.impl.DietCategoryServiceImpl;
import com.service.impl.FoodRecipesServiceImpl;
import com.service.impl.FoodServiceImpl;

/**
 * Servlet implementation class UpdateFoodServlet
 */
public class UpdateFoodServlet extends HttpServlet {
	DietCategoryService dietService = new DietCategoryServiceImpl(); 
	FoodService foodservice = new FoodServiceImpl();
	FoodRecipesService foodRecipesService = new FoodRecipesServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFoodServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		Food food=foodservice.selectbyId(id);
		int resid = Integer.parseInt(request.getParameter("resid"));
		FoodRecipes foodRecipes = new FoodRecipes();
		if(resid>0) {
			foodRecipes = foodRecipesService.getRecipeDetailsById(resid);
		}
		request.setAttribute("foodrecipe", foodRecipes);
		request.setAttribute("fooddetail", food);
		ArrayList<DietCategory> dietcategorylist = dietService.getDietCategory();
		request.setAttribute("dietcatlist", dietcategorylist);
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("EditFood.jsp");
		requestDispatcher.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Food food = new Food();
		InputStream is =null;
		FoodRecipes foodRecipes = new FoodRecipes();
		String recipe = "";
		String imgMessage="";
		food.setFoodid(Integer.parseInt(request.getParameter("id")));
		food.setFoodname(request.getParameter("name"));
		food.setNutritionalInfo(request.getParameter("nutritioninfo"));
		food.setQuantity(Integer.parseInt(request.getParameter("servingQuantity")));
		food.setServingType(request.getParameter("servingType"));
		food.setMealtype(request.getParameter("mealtype"));
		food.setDietid(Integer.parseInt(request.getParameter("diettype")));
		food.setCalories(Integer.parseInt(request.getParameter("calories")));
		food.setCarbs(Float.valueOf(request.getParameter("carbs")));
		food.setProtein(Float.valueOf(request.getParameter("protein")));
		food.setSugar(Float.valueOf(request.getParameter("sugar")));
		food.setFat(Float.valueOf(request.getParameter("fat")));
		food.setFat(Float.valueOf(request.getParameter("fiber")));
		food.setIsactive(1);
		if((request.getParameter("imgval").equalsIgnoreCase("yes")))
		{
			imgMessage="yes";
			Part image = request.getPart("image");
			if(null!=image)
			{
				is =image.getInputStream();
				food.setFoodImageInputStream(is);
			}
		}
		else {
			imgMessage="no";
		}
		System.out.println(food);
		int returnval;
		returnval = foodservice.updateFoodDetails(food,imgMessage);
		int resid = Integer.parseInt(request.getParameter("resid"));
		if(resid!=0) {
			foodRecipes.setFoodRecipeId(resid);
			foodRecipes.setFoodIngredients(request.getParameter("ingre"));
			foodRecipes.setRecipe(request.getParameter("recipe"));
			foodRecipes.setFoodName(request.getParameter("name"));
			int i=foodRecipesService.updateRecipe(foodRecipes);
			if(returnval>0) {
				returnval=i;
			}
		}
		if(returnval>0) {
			response.sendRedirect("FoodDisplayServlet");
		}
		else {
			response.sendRedirect("FoodDisplayServlet");
		}
	}

}
