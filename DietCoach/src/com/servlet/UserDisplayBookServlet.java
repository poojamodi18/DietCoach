package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Book;
import com.service.BookService;
import com.service.impl.BookServiceImpl;

/**
 * Servlet implementation class UserDisplayBookServlet
 */
public class UserDisplayBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookService bookService = new BookServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDisplayBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Book> booklist = bookService.getAllBook();
		System.out.println("List : "+booklist.size());
		request.setAttribute("booklist", booklist);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("UserDisplayBook.jsp");
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
