package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.UserPurchase;
import com.dao.UserPurchaseDao;
import com.dao.impl.UserPurchaseDaoImpl;
import com.service.UserPurchaseService;
import com.utility.CommonUtility;

public class UserPurchaseServiceImpl implements UserPurchaseService{
	UserPurchaseDao purchaseDao = new UserPurchaseDaoImpl();
	@Override
	public int addNewPurchaseDetails(UserPurchase purchase) {
		try(Connection connection = CommonUtility.getconnection())
		{
			return purchaseDao.InsertPurchase(connection,purchase);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public ArrayList<UserPurchase> getPurchaseById(int userid) {
		try(Connection connection = CommonUtility.getconnection()){
			return purchaseDao.selectByUserId(connection,userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
