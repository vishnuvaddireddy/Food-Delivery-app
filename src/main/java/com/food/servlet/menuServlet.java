package com.food.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.food.daoimpl.MenuImpl;
import com.food.daointerfaces.MenuDao;
import com.food.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class menuServlet extends HttpServlet {


	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String restaurantIdParam = request.getParameter("restaurantId");
	        int restaurantId =  Integer.parseInt(restaurantIdParam);

	        MenuDao menuDAO = new MenuImpl();
	        List<Menu> menuList = menuDAO.fetchMenuByRestaurant(restaurantId);
	        System.out.println(menuList);
	      

	        // Ensure an empty list is returned instead of null
	        if (menuList == null || menuList.isEmpty()) {
	            menuList = new ArrayList<>();
	        }

	        request.setAttribute("menuList", menuList);
	        request.getRequestDispatcher("menu.jsp").forward(request, response);
	    }
	
	
}