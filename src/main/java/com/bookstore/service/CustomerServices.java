package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class CustomerServices {
	private CustomerDAO customerDao;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		this.customerDao = new CustomerDAO();
	}

	public void listCustomer(String message) throws ServletException, IOException {
		List<Customer> listCustomer = customerDao.listAll();

		request.setAttribute("listCustomer", listCustomer);
		
		if(message != null) {
			request.setAttribute("message", message);
		}

		String listPage = "customer_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);

	}

	public void listCustomer() throws ServletException, IOException {
		listCustomer(null);
	}

	public void createCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDao.findByEmail(email);

		if (existCustomer != null) {
			String message = "Không thể tạo mới email " + email
					+ " đã được sử dụng";
			listCustomer(message);
		} else {
			Customer newCustomer = new Customer();
			updateCustomerFieldsFromForm(newCustomer);
			customerDao.create(newCustomer);

			String message = "Tạo mới thành công";
			listCustomer(message);
		}
	}

	private void updateCustomerFieldsFromForm(Customer customer) {
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullName");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String city = request.getParameter("city");
		String zipCode = request.getParameter("zipCode");
		String country = request.getParameter("country");
		String address = request.getParameter("address");

		if (email != null && !email.equals("")) {
			customer.setEmail(email);
		}

		customer.setFullname(fullName);

		if (password != null && !password.equals("")) {
			customer.setPassword(password);
		}

		customer.setPhone(phone);
		customer.setCity(city);
		customer.setZipcode(zipCode);
		customer.setCountry(country);
		customer.setAddress(address);

	}

	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		Customer existCustomer = customerDao.findByEmail(email);
		String message = "";

		if (existCustomer != null) {
			message = "Could not register. The email " + email + " is already registered by another customer";
		} else {
			Customer newCustomer = new Customer();
			updateCustomerFieldsFromForm(newCustomer);

			customerDao.create(newCustomer);

			message = "You have been created successfully, thank you!<br/>" + "<a href='login'>Click here</a> to login";
		}

		String messagePage = "frontend/message.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(messagePage);
		request.setAttribute("message", message);
		requestDispatcher.forward(request, response);
	}

	public void editCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDao.get(customerId);

		request.setAttribute("customer", customer);

		CommonUtility.generateCountryList(request);

		String editPage = "customer_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");

		Customer customerByEmail = customerDao.findByEmail(email);
		String message = null;

		if (customerByEmail != null && customerByEmail.getCustomerId() != customerId) {
			message = "Không thể cập nhật khách hàng ID " + customerId
					+ " bởi vì email đã được sử dụng.";
		} else {

			Customer customerById = customerDao.get(customerId);
			updateCustomerFieldsFromForm(customerById);
			customerDao.update(customerById);

			message = "Cập nhật thành công.";
		}
		listCustomer(message);

	}

	public void deleteCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		customerDao.delete(customerId);

		String message = "Xóa khách hàng thành công.";
		listCustomer(message);
	}

	public void showLogin() throws ServletException, IOException {
		String loginPage = "frontend/login.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(loginPage);
		dispatcher.forward(request, response);
	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("email");

		Customer customer = customerDao.checkLogin(email, password);

		if (customer == null) {
			String message = "Login failed. Please check your email and password";
			request.setAttribute("message", message);
			showLogin();
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loggedCustomer", customer);

			Object objRedictedURL = session.getAttribute("redirectURL");

			if (objRedictedURL != null) {
				String redirectURL = (String) objRedictedURL;
				session.removeAttribute(redirectURL);
				response.sendRedirect(redirectURL);
			} else {
				showCustomerProfile();
			}
		}
	}

	public void showCustomerProfile() throws ServletException, IOException {

		String profilePage = "frontend/customer_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(profilePage);
		dispatcher.forward(request, response);
	}

	public void showCustomerProfileEditForm() throws ServletException, IOException {
		CommonUtility.generateCountryList(request);

		String editPage = "frontend/edit_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
		dispatcher.forward(request, response);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		updateCustomerFieldsFromForm(customer);
		customerDao.update(customer);
		showCustomerProfile();
	}

	public void newCustomer() throws ServletException, IOException {
		CommonUtility.generateCountryList(request);

		String customerForm = "customer_form.jsp";
		request.getRequestDispatcher(customerForm).forward(request, response);
	}

	public void ShowCustomerRegisterForm() throws ServletException, IOException {
		CommonUtility.generateCountryList(request);

		String registerForm = "frontend/register_form.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(registerForm);
		dispatcher.forward(request, response);
	}
}
