package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Set;

import org.junit.AfterClass;
import org.junit.BeforeClass;

import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

public class OrderDAOTest {
	private static OrderDAO orderDAO;
	
	@BeforeClass
	public static void setupClass() {
		orderDAO = new OrderDAO();
	}

	@AfterClass 
	public static void tearDownClass( ) {
		orderDAO.close();
	}
	
	@Test
	public void testCreateBookOrder() {
		try {
			BookOrder order = new BookOrder();
			Customer customer = new Customer();
			customer.setCustomerId(12);
			
			order.setCustomer(customer);
			order.setRecipientName("Tran Chien Cong");
			order.setRecipientPhone("0384215155");
			order.setShippingAddress("HN");
			
			
			Set<OrderDetail> orderDetails = new HashSet<>();
			OrderDetail orderDetail = new OrderDetail();
			
			Book book = new Book(33);
			orderDetail.setBook(book);
			orderDetail.setQuantity(2);
			orderDetail.setSubtotal(68.0f);
			orderDetail.setBookOrder(order);
			
			orderDetails.add(orderDetail);
			
			order.setOrderDetails(orderDetails);		
			BookOrder savedOrder = orderDAO.create(order);
			assertNotNull("1");
		} catch (Exception e) {
			 System.out.println(e.getMessage());
		}
		
	}
}
