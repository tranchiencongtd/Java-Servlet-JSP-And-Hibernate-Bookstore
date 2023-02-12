package com.bookstore.entity;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class CategoryTest {

	public static void main(String[] args) {
		Category newCate = new Category("Test");

		
		EntityManagerFactory entityEntityManagerFactory = Persistence.createEntityManagerFactory("BookStore");
		EntityManager entityManager =  entityEntityManagerFactory.createEntityManager();

		try {
			entityManager.getTransaction().begin();
			entityManager.persist(newCate);
			
			entityManager.getTransaction().commit();
			entityManager.close();
			entityEntityManagerFactory.close();
			
			System.out.println("A Category object was persisted");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		

	}

}
