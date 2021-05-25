package com.service;

import java.util.ArrayList;

import com.beans.Payment;

public interface PaymentService {

	int addPayment(Payment payment);

	ArrayList<Payment> getPaymentDetailsByUserId(int userid);

	Payment getPaymentByUserDate(int userId);

}
