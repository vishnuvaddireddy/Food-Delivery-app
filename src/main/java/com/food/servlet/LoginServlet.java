package com.food.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.food.model.User;
import com.food.secure.DecryptData;
import com.food.secure.EncryptData;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet res;


	private String checkEmail="select * from user where email=?";

	@Override
	public void init() throws ServletException {
	    String url = "jdbc:mysql://localhost:3306/foodapp";
	    String dbUn = "root";
	    String dbPwd = "Hari@123";
	    
	    super.init();
	    
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        con = DriverManager.getConnection(url, dbUn, dbPwd);
	        System.out.println("Database connection successful!");
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw new ServletException("Database connection failed!", e); // This will propagate the error and help in debugging.
	    }
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		String email=EncryptData.encrypt(req.getParameter("email"));
		String password=EncryptData.encrypt(req.getParameter("password"));

		try {
			
			pstmt = con.prepareStatement(checkEmail);
			pstmt.setString(1, email);
			res = pstmt.executeQuery();

			if(res.next()) {
				if(password.equals(res.getString("password"))){

					User user=new User();
					user.setUserId(res.getInt("userId"));
                    user.setUsername(DecryptData.decrypt(res.getString("username")));
                    user.setPassword(DecryptData.decrypt(res.getString("password")));
                    user.setEmail(DecryptData.decrypt(res.getString("email")));
                    user.setAddress(DecryptData.decrypt(res.getString("address")));

					session.setAttribute("user", user);
					
					Cookie ck3=new Cookie("email",email);
					
					ck3.setMaxAge(20);
					
					resp.addCookie(ck3);
				


					
				String username = res.getString("username");
					session.setAttribute("username", DecryptData.decrypt(username));
				
					
					

					req.getRequestDispatcher("getAllRestaurants").forward(req, resp);

				}
				else {
					resp.sendRedirect("passwordMismatch.jsp");
				}

			}else {
				resp.sendRedirect("invalidUser.jsp");
			}

		}
		catch(Exception e) {
			e.printStackTrace();
		}

	}
	@Override
	public void destroy() {
		try {
			
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}


}