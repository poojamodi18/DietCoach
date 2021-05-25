package com.servlet;

import java.io.IOException;

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
 * Servlet implementation class UpdateDietCategoryServlet
 */
public class UpdateDietCategoryServlet extends HttpServlet {
	DietCategoryService dietCategoryService=new DietCategoryServiceImpl(); 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDietCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println("id : "+id);
		DietCategory dietCategory=dietCategoryService.selectDietById(id);
		System.out.println("Diet cat name : "+dietCategory.getCategoryname());
		request.setAttribute("dietcategorydetails", dietCategory);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("EditDietCategory.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DietCategory dietCategory=new DietCategory();
		dietCategory.setDietcategoryid(Integer.parseInt(request.getParameter("id")));
		dietCategory.setCategoryname(request.getParameter("categoryname"));
		dietCategoryService.update(dietCategory);
		response.sendRedirect("dietCategoryDisplayServlet");
	}

}
