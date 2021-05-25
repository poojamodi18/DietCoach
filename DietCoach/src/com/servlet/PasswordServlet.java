package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.UserService;
import com.service.impl.UserServiceImpl;

/**
 * Servlet implementation class PasswordServlet
 */
public class PasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      UserService userService = new UserServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		String message = userService.checkUserPassword(pass,email);
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
