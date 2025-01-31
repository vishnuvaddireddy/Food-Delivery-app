package com.food.model;

public class Menu {
	private int menuId;
	private int restaurantId;
	private String name;
	private String description;
	private int price;
	private boolean isAvailable;
	private String ImagePath;
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public boolean getIsAvailable() {
		return isAvailable;
	}
	public void setIsAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
	}
	public String getImagePath() {
		return ImagePath;
	}
	public void setImagePath(String imagePath) {
		ImagePath = imagePath;
	}
	public Menu() {
		super();
	}
	public Menu(int menuId, int restaurantId, String name, String description, int price, boolean isAvailable,
			String imagePath) {
		super();
		this.menuId = menuId;
		this.restaurantId = restaurantId;
		this.name = name;
		this.description = description;
		this.price = price;
		this.isAvailable = isAvailable;
		ImagePath = imagePath;
	}
	public Menu(int menuId, int restaurantId, String name, int price) {
		super();
		this.menuId=menuId;
		this.restaurantId=restaurantId;
		this.name=name;
		this.price=price;
	}
	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", restaurantId=" + restaurantId + ", name=" + name + ", description="
				+ description + ", price=" + price + ", isAvailable=" + isAvailable + ", ImagePath=" + ImagePath + "]";
	}
	

}
