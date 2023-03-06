package com.bookstore.controller.client;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.util.List;

import com.bookstore.controller.BaseServlet;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;

@WebFilter("/*")
public class CommonFilter extends BaseServlet implements Filter {
	private static final long serialVersionUID = 1L;
	private CategoryDAO categoryDAO;
  
	public CommonFilter() {
		super();
    	categoryDAO = new CategoryDAO(entityManager);
    }
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		String path = httpServletRequest.getRequestURI().substring(httpServletRequest.getContextPath().length());
		
		if (!path.startsWith("/admin/")) {
			
	        List<Category> listCategory = categoryDAO.listAll();
			request.setAttribute("listCategory", listCategory);
			
		}
		
		chain.doFilter(request, response);
		
	}
	
	public void destroy() {
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
    	categoryDAO = new CategoryDAO(entityManager);
	}

}
