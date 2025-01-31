package com.food.daointerfaces;

import java.util.ArrayList;

import com.food.model.Restaurant;

public interface RestaurantDao {
	ArrayList<Restaurant> fetchAll();

}
