package com.food.daointerfaces;

import java.util.List;

//import java.util.ArrayList;

import com.food.model.OrderItems;

public interface OrderItemsDao {
	
	int insert(OrderItems oi);
	List<OrderItems> getAllByOrderId(int orderId);

 
}