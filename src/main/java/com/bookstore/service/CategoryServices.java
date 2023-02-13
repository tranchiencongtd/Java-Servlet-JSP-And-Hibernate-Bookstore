package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CategoryServices {
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CategoryDAO categoryDAO;

	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {
		this.entityManagerFactory = Persistence.createEntityManagerFactory("BookStore");
		this.entityManager = entityManagerFactory.createEntityManager();
		this.categoryDAO = new CategoryDAO(entityManager);
		this.request = request;
		this.response = response;
	}

	public void listCategory() throws ServletException, IOException {
		listCategory(null);
	}

	public void listCategory(String message) throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();

		request.setAttribute("listCategory", listCategory);

		if (message != null) {
			request.setAttribute("message", message);
		}
		String listPage = "category_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);

	}

	public void createCategory() throws ServletException, IOException {
		String name = request.getParameter("name");
		Category newCategory = new Category(name);
		categoryDAO.create(newCategory);
		String message = "Thêm mới thành công";
		listCategory(message);
	}
}
