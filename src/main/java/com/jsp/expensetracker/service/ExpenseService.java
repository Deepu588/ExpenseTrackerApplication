package com.jsp.expensetracker.service;

import java.sql.Date;
import java.util.List;

import com.jsp.expensetracker.entity.Expense;
import com.jsp.expensetracker.entity.UserRequest;

public interface ExpenseService {

	int addExpense(Expense expense,int userId);
	List<Expense> viewExpense(int userId);
	int deleteExpense(int expenseId);
	Expense findDetailsByExpenseId(int expenseId);
	int updateExpense(Expense expense,int expenseId);
	
	double caluclateTotalExpenses(Date startDate,Date endDate,int userId);
	
	
List<Expense> filterExpenseByCategory(String category, int userId);
	
	List<Expense> filterExpenseByAmountRange(int start, int end, int userId);
	int addingRequest(int userId,String username,String email);
	
	List<UserRequest> ViewUserRequest() ;


}
