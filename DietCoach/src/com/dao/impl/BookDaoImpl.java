package com.dao.impl;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Book;
import com.dao.BookDao;

public class BookDaoImpl implements BookDao {
	String insertQuery = "insert into books(c_book_name, c_author_name, b_book, b_book_cover,i_price) value(?,?,?,?,?)";
	String selectByIdQuery = "select * from books where i_book_id=?";
	String selectAll = "select * from books;";
	String deletebook="DELETE FROM books WHERE i_book_id = ? ;";
	@Override
	public int insertBook(Connection connection, Book book) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(insertQuery))
		{
			preparedStatement.setString(1, book.getBookName());
			preparedStatement.setString(2, book.getAutherName());
			preparedStatement.setBlob(3, book.getBookInputStream());
			preparedStatement.setBlob(4, book.getBookcover());
			preparedStatement.setInt(5, book.getPrice());
			return preparedStatement.executeUpdate();
		}
	}
	@Override
	public Book selectBookById(Connection connection, int id) throws SQLException {
		Book book = new Book();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectByIdQuery))
		{
			preparedStatement.setInt(1, id);
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					book.setBookId(resultSet.getInt("i_book_id"));
					book.setBookName(resultSet.getString("c_book_name"));
					book.setAutherName(resultSet.getString("c_author_name"));
					Blob bookfile = resultSet.getBlob("b_book");
					book.setBookInputStream(bookfile.getBinaryStream());
					Blob cover = resultSet.getBlob("b_book_cover");
					book.setBookcover(cover.getBinaryStream());
					if(resultSet.getBytes("b_book_cover")!=null)
					{
						book.setBookcoverString(java.util.Base64.getEncoder().encodeToString(resultSet.getBytes("b_book_cover")));
					}
					book.setPrice(resultSet.getInt("i_price"));
				}
			}	
		}
		return book;
	}
	@Override
	public ArrayList<Book> selectAllBook(Connection connection) throws SQLException {
		ArrayList<Book> booklist = new ArrayList<Book>();
		try(PreparedStatement preparedStatement = connection.prepareStatement(selectAll))
		{
			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Book book = new Book();
					book.setBookId(resultSet.getInt("i_book_id"));
					book.setBookName(resultSet.getString("c_book_name"));
					book.setAutherName(resultSet.getString("c_author_name"));
					Blob bookfile = resultSet.getBlob("b_book");
					book.setBookInputStream(bookfile.getBinaryStream());
					Blob cover = resultSet.getBlob("b_book_cover");
					book.setBookcover(cover.getBinaryStream());
					if(resultSet.getBytes("b_book_cover")!=null)
					{
						book.setBookcoverString(java.util.Base64.getEncoder().encodeToString(resultSet.getBytes("b_book_cover")));
					}
					book.setPrice(resultSet.getInt("i_price"));
					booklist.add(book);
				}
			}
		}
		return booklist;
	}
	@Override
	public int deleteBook(Connection connection, int id) throws SQLException {
		try(PreparedStatement preparedStatement = connection.prepareStatement(deletebook))
		{
			preparedStatement.setInt(1, id);
			return preparedStatement.executeUpdate();
		}
	}

}
