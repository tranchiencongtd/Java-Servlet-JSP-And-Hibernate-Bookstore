package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customer;

public class CustomerDAOTest extends BaseDAOTest {

	private static CustomerDAO customerDao;

	@BeforeClass
	static void setUpBeforeClass() throws Exception {
		BaseDAOTest.setupClass();
		customerDao = new CustomerDAO();
	}

	@AfterClass
	static void tearDownAfterClass() throws Exception {
		customerDao.close();
	}

	@Test
	void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEmail("tom@gmail.com");
		customer.setCity("Evanston");
		customer.setCountry("United States");
		customer.setPassword("pass100tomword");
		customer.setPhone("18001890");
		customer.setZipcode("300100");
		
		Customer savedCustomer = customerDao.create(customer);
		assertTrue(savedCustomer.getCustomerId() > 0);
	}

	@Test
	void testGet() {
		Integer customerId = 1;
		Customer customer = customerDao.get(customerId);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDao.get(1);
		String fullName = "Tommy";
		customer.setFullname(fullName);
		
		Customer updatedCustomer = customerDao.update(customer);
		assertTrue(updatedCustomer.getFullname().equals(fullName));
	}

	@Test
	public void testDeleteObject() {
		Integer customerId = 1;
		customerDao.delete(customerId);
		Customer customer = customerDao.get(1);
		assertNull(customer);
	}
	
	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDao.listAll();
		
		for (Customer customer : listCustomers) {
			System.out.println(customer.getFullname());
		}
		
		assertFalse(listCustomers.isEmpty());
	}
	
	@Test 
	public void testCount() {
		long totalCustomers = customerDao.count();
		
		assertEquals(2,totalCustomers);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "tom@gmail.com";
		Customer customer = customerDao.findByEmail(email);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckInSuccess() {
		String email = "tom@gmail.com";
		String password = "pass100tomword";
		
		Customer customer = customerDao.checkLogin(email, password);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckInFail() {
		String email = "tom@gmail.com";
		String password = "passtomword";
		
		Customer customer = customerDao.checkLogin(email, password);
		
		assertNull(customer);
	}

}
