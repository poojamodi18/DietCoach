package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.UserPurchase;

public interface UserPurchaseDao {

	int InsertPurchase(Connection connection, UserPurchase purchase) throws SQLException;

	ArrayList<UserPurchase> selectByUserId(Connection connection, int userid) throws SQLException;

}
