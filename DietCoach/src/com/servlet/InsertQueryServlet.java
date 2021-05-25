package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Query;
import com.service.QueryService;
import com.service.impl.QueryServiceImpl;

/**
 * Servlet implementation class InsertQueryServlet
 */
public class InsertQueryServlet extends HttpServlet {
	QueryService queryService = new QueryServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQueryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		useremail : email,
//		subject : subject,
//		question : question
		System.out.println("called");
		Query query = new Query();
		query.setUserMail(request.getParameter("useremail"));
		query.setSubject(request.getParameter("subject"));
		query.setQuestion(request.getParameter("question"));
		String message = queryService.addNewQuery(query);
		response.setContentType("text/plain");
		response.getWriter().write(message);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
