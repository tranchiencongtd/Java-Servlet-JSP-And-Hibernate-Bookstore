package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Category;
import com.bookstore.entity.Users;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class CategoryDAOTest {
	private static EntityManagerFactory entityManagerFactory;
	private static EntityManager entityManager;
	private static CategoryDAO categoryDAO;
	
	@BeforeClass
	public static void setupClass() {
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStore");
		entityManager =  entityManagerFactory.createEntityManager();
		categoryDAO = new CategoryDAO(entityManager);
	}

	@Test
	public void testCreateCategory() {
		Category newCategory = new Category("Category 1");
		categoryDAO.create(newCategory);
		
		assertTrue(newCategory.getCategoryId() > 0);
	}

	@Test
	public void testUpdateCategory() {
		Category newCategory = new Category();
		newCategory.setCategoryId(11);
		newCategory.setName("Test_2");
		
		
		newCategory = categoryDAO.update(newCategory);
		String expected = "Test_2";
		String actual = newCategory.getName();
		
		assertEquals(expected, actual);
	}

	@Test
	public void testGet() {
		Integer id = 11;
		Category newCategory = categoryDAO.get(id);
		
		assertNotNull(newCategory);
	}

	@Test
	public void testDeleteObject() {
		Integer id = 11;
		
		categoryDAO.delete(id);
		
		Category entity = categoryDAO.get(id);;
		
		assertNull(entity);
	}

	@Test
	public void testListAll() {
		List<Category> listEntity = categoryDAO.listAll();
		assertTrue(listEntity.size() > 0);
	}

	@Test
	public void testCount() {
		long count = categoryDAO.count();
		assertEquals(1, count);
	}

	@AfterClass 
	public static void tearDownClass( ) {
		entityManager.close();
		entityManagerFactory.close();
	}
}
