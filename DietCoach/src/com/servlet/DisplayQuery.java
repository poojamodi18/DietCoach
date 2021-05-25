package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Query;
import com.service.QueryService;
import com.service.impl.QueryServiceImpl;

/**
 * Servlet implementation class DisplayQuery
 */
public class DisplayQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       QueryService queryService = new QueryServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Query> queryList = queryService.getQueryList();
		System.out.println("query : "+queryList.size());
		request.setAttribute("queryList", queryList);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("DisplayQuery.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Query query= new Query();
		query.setQueryid(Integer.parseInt(request.getParameter("qid")));
		query.setUserMail(request.getParameter("email"));
		query.setQuestion(request.getParameter("question"));
		query.setAnswer(request.getParameter("answerval"));
		query.setSubject(request.getParameter("subject"));
		String message=queryService.addanswer(query);
		response.setContentType("text/plain");
		response.getWriter().write(message);
		response.sendRedirect("DisplayQuery");
	}

}
