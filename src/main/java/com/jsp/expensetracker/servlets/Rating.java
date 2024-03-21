package com.jsp.expensetracker.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.expensetracker.service.UserService;
import com.jsp.expensetracker.service.UserServieImpl;

/**
 * Servlet implementation class Rating
 */
@WebServlet("/Rating")
public class Rating extends HttpServlet {
	private UserService userService=new UserServieImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int number=Integer.parseInt(request.getParameter("rateVal"));
		System.out.println(number);
		int status=userService.addRating(number);
		System.out.println(status);
		if(status!=0) {
			
			request.setAttribute("number", number);
			System.out.println(number+" -");
			RequestDispatcher dispatcher=request.getRequestDispatcher("rating.jsp");
			dispatcher.include(request, response);
		}

	}

}
