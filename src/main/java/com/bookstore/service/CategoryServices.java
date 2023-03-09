package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

import jakarta.persistence.EntityManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CategoryServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CategoryDAO categoryDAO;

	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {
		this.categoryDAO = new CategoryDAO();
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
		Category existCategory = categoryDAO.findByName(name);
		
		if (existCategory != null) {
			String message = "Không thể tạo danh mục." + " Đã tồn tại danh mục có tên " + name;
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
			
		}else {
			Category newCategory = new Category(name);
			categoryDAO.create(newCategory);
			String message = "Tạo danh mục thành công!";
			listCategory(message);
		}
	}
	
	public void editCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(categoryId);
		request.setAttribute("category", category);
		
		String editPage = "category_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}
	
	public void updateCategory() throws ServletException, IOException {
		int categoryId =Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("name");
	
		Category categoryById = categoryDAO.get(categoryId);
		Category categoryByName = categoryDAO.findByName(categoryName);
		
		if (categoryByName != null && categoryById.getCategoryId() != categoryByName.getCategoryId() ) {
			String message = "Không thể tạo danh mục." + " Đã tồn tại danh mục có tên " + categoryName;
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
			
		}else {
			categoryById.setName(categoryName);
			categoryDAO.update(categoryById);
			String message = "Cập nhật danh mục thành công!";
			listCategory(message);
		}
	}
	
	public void deleteCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		BookDAO bookDAO = new BookDAO();
		long numberOfBooks = bookDAO.countByCategory(categoryId);
		String message;
		
		if (numberOfBooks > 0) {
			message = "Không thể xóa danh mục (ID: %d) bởi vì trong danh mục vẫn còn sách";
			message = String.format(message, numberOfBooks);
		} else {
			categoryDAO.delete(categoryId);
			message = "Xóa danh mục ID: " + categoryId + " thành công";
		}
		
		listCategory(message);
		
	}
}
