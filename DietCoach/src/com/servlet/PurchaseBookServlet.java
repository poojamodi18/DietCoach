package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Book;
import com.beans.User;
import com.beans.UserPurchase;
import com.service.BookService;
import com.service.UserPurchaseService;
import com.service.impl.BookServiceImpl;
import com.service.impl.UserPurchaseServiceImpl;

/**
 * Servlet implementation class PurchaseBookServlet
 */
public class PurchaseBookServlet extends HttpServlet {
	BookService bookService = new BookServiceImpl();
	UserPurchaseService userPurchaseService = new UserPurchaseServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			user = (User)session.getAttribute("userlogin");
		}
		int userid = user.getUserId();
		ArrayList<UserPurchase> userPurchases = new ArrayList<UserPurchase>();
		try {
			userPurchases = userPurchaseService.getPurchaseById(userid);
			if(userPurchases.size()>0) {
				request.setAttribute("Purchases", "Yes");
			}
			else {
				request.setAttribute("Purchases", "No");
			}
			request.setAttribute("userPurchases", userPurchases);
		}
		catch (Exception e) {}
		ArrayList<Book> booklist = bookService.getAllBook();
		request.setAttribute("booklist", booklist);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("PurchaseBook.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie ck1=new Cookie("BookId",request.getParameter("id"));
		response.addCookie(ck1);
		Cookie ck2=new Cookie("BookPrice",request.getParameter("price"));
		response.addCookie(ck2);
		Cookie ck3=new Cookie("OrderId",request.getParameter("orderid"));
		response.addCookie(ck3);
	}

}
