package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Users;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserServices {
	private HttpServletRequest request;
	private HttpServletResponse response; 
	private UserDAO userDAO;
	
	public UserServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		this.userDAO = new UserDAO(entityManager);
		this.request = request;
		this.response = response;
	}
	
	public void listUser() throws ServletException, IOException {
		listUser(null);
	}
	
	public void listUser(String message) throws ServletException, IOException {
		List<Users> listUsers = userDAO.listAll();
		
		request.setAttribute("listUsers", listUsers);
		
		if(message != null) {
			request.setAttribute("message", message);
		}
		
		String listPage = "user_list.jsp";

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
		
	}
	
	public void createUser() throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		Users existUser = userDAO.findByEmail(email);
		
		if(existUser != null) {
			String message = "Email: " + email + " đã tồn tại!";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		} else {
			Users newUsers = new Users(email, fullName, password);
			userDAO.create(newUsers);
			
			String message = "Thêm mới thành công";
			listUser(message);
		}
	}
	
	public void editUser() throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("id"));
		Users users = userDAO.get(userId);
		
		String pageEdit = "user_form.jsp";
		request.setAttribute("user", users);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(pageEdit);
		requestDispatcher.forward(request, response);
	}
	
	public void updateUser() throws ServletException, IOException {
		int userId =Integer.parseInt(request.getParameter("userId"));
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullname");
		String password = request.getParameter("password");
		
		Users userById = userDAO.get(userId);
		
		Users userByEmail = userDAO.findByEmail(email);
		
		if(userByEmail != null && userByEmail.getUserId() != userById.getUserId()) {
			String message = "Could not update user. User with email" + email + "already exists.";
			request.setAttribute("message", message);
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("message.jsp");
			requestDispatcher.forward(request, response);
		}else {
			Users user = new Users(userId, email, password, fullName );
			userDAO.update(user);
			String message = "User has been updated successfully";
			listUser(message);
		}
	}
	
	public void deleteUser() throws ServletException, IOException {
		try {
			int userId = Integer.parseInt(request.getParameter("id"));
			userDAO.delete(userId);
			
			String message = "Xóa tài khoản thành công!";
			listUser(message);
		} catch(Exception ex) {
			listUser();
			System.out.print(ex.getMessage());
		}
		
	}
}
