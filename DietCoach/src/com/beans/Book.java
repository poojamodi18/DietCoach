package com.beans;

import java.io.InputStream;

public class Book {
	private int bookId;
	private String bookName;
	private String autherName;
	private InputStream bookInputStream;
	private String bookString;
	private InputStream bookcover;
	private String bookcoverString;
	private int price;
	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookName=" + bookName + ", autherName=" + autherName + ", bookInputStream="
				+ bookInputStream + ", bookString=" + bookString + ", bookcover=" + bookcover + ", bookcoverString="
				+ bookcoverString + ", price=" + price + "]";
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAutherName() {
		return autherName;
	}
	public void setAutherName(String autherName) {
		this.autherName = autherName;
	}
	public InputStream getBookInputStream() {
		return bookInputStream;
	}
	public void setBookInputStream(InputStream bookInputStream) {
		this.bookInputStream = bookInputStream;
	}
	public String getBookString() {
		return bookString;
	}
	public void setBookString(String bookString) {
		this.bookString = bookString;
	}
	public InputStream getBookcover() {
		return bookcover;
	}
	public void setBookcover(InputStream bookcover) {
		this.bookcover = bookcover;
	}
	public String getBookcoverString() {
		return bookcoverString;
	}
	public void setBookcoverString(String bookcoverString) {
		this.bookcoverString = bookcoverString;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
