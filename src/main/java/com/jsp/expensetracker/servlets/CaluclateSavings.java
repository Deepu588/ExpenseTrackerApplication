package com.jsp.expensetracker.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.expensetracker.entity.Expense;
import com.jsp.expensetracker.service.ExpenseService;
import com.jsp.expensetracker.service.ExpenseServiceImpl;
import com.jsp.expensetracker.service.UserService;
import com.jsp.expensetracker.service.UserServieImpl;

/**
 * Servlet implementation class CaluclateSavings
 */
@WebServlet("/CaluclateSavings")
public class CaluclateSavings extends HttpServlet {
       
	private ExpenseService expenseService=new ExpenseServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
int userId=Integer.parseInt(request.getParameter("userId"));
String year=request.getParameter("year");
double salary=Double.parseDouble(request.getParameter("salary"));
String monthName=request.getParameter("month");
System.out.println(userId);
System.out.println(year);
System.out.println(monthName);

String[] month= {"January","February","March","April","May","June","July","August","September","October","November","December"};
String[] date= {"01","02","03","04","05","06","07","08","09","10","11","12"};
int monthIndex=Arrays.asList(month).indexOf(monthName);
System.out.println(monthIndex);
System.out.println(date[monthIndex]);
List<Expense> listOfUserExpense=expenseService.viewExpense(userId);
double total=0.0;
String givenDate=year+"-"+date[monthIndex];
if(listOfUserExpense!=null) {
for(Expense e:listOfUserExpense) {
	String d=e.getDate().toString().substring(0, 7);
	if(d.equals(givenDate)) {
		total+=e.getAmount();
	}
}
}

double percentage=(((salary-total)/salary)*100);

request.setAttribute("salary", salary);
request.setAttribute("total",total);
request.setAttribute("savings", percentage);
request.setAttribute("monthName", monthName);
RequestDispatcher dispatcher=request.getRequestDispatcher("KnowSavings.jsp");
dispatcher.include(request, response);
	}

}
