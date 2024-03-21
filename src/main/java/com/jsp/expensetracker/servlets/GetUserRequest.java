package com.jsp.expensetracker.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.expensetracker.entity.UserRequest;
import com.jsp.expensetracker.service.ExpenseService;
import com.jsp.expensetracker.service.ExpenseServiceImpl;


@WebServlet("/GetUserRequest")
public class GetUserRequest extends HttpServlet {
	private ExpenseService expenseService=new ExpenseServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
		List<UserRequest> allUsersRequests=expenseService.ViewUserRequest();
		
		System.out.println(allUsersRequests);
		
		request.setAttribute("requests",allUsersRequests);
		RequestDispatcher dispatcher=request.getRequestDispatcher("ViewUserRequests.jsp");
		dispatcher.include(request, response);
		

	}

}
