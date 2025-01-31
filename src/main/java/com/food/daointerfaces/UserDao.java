package com.food.daointerfaces;

import java.util.ArrayList;

import com.food.model.User;

public interface UserDao {
	int insert(User u);
	ArrayList<User> fetchAll();
	User fetchOne(int i);
	int update(int userId,String password);
	int delete(int userId);
	User fetch(String email);

}
