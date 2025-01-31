package com.food.servlet;

import java.io.IOException;

import com.food.daoimpl.UserImpl;
import com.food.daointerfaces.UserDao;
import com.food.model.User;
import com.food.secure.EncryptData;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String password=req.getParameter("password");
		
		if(password.equals(req.getParameter("cpassword"))) {
			 String username=EncryptData.encrypt(req.getParameter("username"));
			 password=EncryptData.encrypt(req.getParameter("password"));
			 String email=EncryptData.encrypt(req.getParameter("email"));
			 String address=EncryptData.encrypt(req.getParameter("address"));
			
			
			
			UserDao udaoi=new UserImpl();
			udaoi.insert(new User(username,password,email,address));
			
			resp.sendRedirect("login.jsp");
		}
		else {
			resp.sendRedirect("failure.jsp");
		}
	
}

}