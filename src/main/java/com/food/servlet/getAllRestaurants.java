package com.food.servlet;

import java.io.IOException;
import java.util.List;

import com.food.daoimpl.RestaurantImpl;
import com.food.daointerfaces.RestaurantDao;
import com.food.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class getAllRestaurants extends HttpServlet {
	@Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        RestaurantDao rdao = new RestaurantImpl();
        List<Restaurant> restaurantList = rdao.fetchAll();
        
        System.out.println(restaurantList);

        if (restaurantList != null ) {
           
            HttpSession session = req.getSession();
            session.setAttribute("restaurantList", restaurantList);
            resp.sendRedirect("home.jsp");  // Using absolute path

        } else {
            
            resp.sendRedirect("noRestaurants.jsp"); 
        }
    }
}