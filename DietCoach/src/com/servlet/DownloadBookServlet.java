package com.servlet;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.Book;
import com.service.BookService;
import com.service.impl.BookServiceImpl;

/**
 * Servlet implementation class DownloadBookServlet
 */
public class DownloadBookServlet extends HttpServlet {
	BookService bookService = new BookServiceImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		Book book = bookService.getBookById(id);
		
		 int fileLength = book.getBookInputStream().available();
		  ServletContext context = getServletContext();
		  
          // sets MIME type for the file download
          String mimeType = context.getMimeType(book.getBookName());
          if (mimeType == null) {        
              mimeType = "application/octet-stream";
          }              
           
          // set content properties and header attributes for the response
          response.setContentType(mimeType);
          response.setContentLength(fileLength);
          String headerKey = "Content-Disposition";
          String headerValue = String.format("attachment; filename=\"%s\"", book.getBookName()+".pdf");
          response.setHeader(headerKey, headerValue);

          // writes the file to the client
          OutputStream outStream = response.getOutputStream();
        
          byte[] buffer = new byte[fileLength];
          int bytesRead = -1;
           
          while ((bytesRead = book.getBookInputStream().read(buffer)) != -1) {
              outStream.write(buffer, 0, bytesRead);
          }
           
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
