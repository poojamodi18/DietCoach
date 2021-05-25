package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Payment;
import com.dao.PaymentDao;
import com.dao.impl.PaymentDaoImpl;
import com.service.PaymentService;
import com.utility.CommonUtility;

public class PaymentServiceImpl implements PaymentService {
	PaymentDao paymentdao = new PaymentDaoImpl();
	@Override
	public int addPayment(Payment payment) {
		int i=0;
		try(Connection connection = CommonUtility.getconnection())
		{
			i = paymentdao.insertPayment(connection,payment);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	@Override
	public ArrayList<Payment> getPaymentDetailsByUserId(int userid) {
		try(Connection connection = CommonUtility.getconnection())
		{
			return paymentdao.getPaymentByUserId(connection,userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Payment getPaymentByUserDate(int userId) {
		try(Connection connection = CommonUtility.getconnection()){
			return paymentdao.getPaymentByDate(connection,userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
