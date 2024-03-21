package com.jsp.expensetracker.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.expensetracker.entity.Expense;
import com.jsp.expensetracker.entity.User;
import com.jsp.expensetracker.service.ExpenseService;
import com.jsp.expensetracker.service.ExpenseServiceImpl;
import com.jsp.expensetracker.service.UserService;
import com.jsp.expensetracker.service.UserServieImpl;

/**
 * Servlet implementation class PreviewUserExpenses
 */
@WebServlet("/PreviewUserExpenses")
public class PreviewUserExpenses extends HttpServlet {
	private ExpenseService expenseService=new ExpenseServiceImpl();

	private UserService userService=new UserServieImpl();


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String ud=request.getParameter("uid");
		System.out.println("PREVIEW USER ID __ "+ud);
		if(ud!=null) {
		int userId=Integer.parseInt(ud);
		try {
		User userDetails=userService.findUserById(userId);
		List<Expense> listOfUserExpense=expenseService.viewExpense(userId);
			
		request.setAttribute("userDetails",userDetails);
		request.setAttribute("expensesList", listOfUserExpense);
		RequestDispatcher dispatcher=request.getRequestDispatcher("PreviewUserExpenses.jsp");
		dispatcher.include(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		}
	
	}

	}


