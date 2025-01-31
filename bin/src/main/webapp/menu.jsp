<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.food.model.Menu" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu</title>
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            padding: 20px 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
        }

        .menu-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .menu-card {
            backdrop-filter: blur(10px);
            background-color: rgba(255, 255, 255, 0.95);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            overflow: hidden;
            width: 250px;
            margin: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .menu-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }

        .image-container {
            position: relative;
            height: 220px;
            width: 100%;
            overflow: hidden;
            background-color: #f2f2f2;
        }

        .menu-image {
            height: 100%;
            width: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .menu-card:hover .menu-image {
            transform: scale(1.05);
        }

        .card-content {
            padding: 20px;
        }

        .item-name {
            color: #2c3e50;
            font-size: 1.4em;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .item-description {
            font-size: 0.95em;
            line-height: 1.5;
            color: #555;
            margin: 10px 0;
        }

        .price {
            font-weight: bold;
            font-size: 1.3em;
            color: #e74c3c;
            text-shadow: 1px 1px 1px rgba(0,0,0,0.1);
            margin-top: 10px;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
        }

        .availability-badge {
            text-transform: uppercase;
            font-size: 0.8em;
            font-weight: bold;
            letter-spacing: 0.5px;
            padding: 5px 10px;
            border-radius: 5px;
            color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .available {
            background: linear-gradient(45deg, #28a745, #20c997);
        }

        .unavailable {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
        }

        .add-button {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 1em;
            cursor: pointer;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        .add-button:hover {
            background: linear-gradient(45deg, #2980b9, #3498db);
            transform: translateY(-2px);
        }

        /* Header Styling */
        .header {
            background: linear-gradient(45deg, #2c3e50, #3498db);
            color: white;
            text-align: center;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .header h1 {
            margin: 0;
            font-size: 2.5em;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        /* Empty State Styling */
        .empty-state {
            text-align: center;
            padding: 50px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            margin: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .empty-state h3 {
            color: #666;
            font-size: 1.5em;
        }

        @media (max-width: 768px) {
            .menu-container {
                padding: 10px;
            }
            
            .menu-card {
                width: calc(100% - 20px);
                margin: 10px;
            }

            .header h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Our Menu</h1>
    </div>

    <div class="menu-container">
        <% 
            List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
            if (menuList != null && !menuList.isEmpty()) {
                for (Menu menu : menuList) {
        %>
            <div class="menu-card">
                <div class="image-container">
                    <img src="<%= menu.getImagePath() %>" 
                         alt="<%= menu.getName() %>"
                         class="menu-image"
                         onerror="this.src='images/default-food.jpg'">
                </div>
                <div class="card-content">
                    <div class="item-name"><%= menu.getName() %></div>
                    <div class="item-description"><%= menu.getDescription() %></div>
                    <div class="price">₹<%= menu.getPrice() %></div>
                    <div class="card-footer">
                        <span class="availability-badge <%= menu.getIsAvailable() ? "available" : "unavailable" %>">
                            <%= menu.getIsAvailable() ? "Available" : "Not Available" %>
                        </span>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="itemId" value="<%= menu.getMenuId() %>">
                            <button type="submit" class="add-button">Add to cart</button>
                        </form>
                    </div>
                </div>
            </div>
        <% 
                }
            } else {
        %>
            <div class="empty-state">
                <h3>No menu items available</h3>
            </div>
        <% 
            }
        %>
    </div>
</body>
</html>