package com.bookstore.service;

import java.util.List;

import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Users;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class UserServices {
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private UserDAO userDAO;
	
	public UserServices() {
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStore");
		entityManager = entityManagerFactory.createEntityManager();
		userDAO = new UserDAO(entityManager);
	}
	
	public List<Users> listUser() {
		List<Users> listUsers = userDAO.listAll();
		return listUsers;
	} 
	
	public void createUser(String email, String fullname, String password) {
		Users newUsers = new Users(email, fullname, password);
		userDAO.create(newUsers);
	}
}
