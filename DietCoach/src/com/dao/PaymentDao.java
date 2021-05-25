package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Payment;

public interface PaymentDao {

	int insertPayment(Connection connection, Payment payment) throws SQLException;

	ArrayList<Payment> getPaymentByUserId(Connection connection, int userid) throws SQLException;

	Payment getPaymentByDate(Connection connection, int userId) throws SQLException;

}
