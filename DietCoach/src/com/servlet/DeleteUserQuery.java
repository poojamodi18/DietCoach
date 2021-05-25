package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.QueryService;
import com.service.impl.QueryServiceImpl;

/**
 * Servlet implementation class DeleteUserQuery
 */
public class DeleteUserQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
     QueryService queryService = new QueryServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		int i= queryService.deleteQuery(id);
		if(i>0) {
			response.sendRedirect("DisplayQuery");
		}else {
			response.sendRedirect("DisplayQuery");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
