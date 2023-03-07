package com.bookstore.controller.admin;

import java.io.IOException;

import com.bookstore.service.UserServices;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

    public AdminLoginServlet() {
    }

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
        UserServices userServices = new UserServices(request, response);
        userServices.login();
	}

}
