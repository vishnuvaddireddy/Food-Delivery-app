package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.ResultSet;
//import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.daointerfaces.OrderItemsDao;
import com.food.dbconnection.Dbconnection;
import com.food.model.OrderItems;


public class OrderItemsImpl implements OrderItemsDao {
	
	static ArrayList<OrderItems> orderItemsList=new ArrayList<OrderItems>();
	private static final  String INSERTQUERY = "Insert into OrderItems(orderItemId,orderId,menuId,quantity,itemTotal) "
			                                   + "values(?,?,?,?,?)";
	static final String SELECT_BY_ORDERID_QUERY = "SELECT * FROM Orderitems WHERE orderId=?";

    static Connection con;
	
	static {
		con = Dbconnection.connect();
	}

	private PreparedStatement pstmt;


	@Override
	public int insert(OrderItems oi) {
		try {
			pstmt = con.prepareStatement(INSERTQUERY);
			pstmt.setInt(1, oi.getOrderItemId());
			pstmt.setInt(2, oi.getOrderId());
			pstmt.setInt(3, oi.getMenuId());
			pstmt.setInt(4, oi.getQuantity());
			pstmt.setDouble(5, oi.getItemTotal());
		
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	 @Override
	    public List<OrderItems> getAllByOrderId(int orderId) {
	        List<OrderItems> orderItemsList = new ArrayList<>();
	        try (PreparedStatement pstmt = con.prepareStatement(SELECT_BY_ORDERID_QUERY)) {
	            pstmt.setInt(1, orderId);
	            ResultSet res = pstmt.executeQuery();
	            while (res.next()) {
	                orderItemsList.add(new OrderItems(
	                    res.getInt("orderItemId"),
	                    res.getInt("orderId"),
	                    res.getInt("menuId"),
	                    res.getInt("quantity"),
	                    res.getDouble("itemTotal")
	                ));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return orderItemsList;
	    }

}