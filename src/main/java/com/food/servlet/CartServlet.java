package com.food.servlet;

import java.io.IOException;

import com.food.daoimpl.MenuImpl;
import com.food.daointerfaces.MenuDao;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	private Object restaurantId;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession(false); // Get the existing session; don't create a new one
	    if (session == null) {
	        resp.sendRedirect("login.jsp");
	        return;
	    }

	    Cart cart = (Cart) session.getAttribute("cart");
	    if (cart == null) {
	        cart = new Cart();
	        session.setAttribute("cart", cart);
	        System.out.println("New cart initialized and added to session.");
	    }

	    String action = req.getParameter("action");
	    String itemIdParam = req.getParameter("itemId");

	    if (action == null || itemIdParam == null) {
	        resp.sendRedirect("Cart.jsp");
	        return;
	    }

	    try {
	        int itemId = Integer.parseInt(itemIdParam);
	        MenuDao menuDao = new MenuImpl();

	        if ("add".equals(action)) {
	            Menu menuItem = menuDao.getMenu(itemId);
	            if (menuItem != null) {
	                CartItem cartItem = new CartItem(
	                    itemId,
	                    menuItem.getRestaurantId(),
	                    menuItem.getName(),
	                    menuItem.getPrice(),
	                    1
	                );
	                cart.addItem(cartItem);
	                System.out.println("Item added to cart: " + cartItem);
	                System.out.println(cart.getAllItems());
	            }
	        } else if ("update".equals(action)) {
	            String quantityParam = req.getParameter("quantity");
	            if (quantityParam != null) {
	                int quantity = Integer.parseInt(quantityParam);
	                cart.updateItem(itemId, quantity);
	                System.out.println("Item updated in cart: Item ID " + itemId + ", Quantity " + quantity);
	            }
	        } else if ("remove".equals(action)) {
	            cart.removeItem(itemId);
	            System.out.println("Item removed from cart: Item ID " + itemId);
	        }

	    } catch (NumberFormatException e) {
	        e.printStackTrace();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    session.setAttribute("cart", cart);
	    System.out.println(cart);
	    resp.sendRedirect("Cart.jsp");
	}

}