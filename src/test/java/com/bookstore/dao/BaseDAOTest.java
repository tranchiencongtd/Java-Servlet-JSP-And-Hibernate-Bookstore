package com.bookstore.dao;

import org.junit.AfterClass;
import org.junit.BeforeClass;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class BaseDAOTest {
	protected static EntityManagerFactory entityManagerFactory;
	protected static EntityManager entityManager;
	
	@BeforeClass
	public static void setupClass() {
		entityManagerFactory = Persistence.createEntityManagerFactory("BookStore");
		entityManager =  entityManagerFactory.createEntityManager();
	}

	@AfterClass 
	public static void tearDownClass( ) {
		entityManager.close();
		entityManagerFactory.close();
	}
}
