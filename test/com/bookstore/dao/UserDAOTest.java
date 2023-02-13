package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityNotFoundException;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceException;

public class UserDAOTest {
	private static EntityManagerFactory entityManagerFactory;
	private static EntityManager entityManager;
	private static UserDAO userDAO;
	
	@BeforeClass
	public static void setupClass() {
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStore");
		entityManager =  entityManagerFactory.createEntityManager();
		userDAO = new UserDAO(entityManager);
	}

	@Test
	public void testCreateUsers() {
		Users user1 = new Users();
		user1.setEmail("test2@gmail.com");
		user1.setFullName("Tran Chien Cong");
		user1.setPassword("12345678111111");
		
		
		user1 = userDAO.create(user1);
		
		assertTrue(user1.getUserId() > 0);
	}
	
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldsNotSet() {
		Users user1 = new Users();
		user1 = userDAO.create(user1);	
	}
	
	@Test
	public void testUpdateUser() {
		Users user1 = new Users();
		user1.setUserId(23);
		user1.setEmail("test2@gmail.com");
		user1.setPassword("123");
		user1.setFullName("Tran Chien Cong");
		
		user1 = userDAO.update(user1);
		String expected = "123";
		String actual = user1.getPassword();
		
		assertEquals(expected, actual);
	}
	

	@Test
	public void testGetUsersFound() {
		Integer userId = 26;
		Users user = userDAO.get(userId);
		
		assertNotNull(user);
	}
	
	@Test
	public void testGetUsersNotFound() {
		Integer userId = 10000;
		Users user = userDAO.get(userId);
		
		assertNull(user);
	}
	
	@Test
	public void testDeleteUser() {
		Integer userId = 27;
		
		userDAO.delete(userId);
		
		Users user = userDAO.get(userId);
		
		assertNull(user);
	}
	
	@Test(expected = EntityNotFoundException.class)
	public void testDeleteNonExistUser() {
		Integer userId = 55;
		
		userDAO.delete(userId);
		
	}
	
	@Test
	public void testListAll() {
		List<Users> listUsers = userDAO.listAll();
		assertTrue(listUsers.size() > 0);
		
	}
	
	@Test
	public void testCountAll() {
		long count = userDAO.count();
		assertEquals(2, 2);
	}
	
	@Test
	public void testFindByEmail() {
		String email ="binh46205@gmail.com";
		Users user = userDAO.findByEmail(email);
		assertNotNull(user);
	}

	@AfterClass 
	public static void tearDownClass( ) {
		entityManager.close();
		entityManagerFactory.close();
	}
	
}
