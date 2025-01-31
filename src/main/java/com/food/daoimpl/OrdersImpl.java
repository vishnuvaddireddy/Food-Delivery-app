package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.food.daointerfaces.OrdersDao;
import com.food.dbconnection.Dbconnection;
import com.food.model.Orders;


public class OrdersImpl implements OrdersDao {

	static ArrayList<Orders> ordersList=new ArrayList<Orders>();

    static Connection con;
	
	static {
		con = Dbconnection.connect();
	}

	

	 @Override
	    public int insert(Orders order) {
	        int orderId = 0;
	        String query = "INSERT INTO orders (userId, restaurantId, totalAmount, paymentMode, status) VALUES (?, ?, ?, ?, ?)";
	        
	        try (PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
	            stmt.setInt(1, order.getUserId());
	            stmt.setInt(2, order.getRestaurantId());
	            stmt.setFloat(3, order.getTotalAmount());
	            stmt.setString(4, order.getPaymentMode());
	            stmt.setString(5, order.getStatus());

	            int rowsAffected = stmt.executeUpdate();
	            if (rowsAffected > 0) {
	                try (ResultSet rs = stmt.getGeneratedKeys()) {
	                    if (rs.next()) {
	                        orderId = rs.getInt(1);  
	                    }
	                }
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return orderId; 
	    }
}