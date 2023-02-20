package com.bookstore.controller.client;

import java.io.IOException;
import java.util.List;

import com.bookstore.controller.BaseServlet;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("")
public class HomeServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAO categoryDAO = new CategoryDAO(entityManager); 
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);
		
		String homePage = "client/index.jsp";		
		RequestDispatcher dispatcher = request.getRequestDispatcher(homePage);
		dispatcher.forward(request, response);
		
	}

}
