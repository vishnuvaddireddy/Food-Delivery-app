package com.food.daoimpl;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.food.daointerfaces.RestaurantDao;
import com.food.dbconnection.Dbconnection;
import com.food.model.Restaurant;

public class RestaurantImpl implements RestaurantDao{
	static ArrayList<Restaurant> restaurantList=new ArrayList<Restaurant>();
	private static final  String FETCHALL = "select * from Restaurant";

	static Connection con;

	static {
		con=Dbconnection.connect();
	}

	private ResultSet resultSet;
	private Statement stmt;
	
	@Override
	public ArrayList<Restaurant> fetchAll() {
		try {
			stmt = con.createStatement();
			resultSet = stmt.executeQuery(FETCHALL);
			restaurantList = extractRestaurantListFromResultSet(resultSet);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return restaurantList;

	}
	ArrayList<Restaurant> extractRestaurantListFromResultSet(ResultSet resultSet) {

		try {
			while(resultSet.next()) {

				restaurantList.add(new Restaurant(
						resultSet.getInt("restaurantId"),
						resultSet.getString("name"),
						resultSet.getString("cuisineType"),
						resultSet.getInt("deliveryTime"),
						resultSet.getString("address"),
						resultSet.getFloat("ratings"),
						resultSet.getBoolean("isAvailable"),
						resultSet.getString("imagePath")));
			}

		}
		catch(Exception e) {
			e.printStackTrace();

		}
		return restaurantList;
	}
	

}
