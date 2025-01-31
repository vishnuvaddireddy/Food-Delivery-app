<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.food.model.Cart, com.food.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }

        .cart-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            font-size: 2.5em;
            margin-bottom: 30px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .cart-item-card {
            display: flex;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            margin: 20px 0;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .cart-item-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
        }

        .cart-item-image {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 15px 0 0 15px;
        }

        .cart-item-details {
            padding: 25px;
            flex-grow: 1;
        }

        .cart-item-name {
            font-size: 1.6em;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 15px;
        }

        .cart-item-price {
            font-size: 1.4em;
            color: #e74c3c;
            font-weight: bold;
            margin-bottom: 15px;
            text-shadow: 1px 1px 1px rgba(0,0,0,0.1);
        }

        .quantity-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        .quantity-buttons {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .quantity-button {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            border: none;
            padding: 8px 15px;
            font-size: 1.2em;
            cursor: pointer;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .quantity-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }

        .quantity-buttons span {
            font-size: 1.2em;
            font-weight: bold;
            color: #2c3e50;
            min-width: 30px;
            text-align: center;
        }

        .remove-button {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 1.1em;
            cursor: pointer;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .remove-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            background: linear-gradient(45deg, #c0392b, #e74c3c);
        }

        .total-price {
            text-align: right;
            font-size: 1.8em;
            font-weight: bold;
            color: #2c3e50;
            margin: 30px 0;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .action-buttons {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-top: 30px;
        }

        .action-buttons a {
            flex: 1;
            text-align: center;
            padding: 15px 30px;
            border-radius: 10px;
            font-size: 1.2em;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .add-more {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
        }

        .checkout {
            background: linear-gradient(45deg, #f39c12, #e67e22);
            color: white;
            box-shadow: 0 4px 15px rgba(243, 156, 18, 0.3);
        }

        .action-buttons a:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
        }

        .empty-cart {
            text-align: center;
            padding: 50px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            margin: 40px auto;
            max-width: 600px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }

        .empty-cart h3 {
            color: #666;
            font-size: 1.8em;
            margin: 0;
        }

        @media (max-width: 768px) {
            .cart-container {
                padding: 20px 10px;
            }

            .cart-item-card {
                flex-direction: column;
            }

            .cart-item-image {
                width: 100%;
                border-radius: 15px 15px 0 0;
            }

            .action-buttons {
                flex-direction: column;
            }

            .action-buttons a {
                width: 100%;
            }

            h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
    <div class="cart-container">
        <h1>Your Cart</h1>
        <% 
            Cart cart = (Cart) session.getAttribute("cart");
            int restaurantId = 0;

            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            if (!cart.getAllItems().isEmpty()) {
                restaurantId = cart.getAllItems().values().iterator().next().getRestaurantId();
            }

            Map<Integer, CartItem> cartItems = cart.getAllItems();
            double totalPrice = 0;

            if (cartItems != null && !cartItems.isEmpty()) {
                for (CartItem cartItem : cartItems.values()) {
                    totalPrice += cartItem.getPrice() * cartItem.getQuantity();
        %>
        <div class="cart-item-card">
            <div class="cart-item-details">
                <div class="cart-item-name"><%= cartItem.getName() %></div>
                <div class="cart-item-price">₹<%= cartItem.getPrice() %></div>
                <div class="quantity-controls">
                    <form action="cart" method="post" class="quantity-buttons">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="itemId" value="<%= cartItem.getItemId() %>">
                        <button type="submit" name="quantity" value="<%= Math.max(1, cartItem.getQuantity() - 1) %>" class="quantity-button">-</button>
                        <span><%= cartItem.getQuantity() %></span>
                        <button type="submit" name="quantity" value="<%= cartItem.getQuantity() + 1 %>" class="quantity-button">+</button>
                    </form>
                    <form action="cart" method="post">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="itemId" value="<%= cartItem.getItemId() %>">
                        <button type="submit" class="remove-button">Remove</button>
                    </form>
                </div>
            </div>
        </div>
        <% 
                }
        %>
        <% session.setAttribute("restaurantId", restaurantId); %>
        <% session.setAttribute("totalAmount", totalPrice); %>

        <div class="total-price">Total Price: ₹<%= totalPrice %></div>

        <div class="action-buttons">
            <a href="menu?restaurantId=<%= restaurantId %>" class="add-more">
                Add More Items
            </a>
            <a href="CheckOut.jsp" class="checkout">
                Proceed to Checkout
            </a>
        </div>
        <% 
            } else {
        %>
        <div class="empty-cart">
            <h3>Your cart is empty!</h3>
        </div>
        <% 
            }
        %>
    </div>
</body>
</html>