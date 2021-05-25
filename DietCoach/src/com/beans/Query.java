package com.beans;

public class Query {
	private int queryid;
	private String userMail;
	private String subject;
	private String question;
	private String answer;
	private int notify;
	@Override
	public String toString() {
		return "Query [queryid=" + queryid + ", userMail=" + userMail + ", subject=" + subject + ", question="
				+ question + ", answer=" + answer + ", notify=" + notify + "]";
	}
	public int getQueryid() {
		return queryid;
	}
	public void setQueryid(int queryid) {
		this.queryid = queryid;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getNotify() {
		return notify;
	}
	public void setNotify(int notify) {
		this.notify = notify;
	}
}
