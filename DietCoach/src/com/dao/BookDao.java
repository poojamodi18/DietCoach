package com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Book;

public interface BookDao {

	int insertBook(Connection connection, Book book) throws SQLException;

	Book selectBookById(Connection connection, int id) throws SQLException;

	ArrayList<Book> selectAllBook(Connection connection) throws SQLException;

	int deleteBook(Connection connection, int id) throws SQLException;

}
