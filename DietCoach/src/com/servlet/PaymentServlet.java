package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
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

/**
 * Servlet implementation class PaymentServlet
 */
public class PaymentServlet extends HttpServlet {
	PaymentService paymentService = new PaymentServiceImpl();
	UserService userService = new UserServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Payment payment = new Payment();
		payment.setBankName(request.getParameter("bankname"));
		payment.setBanktxnId(request.getParameter("banktxnid"));
		payment.setCurrency(request.getParameter("currency"));
		payment.setGatewayName(request.getParameter("gatewayname"));
		payment.setMerchantId(request.getParameter("merchantid"));
		payment.setOrderId(request.getParameter("orderid"));
		payment.setPaymentMode(request.getParameter("paymentmode"));
		payment.setResponseCode(request.getParameter("responsecode"));
		payment.setResponseMessage(request.getParameter("responsemsg"));
		payment.setStatus(request.getParameter("status"));
		payment.setTxnAmount(Double.parseDouble(request.getParameter("txnamount")));
		payment.setTxnDate(request.getParameter("txndate"));
		payment.setTxnId(request.getParameter("txnid"));
		System.out.println(payment);
		HttpSession session = request.getSession(false);
		User user = new User();
		if(null!=session)
		{
			user = (User)session.getAttribute("userlogin");
		}
		int userid = user.getUserId();
		System.out.println(userid);
		payment.setUserId(userid);
		System.out.println(payment.toString());
		
		int i = paymentService.addPayment(payment);
		System.out.println("message : "+i);
		if(i==1)
		{
			userService.addPremiumUser(user);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
