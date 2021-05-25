package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.UserPurchase;
import com.dao.UserPurchaseDao;

public class UserPurchaseDaoImpl implements UserPurchaseDao{
	String insertQuery = "insert into user_purchase(i_user_id, i_product_id, d_purchase_date) values(?,?,?)";
	String selectByUserid = "select * from user_purchase where i_user_id=?";
	@Override
	public int InsertPurchase(Connection connection, UserPurchase purchase) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(insertQuery))
		{
			preparedStatement.setInt(1, purchase.getUserId());
			preparedStatement.setInt(2, purchase.getProdunctId());
			preparedStatement.setString(3, purchase.getDate());
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public ArrayList<UserPurchase> selectByUserId(Connection connection, int userid) throws SQLException {
		ArrayList<UserPurchase> userPurchases = new ArrayList<UserPurchase>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectByUserid))
		{
			preparedStatement.setInt(1, userid);
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				while(resultSet.next())
				{
					UserPurchase purchase = new UserPurchase();
					purchase.setUserPurchaseId(resultSet.getInt("i_user_purchase_id"));
					purchase.setUserId(resultSet.getInt("i_user_id"));
					purchase.setProdunctId(resultSet.getInt("i_product_id"));
					purchase.setDate(resultSet.getString("d_purchase_date"));
					userPurchases.add(purchase);
				}
			}
		}
		return userPurchases;
	}

}
