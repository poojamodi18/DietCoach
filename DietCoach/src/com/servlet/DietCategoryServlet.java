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
import com.service.DietCategoryService;
import com.service.impl.DietCategoryServiceImpl;

/**
 * Servlet implementation class DietCategoryServlet
 */
public class DietCategoryServlet extends HttpServlet {
	DietCategoryService dietCategoryService=new DietCategoryServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DietCategoryServlet() {    	
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<DietCategory> dietcategorylist = dietCategoryService.getDietCategory();
		request.setAttribute("dietcatlist", dietcategorylist);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dietcategory.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DietCategory dietcategory = new DietCategory();
		System.out.println("Diet cat servlet");
		dietcategory.setCategoryname(request.getParameter("categoryname"));
		dietCategoryService.insertdietCategory(dietcategory);
		response.sendRedirect("dietCategoryDisplayServlet");
	}
}
