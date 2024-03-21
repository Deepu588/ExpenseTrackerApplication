package com.jsp.expensetracker.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.expensetracker.entity.User;


@WebServlet("/ViewUser")
public class ViewUser extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="jdbc:mysql://localhost:3306/expensetracker51?user=root & password=12345";
		String query="select  * from user";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

		Connection connect=DriverManager.getConnection(url);
		PreparedStatement ptsmt=connect.prepareStatement(query);
		ResultSet res=ptsmt.executeQuery();
		List<User> usersList=new ArrayList<User>();
		if(res.isBeforeFirst())
		{
			while(res.next())
			{
				User user =new User();
				user.setUserId(res.getInt("userId"));
				user.setUsername(res.getString("username"));
				user.setFullname(res.getString("fullname"));
				user.setEmail(res.getString("email"));
				user.setMobile(res.getString("mobile"));
				user.setPassword(res.getString("password"));
				usersList.add(user);
				System.out.println(user);
			}
		

		}
		request.setAttribute("userlist", usersList);
		RequestDispatcher dispatcher=request.getRequestDispatcher("ViewUser.jsp");
		dispatcher.include(request, response);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

}
	

}
