package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.List;
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
	private static CustomerDAO customerDAO;
	private static BookDAO bookDAO;
	
	@BeforeClass
	public static void setupClass() {
		orderDAO = new OrderDAO();
		customerDAO = new CustomerDAO();
		bookDAO = new BookDAO();
	}

	@AfterClass 
	public static void tearDownClass( ) {
		orderDAO.close();
		customerDAO.close();
		bookDAO.close();
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
			
			Book book = new Book();
			book.setBookId(33);
			orderDetail.setBook(book);
			orderDetail.setQuantity(2);
			orderDetail.setSubtotal(68.0f);
			orderDetail.setBookOrder(order);
			
			orderDetails.add(orderDetail);
			
			order.setOrderDetails(orderDetails);		
			BookOrder savedOrder = orderDAO.create(order);
			assertNotNull(savedOrder);
		} catch (Exception e) {
			 System.out.println(e.getMessage());
		}
		
	}
	
	@Test
	public void testGet() {
		Integer orderId = 50;
		BookOrder order = orderDAO.get(orderId);
		
		assertEquals(1, order.getOrderDetails().size());
	}
	
	@Test
	public void testListAll() {
		List<BookOrder> listOrders = orderDAO.listAll();
		
		for (BookOrder order : listOrders) {
			System.out.println(order.getOrderId() + " - " + order.getCustomer().getFullname()
					+ " - " + order.getTotal() + " - " + order.getStatus());
			for (OrderDetail detail : order.getOrderDetails()) {
				Book book = detail.getBook();
				int quantity = detail.getQuantity();
				float subtotal = detail.getSubtotal();
				System.out.println("\t" + book.getTitle() + " - " + quantity + " - " + subtotal);
			}
		}
		
		assertTrue(listOrders.size() > 0);
	}
	
	@Test
	public void testUpdateBookOrderShippingAddress() {
		Integer orderId = 50;
		BookOrder order = orderDAO.get(orderId);
		order.setShippingAddress("New Shipping Address");
		
		orderDAO.update(order);
		
		BookOrder updateOrder = orderDAO.get(orderId);
		
		assertEquals(order.getShippingAddress(), updateOrder.getShippingAddress());
	}
	
	@Test
	public void testDeleteOrder() {
		int orderId = 67;
		orderDAO.delete(orderId);
		
		BookOrder order = orderDAO.get(orderId);
		
		assertNull(order);
	}
	
	@Test
	public void testCount() {
		long totalOrders = orderDAO.count();
		assertEquals(2, totalOrders);
	}
}
