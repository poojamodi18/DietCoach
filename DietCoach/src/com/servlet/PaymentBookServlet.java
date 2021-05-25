package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.Payment;
import com.beans.User;
import com.beans.UserPurchase;
import com.service.PaymentService;
import com.service.UserPurchaseService;
import com.service.UserService;
import com.service.impl.PaymentServiceImpl;
import com.service.impl.UserPurchaseServiceImpl;
import com.service.impl.UserServiceImpl;
import com.utility.PaytmConstants;

/**
 * Servlet implementation class PaymentBookServlet
 */
public class PaymentBookServlet extends HttpServlet {
	PaymentService paymentService = new PaymentServiceImpl();
	UserService userService = new UserServiceImpl();
	UserPurchaseService purchaseService = new UserPurchaseServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		HttpSession session = request.getSession(false);
		User user = new User();
		if(session!=null)
		{
			user = (User)session.getAttribute("userlogin");
		}
		int userid = user.getUserId();
		payment.setUserId(userid);
		Cookie[] cookies = request.getCookies();
		int bookprice=0,bookid=0;
		String orderid="";
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("BookId")) {
					bookid = Integer.parseInt(cookie.getValue());
				}
				if (cookie.getName().equals("BookPrice")) {
					bookprice = Integer.parseInt(cookie.getValue());
				}
				if (cookie.getName().equals("OrderId")) {
					orderid = cookie.getValue();
				}
			}
		}
		if(payment.getOrderId().equalsIgnoreCase(orderid) && payment.getTxnAmount()==bookprice) {
			int msg = paymentService.addPayment(payment);
			if(msg>0) {
				UserPurchase purchase = new UserPurchase();
				purchase.setUserId(userid);
				purchase.setProdunctId(bookid);
				purchase.setDate(payment.getTxnDate());
				int i = purchaseService.addNewPurchaseDetails(purchase);
			}
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
