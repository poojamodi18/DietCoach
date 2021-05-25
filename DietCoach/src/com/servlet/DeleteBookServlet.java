package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.BookService;
import com.service.impl.BookServiceImpl;

/**
 * Servlet implementation class DeleteBookServlet
 */
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookService bookService = new  BookServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		int i = bookService.deleteBook(id);
		if(i>0) {
			response.sendRedirect("DisplayeBook");
		}else {
			response.sendRedirect("DisplayeBook");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
