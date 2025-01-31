package com.food.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.food.daointerfaces.MenuDao;
import com.food.dbconnection.Dbconnection;
import com.food.model.Menu;

public class MenuImpl implements MenuDao{
private static final String FETCHMENUBYRESTAURANT="select * from Menu where restaurantId=?";
	
    static Connection con;
	
	static {
		con = Dbconnection.connect();
	}

	private ResultSet resultSet;


	private PreparedStatement pstmt;

	
	@Override
	public List<Menu> fetchMenuByRestaurant(int restaurantId) {
		 List<Menu> menuList=new ArrayList<>();
		try {
			pstmt = con.prepareStatement(FETCHMENUBYRESTAURANT);
			pstmt.setInt(1,restaurantId);
			resultSet = pstmt.executeQuery();
			
			menuList = extractMenuListFromResultSet(resultSet);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return menuList;
	}

	private List<Menu> extractMenuListFromResultSet(ResultSet resultSet) {
		 List<Menu> menuList = new ArrayList<>();
		try {
		while(resultSet.next()) {
			
				menuList.add(new Menu(
						resultSet.getInt("menuId"),
						resultSet.getInt("restaurantId"),
						resultSet.getString("name"),
						resultSet.getString("description"),
						resultSet.getInt("price"),
						resultSet.getBoolean("isAvailable"),
						resultSet.getString("ImagePath")));
			}
		
		}
			catch(Exception e) {
				e.printStackTrace();
			
		}
		return menuList;
	}

	public Menu getMenu(int menuId) {
	    String query = "SELECT * FROM menu WHERE menuId = ?";
	    PreparedStatement statement;
		try {
			statement = con.prepareStatement(query);
			statement.setInt(1, menuId);
		    ResultSet resultSet = statement.executeQuery();
		
	    

	    if (resultSet.next()) {
	        return new Menu(
	            resultSet.getInt("menuId"),
	            resultSet.getInt("restaurantId"),
	            resultSet.getString("name"),
	            resultSet.getInt("price")
	        );
	    }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    return null; 
	}
	

}
