package com.servlet;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.beans.Book;
import com.service.BookService;
import com.service.impl.BookServiceImpl;

/**
 * Servlet implementation class InsertBookServlet
 */
public class InsertBookServlet extends HttpServlet {
	BookService bookService = new BookServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		InputStream bookfile =null;
		InputStream cover =null;
		Book book = new Book();
		book.setBookName(request.getParameter("bookname"));
		book.setAutherName(request.getParameter("authorname"));
		book.setPrice(Integer.parseInt(request.getParameter("price")));
		Part filePart = request.getPart("book"); // Retrieves <input type="file" name="file">
	    if(null!=filePart)
		{
		    bookfile = filePart.getInputStream();	 
			book.setBookInputStream(bookfile);
		}
	    Part coverPart = request.getPart("cover");
	    if(null!=coverPart)
	    {
	    	cover = coverPart.getInputStream();
	    	book.setBookcover(cover);
	    }
	    String message = bookService.insertNewBook(book);
	    System.out.println(message);
	    response.sendRedirect("InsertBook.jsp");
	}

}
