package com.jsp.expensetracker.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.expensetracker.service.ExpenseService;
import com.jsp.expensetracker.service.ExpenseServiceImpl;

/**
 * Servlet implementation class SendExpenses
 */
@WebServlet("/SendExpenses")
public class SendExpenses extends HttpServlet {
	private ExpenseService expenseService=new ExpenseServiceImpl();
 
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int userId=Integer.parseInt(request.getParameter("uid"));
		String uname=request.getParameter("uname");
		String email=request.getParameter("email");
		
		System.out.println(userId+"  "+uname+"   "+email);
		
		
		int result=expenseService.addingRequest(userId, uname, email);
		
		if(result!=0)
		{
			request.setAttribute("cfm", "YOUR REQUEST IS SENT ");
			RequestDispatcher dispatcher=request.getRequestDispatcher("home.jsp");
			dispatcher.include(request, response);

		}
	}

}
