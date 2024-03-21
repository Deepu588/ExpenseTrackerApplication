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
 * Servlet implementation class DeleteUserRequest
 */
@WebServlet("/DeleteUserRequest")
public class DeleteUserRequest extends HttpServlet {
	private UserService userService=new UserServieImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		String uId=request.getParameter("userid");
		if(uId!=null)
		{
			int userId=Integer.parseInt(uId);
		int status=	userService.deleteUserRequest(userId);
			if(status!=0)
			{
				request.setAttribute("delMsg","DELETED USER SUCCESSFULLY");
				RequestDispatcher dispatcher=request.getRequestDispatcher("ViewUserRequests.jsp");
				dispatcher.include(request, response);
			}
		}


	}

}
