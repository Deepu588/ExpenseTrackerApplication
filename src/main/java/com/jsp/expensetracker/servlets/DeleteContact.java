package com.jsp.expensetracker.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.expensetracker.service.UserService;
import com.jsp.expensetracker.service.UserServieImpl;

/**
 * Servlet implementation class DeleteContact
 */
@WebServlet("/DeleteContact")
public class DeleteContact extends HttpServlet {
       
   // UserService userService=new UserServieImpl();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="jdbc:mysql://localhost:3306/expensetracker51?user=root & password=12345";
		String query="delete from contactus where sno=?";
try {
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection connect=DriverManager.getConnection(url);
		PreparedStatement pstmt=connect.prepareStatement(query);
		String sn=request.getParameter("sno");
		if(sn!=null) {
			int sno=Integer.parseInt(sn);
			//int result=userService.deleteFeedback(sno);
			
			
			pstmt.setInt(1,sno);
			System.out.println("SNO "+sno);
			int status= pstmt.executeUpdate();
			
			System.out.println("PRINT RESULT"+status);
			if(status!=0)
			{
				request.setAttribute("delmsg","RECORD DELETED SUCCESSFULLY");
				RequestDispatcher dispatcher=request.getRequestDispatcher("Feedback.jsp");
				dispatcher.include(request, response);
			}
			
		}
	}
catch(Exception e)
{
	e.printStackTrace();
}
	}

}
