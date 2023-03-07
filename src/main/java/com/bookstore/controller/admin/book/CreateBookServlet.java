package com.bookstore.controller.admin.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bookstore.service.BookServices;

@WebServlet("/admin/create_book")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024, // 1MB
		maxFileSize = 1024 * 1024 * 5, // 5MB 
		maxRequestSize = 1024 * 1024 * 5 * 5 // 25MB
/*
 * fileSizeThreshold = 1024 * 10, // 10 kB maxFileSize = 1024 * 300, // 300 kB
 * maxRequestSize = 1024 * 1024 // 1 MB
 */)
public class CreateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateBookServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(request,response);
		bookServices.createBook();
	}

}
