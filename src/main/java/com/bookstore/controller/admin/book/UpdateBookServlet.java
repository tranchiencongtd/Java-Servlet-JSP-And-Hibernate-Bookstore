package com.bookstore.controller.admin.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bookstore.service.BookServices;

@WebServlet("/admin/update_book")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024, // 1MB
		maxFileSize = 1024 * 1024 * 5, // 5MB 
		maxRequestSize = 1024 * 1024 * 5 * 5 // 25MB
)
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateBookServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices  bookServices = new BookServices(request, response);
		bookServices.updateBook();
	}

}
