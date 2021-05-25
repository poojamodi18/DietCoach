package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Payment;
import com.dao.PaymentDao;

public class PaymentDaoImpl implements PaymentDao{
	String insertPayment = "insert into payment(c_bankname, c_banktxn_id, c_currency, c_gateway_name, c_merchant_id, c_order_id, c_payment_mode, c_response_code, c_response_message, c_status, d_txn_amount, d_txn_date, c_txn_id, i_user_id) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
	String selectByUserId = "select * from payment where i_user_id=?";
	String selectByDate = "select * from payment T1 where i_user_id=? and d_txn_amount>100 and d_txn_date = ( select max(d_txn_date) from payment T2 where i_user_id=? and T1.i_user_id=T2.i_user_id);";
	@Override
	public int insertPayment(Connection connection, Payment payment) throws SQLException {
		int i=0;
		try(PreparedStatement preparedStatement=connection.prepareStatement(insertPayment))
		{
			preparedStatement.setString(1, payment.getBankName());
			preparedStatement.setString(2, payment.getBanktxnId());
			preparedStatement.setString(3, payment.getCurrency());
			preparedStatement.setString(4, payment.getGatewayName());
			preparedStatement.setString(5, payment.getMerchantId());
			preparedStatement.setString(6, payment.getOrderId());
			preparedStatement.setString(7, payment.getPaymentMode());
			preparedStatement.setString(8, payment.getResponseCode());
			preparedStatement.setString(9, payment.getResponseMessage());
			preparedStatement.setString(10, payment.getStatus());
			preparedStatement.setDouble(11, payment.getTxnAmount());
			preparedStatement.setString(12, payment.getTxnDate());
			preparedStatement.setString(13, payment.getTxnId());
			preparedStatement.setInt(14, payment.getUserId());
			i=preparedStatement.executeUpdate();
			System.out.println("Dao Payment"+i);
		}
		return i;
	}
	@Override
	public ArrayList<Payment> getPaymentByUserId(Connection connection, int userid) throws SQLException {
		ArrayList<Payment> arrayList = new ArrayList<Payment>();
		try(PreparedStatement preparedStatement=connection.prepareStatement(selectByUserId))
		{
			preparedStatement.setInt(1, userid);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					Payment payment = new Payment();
					payment.setPaymentId(resultSet.getInt("i_payment_id"));
					payment.setBankName(resultSet.getString("c_bankname"));
					payment.setBanktxnId(resultSet.getString("c_banktxn_id"));
					payment.setCurrency(resultSet.getString("c_currency"));
					payment.setGatewayName(resultSet.getString("c_gateway_name"));
					payment.setMerchantId(resultSet.getString("c_merchant_id"));
					payment.setOrderId(resultSet.getString("c_order_id"));
					payment.setPaymentMode(resultSet.getString("c_payment_mode"));
					payment.setResponseCode(resultSet.getString("c_response_code"));
					payment.setResponseMessage(resultSet.getString("c_response_message"));
					payment.setStatus(resultSet.getString("c_status"));
					payment.setTxnAmount(resultSet.getDouble("d_txn_amount"));
					payment.setTxnDate(resultSet.getString("d_txn_date"));
					payment.setTxnId(resultSet.getString("c_txn_id"));
					payment.setUserId(resultSet.getInt("i_user_id"));
					arrayList.add(payment);
				}
			}
		}
		return arrayList;
	}
	@Override
	public Payment getPaymentByDate(Connection connection, int userId) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectByDate))
		{
			preparedStatement.setInt(1, userId);
			preparedStatement.setInt(2, userId);
			try(ResultSet resultSet = preparedStatement.executeQuery()){
				Payment payment = new Payment();
				while(resultSet.next()) {
					payment.setTxnAmount(resultSet.getDouble("d_txn_amount"));
					payment.setTxnDate(resultSet.getString("d_txn_date"));
					payment.setUserId(resultSet.getInt("i_user_id"));
				}
				return payment;
			}
		}
	}

}
