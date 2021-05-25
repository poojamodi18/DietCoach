package com.service;

import java.util.ArrayList;

import com.beans.Book;

public interface BookService {

	String insertNewBook(Book book);

	Book getBookById(int id);

	ArrayList<Book> getAllBook();

	int deleteBook(int id);
}
