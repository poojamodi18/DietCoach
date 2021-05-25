package com.service.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.Book;
import com.dao.BookDao;
import com.dao.impl.BookDaoImpl;
import com.service.BookService;
import com.utility.CommonUtility;

public class BookServiceImpl implements BookService{
	BookDao bookdao = new BookDaoImpl();
	@Override
	public String insertNewBook(Book book) {
		try(Connection connection = CommonUtility.getconnection())
		{
			int i = bookdao.insertBook(connection,book);
			if(i>0)
			{
				return "eBook inserted successfully";
			}
			else
			{
				return "eBook insertion failed, Please try again";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Book getBookById(int id) {
		Book book = new Book();
		try(Connection connection = CommonUtility.getconnection())
		{
			book = bookdao.selectBookById(connection,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return book;
	}
	@Override
	public ArrayList<Book> getAllBook() {
		try(Connection connection = CommonUtility.getconnection())
		{
			return bookdao.selectAllBook(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public int deleteBook(int id) {
		try(Connection connection = CommonUtility.getconnection())
		{
			return bookdao.deleteBook(connection,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
