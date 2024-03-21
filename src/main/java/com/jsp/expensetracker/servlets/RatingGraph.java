package com.jsp.expensetracker.servlets;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.expensetracker.service.UserService;
import com.jsp.expensetracker.service.UserServieImpl;

/**
 * Servlet implementation class RatingGraph
 */
@WebServlet("/RatingGraph")
public class RatingGraph extends HttpServlet {
	private UserService userService=new UserServieImpl();
 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
          int onesCount=userService.fetchRating(1);
          int twosCount=userService.fetchRating(2);
          int threesCount=userService.fetchRating(3);
          int foursCount=userService.fetchRating(4);
          int fivesCount=userService.fetchRating(5);
          
          
          request.setAttribute("one", onesCount);
          request.setAttribute("two", twosCount);
          request.setAttribute("three", threesCount);
          request.setAttribute("four", foursCount);
          request.setAttribute("five", fivesCount);

          RequestDispatcher dispatcher=request.getRequestDispatcher("RatingGraph.jsp");
			dispatcher.include(request, response);
	}

}
