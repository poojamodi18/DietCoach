package com.beans;

public class UserPurchase {
	private int userPurchaseId;
	private int userId;
	private int produnctId;
	private String date;
	
	
	@Override
	public String toString() {
		return "UserPurchase [userPurchaseId=" + userPurchaseId + ", userId=" + userId + ", produnctId=" + produnctId
				+ ", date=" + date + "]";
	}
	public int getUserPurchaseId() {
		return userPurchaseId;
	}
	public void setUserPurchaseId(int userPurchaseId) {
		this.userPurchaseId = userPurchaseId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getProdunctId() {
		return produnctId;
	}
	public void setProdunctId(int produnctId) {
		this.produnctId = produnctId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
