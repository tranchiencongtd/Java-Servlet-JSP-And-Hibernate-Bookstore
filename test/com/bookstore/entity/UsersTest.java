package com.bookstore.entity;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class UsersTest {

	public static void main(String[] args) {
		Users user1 = new Users();
		user1.setEmail("test2@gmail.com");
		user1.setFullName("Tran Chien Cong");
		user1.setPassword("12345678");
		
		EntityManagerFactory entityEntityManagerFactory = Persistence.createEntityManagerFactory("BookStore");
		EntityManager entityManager =  entityEntityManagerFactory.createEntityManager();

		entityManager.getTransaction().begin();
		entityManager.persist(user1);
		
		entityManager.getTransaction().commit();
		entityManager.close();
		entityEntityManagerFactory.close();
		
		System.out.println("A Users object was persisted");
	}

}
