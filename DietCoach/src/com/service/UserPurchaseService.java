package com.service;

import java.util.ArrayList;

import com.beans.UserPurchase;

public interface UserPurchaseService {

	int addNewPurchaseDetails(UserPurchase purchase);

	ArrayList<UserPurchase> getPurchaseById(int userid);

}
