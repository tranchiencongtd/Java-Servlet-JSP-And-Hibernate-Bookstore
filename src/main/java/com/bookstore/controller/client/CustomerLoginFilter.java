package com.bookstore.controller.client;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class CustomerLoginFilter implements Filter {
	private static final String[] loginRequiredURLs = { "/view_profile", "/edit_profile", "/update_profile",
			"/write_review", "/checkout", "/place_order", "/view_orders", "/show_order_detail" };

	public CustomerLoginFilter() {
	}

	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();

		String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());

		if (path.startsWith("/admin/")) {
			chain.doFilter(request, response);
			return;
		}

		boolean loggedIn = session != null && session.getAttribute("loggedCustomer") != null;

		System.out.println("Path: " + path);
		System.out.println("loggedIn: " + loggedIn);

		String requestURL = httpRequest.getRequestURL().toString();
		if (!loggedIn && isLoginRequired(requestURL)) {
			String queryString = httpRequest.getQueryString();
			String redirectURL = requestURL;

			if (queryString != null) {
				redirectURL = redirectURL.concat("?").concat(queryString);
			}

			session.setAttribute("redirectURL", requestURL);

			String loginPage = "client/login.jsp";
			RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginPage);
			dispatcher.forward(request, response);
		} else {
			chain.doFilter(request, response);
		}
	}

	public boolean isLoginRequired(String requestURL) {
		for (String loginRequiredURL : loginRequiredURLs) {
			if (requestURL.contains(loginRequiredURL)) {
				return true;
			}
		}

		return false;
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
