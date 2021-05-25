package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.DietCategory;
import com.service.DietCategoryService;
import com.service.impl.DietCategoryServiceImpl;

/**
 * Servlet implementation class dietCategoryDisplayServlet
 */
public class dietCategoryDisplayServlet extends HttpServlet {
	DietCategoryService dietCategoryService=new DietCategoryServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dietCategoryDisplayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		ArrayList<DietCategory> dietcategorylist = dietCategoryService.getDietCategory();
		request.setAttribute("dietcategorylist", dietcategorylist);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("dietCategoryList.jsp");
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
