package com.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Payment;
import com.beans.User;
import com.service.PaymentService;
import com.service.UserService;
import com.service.impl.PaymentServiceImpl;
import com.service.impl.UserServiceImpl;

import javafx.css.PseudoClass;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService = new UserServiceImpl();
	PaymentService paymentService = new PaymentServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String message = userService.checkOldUser(email);
		response.setContentType("text/plain");
		response.getWriter().write(message);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user=userService.loginUser(email,password);
		if(null==user.getFirstName()) {
			response.sendRedirect("Login.jsp");
		}
		if(null!=user)
		{
			HttpSession httpSession = request.getSession(true);
			httpSession.setAttribute("userlogin", user);
			if(user.getUserId()!=0)
			{
				if(user.getUserRole().equalsIgnoreCase("admin"))
				{
					response.sendRedirect("AdminDashboard.jsp");
				}
				else
				{
					if(user.getUserType().equalsIgnoreCase("Premium")) {
						//call payment and get recent data and check if date is ended or not if yes then mail user and change his type to free and if 5 / 3 days left send mail to that user
						Payment payment = paymentService.getPaymentByUserDate(user.getUserId());
						Date today = new Date();
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					        try {

					            Date date = formatter.parse(payment.getTxnDate());
					            long diff = date.getTime() - today.getTime();
					            int days = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
					            int positiveVal = days*-1;
					            System.out.println(positiveVal);
					            if(payment.getTxnAmount()==199) {
						            if(positiveVal>30) {
						            	userService.changeToFree(user);
						            	response.sendRedirect("FreeDashboard.jsp");
						            }else {
						            	int left = 30-positiveVal;
						            	System.out.println(left);
						            	Cookie primeDay = new Cookie("PremiumDay", String.valueOf(left));
							            response.addCookie( primeDay );
						            	response.sendRedirect("dashboard.jsp");
						            }
					            }
					            else if(payment.getTxnAmount()==499) {
					            	if(positiveVal>91) {
					            		userService.changeToFree(user);
						            	response.sendRedirect("FreeDashboard.jsp");
						            }else {
						            	int left = 91-positiveVal;
						            	System.out.println(left);
						            	Cookie primeDay = new Cookie("PremiumDay", String.valueOf(left));
							            response.addCookie( primeDay );
						            	response.sendRedirect("dashboard.jsp");
						            }
					            }
					            else if(payment.getTxnAmount()==1499) {
					            	if(positiveVal>365) {
					            		userService.changeToFree(user);
						            	response.sendRedirect("FreeDashboard.jsp");
						            }else {
						            	int left = 365-positiveVal;
						            	System.out.println(left);
						            	Cookie primeDay = new Cookie("PremiumDay", String.valueOf(left));
							            response.addCookie( primeDay );
						            	response.sendRedirect("dashboard.jsp");
						            }
					            }
					        } catch (ParseException e) {
					            e.printStackTrace();
					        }
					}
					else {
						System.out.println(user.getRegisterDate());
						Date today = new Date();
						String s = today.toString();
						System.out.println(s);
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
						Date date;
						long diff = user.getRegisterDate().getTime() - today.getTime();
			            int days = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
			            int positiveVal = days*-1;
			            System.out.println("days"+positiveVal);
			            int left = 30-positiveVal;
			            Cookie freeDay = new Cookie("FreeDay", String.valueOf(left));
			            response.addCookie( freeDay );
						response.sendRedirect("FreeDashboard.jsp");
					}
				}
			}
		}
		
		//request forword user dashborad service return user and setattribute user and forword request
		
	}

}
