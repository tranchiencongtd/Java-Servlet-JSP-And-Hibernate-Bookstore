package com.bookstore.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.bookstore.controller.client.shoppingcart.ShoppingCart;
import com.bookstore.dao.BookDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class OrderServices {
	private OrderDAO orderDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public OrderServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.orderDAO = new OrderDAO();
	}

	public void listAllOrder() throws ServletException, IOException {
		listAllOrder(null);
	}

	public void listAllOrder(String message) throws ServletException, IOException {
		List<BookOrder> listOrder = orderDAO.listAll();

		if (message != null) {
			request.setAttribute("message", message);
		}

		request.setAttribute("listOrder", listOrder);

		String listPage = "order_list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(listPage);
		dispatcher.forward(request, response);
	}

	public void viewOrderDetailForAdmin() throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));

		BookOrder order = orderDAO.get(orderId);
		request.setAttribute("order", order);

		String detailPage = "order_detail.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
		dispatcher.forward(request, response);

	}

	public void showCheckoutForm() throws ServletException, IOException {
		HttpSession session = request.getSession();
		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");

		// tax is 10% of subtotal
		float tax = shoppingCart.getTotalAmount() * 0.1f;

		// shipping fee is 1.0 USD per copy
		float shippingFee = shoppingCart.getTotalQuantity() * 1.0f;

		float total = shoppingCart.getTotalAmount();

		session.setAttribute("total", total);

		CommonUtility.generateCountryList(request);

		String checkOutPage = "client/checkout.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(checkOutPage);
		dispatcher.forward(request, response);
	}

	public void placeOrder() throws ServletException, IOException {	
		 String paymentMethod = request.getParameter("paymentMethod"); 
		 BookOrder order = readOrderInfo();
		  
			/*
			 * if (paymentMethod.equals("paypal")) { PaymentServices paymentServices = new
			 * PaymentServices(request, response);
			 * request.getSession().setAttribute("order4Paypal", order);
			 * paymentServices.authorizePayment(order); } else { // Cash on Delivery
			 */		  placeOrderCOD(order); 
			/* } */
		 
	}

	/*
	 * public Integer placeOrderPaypal(Payment payment) {
	 * 
	 * BookOrder order = (BookOrder)
	 * request.getSession().getAttribute("order4Paypal"); ItemList itemList =
	 * payment.getTransactions().get(0).getItemList(); ShippingAddress
	 * shippingAddress = itemList.getShippingAddress(); String shippingPhoneNumber =
	 * itemList.getShippingPhoneNumber();
	 * 
	 * String recipientName = shippingAddress.getRecipientName(); String[] names =
	 * recipientName.split(" ");
	 * 
	 * order.setFirstname(names[0]); order.setLastname(names[1]);
	 * order.setAddressLine1(shippingAddress.getLine1());
	 * order.setAddressLine2(shippingAddress.getLine2());
	 * order.setCity(shippingAddress.getCity());
	 * order.setState(shippingAddress.getState());
	 * order.setCountry(shippingAddress.getCountryCode());
	 * order.setPhone(shippingPhoneNumber);
	 * 
	 * return saveOrder(order);
	 * 
	 * }
	 */

	private Integer saveOrder(BookOrder order) {
		BookOrder savedOrder = orderDAO.create(order);

		ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
		shoppingCart.clear();

		return savedOrder.getOrderId();
	}

	private BookOrder readOrderInfo() {
		String paymentMethod = request.getParameter("paymentMethod");
		String fullName = request.getParameter("fullname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		BookOrder order = new BookOrder();
		order.setRecipientName(fullName);
		order.setRecipientPhone(phone);
		order.setShippingAddress(address);
		order.setPaymentMethod(paymentMethod);

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		order.setCustomer(customer);

		ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
		Map<Book, Integer> items = shoppingCart.getItems();

		Iterator<Book> iterator = items.keySet().iterator();

		Set<OrderDetail> orderDetails = new HashSet<>();

		while (iterator.hasNext()) {
			Book book = iterator.next();
			Integer quantity = items.get(book);
			float subtotal = quantity * book.getPrice();
				

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(book);
			orderDetail.setBookOrder(order);
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);

			orderDetails.add(orderDetail);
		}

		order.setOrderDetails(orderDetails);

		float total = (float) session.getAttribute("total");

		order.setTotal(total);

		return order;
	}

	private void placeOrderCOD(BookOrder order) throws ServletException, IOException {
		saveOrder(order);

		String message = "Cảm ơn bạn đã đặt hàng." + " Chúng tôi sẽ giao hàng với bạn trong vài ngày tới.";
		request.setAttribute("message", message);
		String messagePage = "client/message.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(messagePage);
		dispatcher.forward(request, response);
	}

	public void listOrderByCustomer() throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");
		List<BookOrder> listOrders = orderDAO.listByCustomer(customer.getCustomerId());

		request.setAttribute("listOrders", listOrders);

		String historyPage = "client/order_list.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(historyPage);
		dispatcher.forward(request, response);
	}

	public void showOrderDetailForCustomer() throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("id"));

		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("loggedCustomer");

		BookOrder order = orderDAO.get(orderId, customer.getCustomerId());
		request.setAttribute("order", order);

		String detailPage = "client/order_detail.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(detailPage);
		dispatcher.forward(request, response);
	}

	public void showEditOrderForm() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("id"));

		HttpSession session = request.getSession();
		Object isPendingBook = session.getAttribute("NewBookPendingToAddToOrder");

		if (isPendingBook == null) {
			BookOrder order = orderDAO.get(orderId);
			session.setAttribute("order", order);
		} else {
			session.removeAttribute("NewBookPendingToAddToOrder");
		}

		CommonUtility.generateCountryList(request);

		String editPage = "order_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
		dispatcher.forward(request, response);
	}

	public void updateOrder() throws ServletException, IOException {
		HttpSession session = request.getSession();
		BookOrder order = (BookOrder) session.getAttribute("order");

		String fullname = request.getParameter("fullname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");


		String paymentMethod = request.getParameter("paymentMethod");
		String orderStatus = request.getParameter("orderStatus");

		order.setRecipientName(fullname);
		order.setRecipientPhone(phone);
		order.setShippingAddress(address);
		order.setPaymentMethod(paymentMethod);
		order.setStatus(orderStatus);

		String[] arrayBookId = request.getParameterValues("bookId");
		String[] arrayPrice = request.getParameterValues("price");
		String[] arrayQuantity = new String[arrayBookId.length];

		for (int i = 1; i <= arrayQuantity.length; i++) {
			arrayQuantity[i - 1] = request.getParameter("quantity" + i);
		}

		Set<OrderDetail> orderDetails = order.getOrderDetails();
		orderDetails.clear();

		float totalAmount = 0.0f;

		for (int i = 0; i < arrayBookId.length; i++) {
			int bookId = Integer.parseInt(arrayBookId[i]);
			int quantity = Integer.parseInt(arrayQuantity[i]);
			float price = Float.parseFloat(arrayPrice[i]);

			float subtotal = price * quantity;

			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(new Book(bookId));
			orderDetail.setQuantity(quantity);

			orderDetail.setBookOrder(order);

			orderDetails.add(orderDetail);

			totalAmount += subtotal;
		}

		order.setTotal(totalAmount);

		orderDAO.update(order);

		String message = "Đơn hàng " + order.getOrderId() + " đã cập nhật thành công";

		listAllOrder(message);
	}

	public void deleteOrder() throws ServletException, IOException {
		Integer orderId = Integer.parseInt(request.getParameter("id"));
		orderDAO.delete(orderId);

		String message = "Đã xóa thành công đơn hàng có mã: " + orderId;
		listAllOrder(message);
	}
	
	public void addBookToOrder() throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		BookDAO bookDAO = new BookDAO();
		Book book = bookDAO.get(bookId);
		
		HttpSession session = request.getSession();
		BookOrder order = (BookOrder) session.getAttribute("order");
		
		Set<OrderDetail> orderDetails = order.getOrderDetails();
		Iterator<OrderDetail> iterator = orderDetails.iterator();
		float subtotal = quantity * book.getPrice();
		Boolean exist = false;
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			
			if (orderDetail.getBook().getBookId() == bookId) {
				orderDetail.setQuantity(quantity + orderDetail.getQuantity());
				subtotal += orderDetail.getSubtotal();
				orderDetail.setSubtotal(subtotal);
				exist = true;
			}
		}
		
		float newTotal = order.getTotal() + subtotal;
		order.setTotal(newTotal);
		
		if(!exist) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setBook(book);
			orderDetail.setQuantity(quantity);
			orderDetail.setSubtotal(subtotal);
			
			
			order.getOrderDetails().add(orderDetail);
		}
		
		request.setAttribute("book", book);
		session.setAttribute("NewBookPendingToAddToOrder", true);
		
		String resultPage = "add_book_result.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(resultPage);
		dispatcher.forward(request, response);
	}
	
	public void removeBookFromOrder() throws ServletException, IOException {
		int bookId = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession();
		BookOrder order = (BookOrder) session.getAttribute("order");
		
		Set<OrderDetail> orderDetails = order.getOrderDetails();
		Iterator<OrderDetail> iterator = orderDetails.iterator();
		
		while (iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			
			if (orderDetail.getBook().getBookId() == bookId) {
				float newTotal = order.getTotal() - orderDetail.getSubtotal();
				order.setTotal(newTotal);
				iterator.remove();
			}
		}
		
		String editOrderFormPage = "order_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(editOrderFormPage);
		dispatcher.forward(request, response);
	}
}
