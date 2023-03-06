package com.bookstore.controller.client.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.bookstore.controller.BaseServlet;
import com.bookstore.service.BookServices;

@WebServlet("/view_category")
public class ViewBooksByCategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewBooksByCategoryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BookServices bookServices = new BookServices(super.entityManager, request, response);
		bookServices.listBooksByCategory();
	}

}
