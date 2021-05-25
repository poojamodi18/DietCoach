package com.beans;

public class Feedback {
	private int id;
	private int userid;
	private String username;
	private String feedback;
	private int rating;
	@Override
	public String toString() {
		return "Feedback [id=" + id + ", userid=" + userid + ", username=" + username + ", feedback=" + feedback
				+ ", rating=" + rating + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
