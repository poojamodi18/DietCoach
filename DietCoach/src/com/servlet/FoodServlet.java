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
import com.service.FoodService;
import com.service.impl.DietCategoryServiceImpl;
import com.service.impl.FoodServiceImpl;
import com.utility.MealType;

/**
 * Servlet implementation class FoodServlet
 */
public class FoodServlet extends HttpServlet {
	FoodService foodservice = new FoodServiceImpl();
	ArrayList<Food> foodlist =new ArrayList<Food>();
	DietCategoryService dietService = new DietCategoryServiceImpl(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		ArrayList<DietCategory> dietcategorylist = dietService.getDietCategory();
		request.setAttribute("dietcatlist", dietcategorylist);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("InsertFood.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		InputStream is =null;
		Food food = new Food();
		FoodRecipes foodRecipes = new FoodRecipes();
		String recipe = "";
		food.setFoodname(request.getParameter("name"));
		food.setNutritionalInfo(request.getParameter("nutritioninfo"));
		food.setQuantity(Integer.parseInt(request.getParameter("servingQuantity")));
		food.setServingType(request.getParameter("servingType"));
		food.setMealtype(request.getParameter("mealtype"));
		food.setSubmealtype(request.getParameter("subtype"));
		food.setDietid(Integer.parseInt(request.getParameter("diettype")));
		food.setCalories(Integer.parseInt(request.getParameter("calories")));
		food.setCarbs(Float.valueOf(request.getParameter("carbs")));
		food.setProtein(Float.valueOf(request.getParameter("protein")));
		food.setSugar(Float.valueOf(request.getParameter("sugar")));
		food.setFat(Float.valueOf(request.getParameter("fat")));
		food.setFat(Float.valueOf(request.getParameter("fiber")));
		food.setIsactive(1);
		
		Part image = request.getPart("foodimage");
		if(null!=image)
		{
			is =image.getInputStream();
			food.setFoodImageInputStream(is);
		}
		
		int step=0;
		try {
		if(request.getParameter("steps")!=null)
		{
			step=Integer.parseInt(request.getParameter("steps"));
			foodRecipes.setFoodIngredients(request.getParameter("ingredients"));
			System.out.println(request.getParameter("ingredients"));
			for(int cnt=1;cnt<=step;cnt++)
			{
				String field = "step";
				field+=cnt;
				if(request.getParameter(field)!=null)
				recipe+=request.getParameter(field);
				if(cnt<step){
					recipe+=" ; ";
				}
			}	
			foodRecipes.setFoodName(request.getParameter("name"));
			foodRecipes.setRecipe(recipe);
			System.out.println(foodRecipes.toString());
		}
		}catch(Exception e) {}
		
		
		if(step==0){
			foodservice.insertFoodDetails(food);
		}
		else {
			foodservice.insertFoodandReciepe(food,foodRecipes);
		}
		response.sendRedirect("FoodDisplayServlet");
	}
}
