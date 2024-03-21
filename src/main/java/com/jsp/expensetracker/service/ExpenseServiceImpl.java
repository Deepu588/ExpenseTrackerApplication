package com.jsp.expensetracker.service;

import java.sql.Date;
import java.util.List;
import java.util.stream.Collectors;


import com.jsp.expensetracker.dao.ExpenseDao;
import com.jsp.expensetracker.dao.expenseDaoImpl;
import com.jsp.expensetracker.entity.Expense;
import com.jsp.expensetracker.entity.UserRequest;

public class ExpenseServiceImpl implements ExpenseService{

	
	private ExpenseDao expenseDao=new expenseDaoImpl();
	
	
	
	@Override
	public int addExpense(Expense expense, int userId) {
		// TODO Auto-generated method stub
		try
		{
		return  expenseDao.addExpense(expense,userId);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}
	
	
	
	
	@Override
	public List<Expense> viewExpense(int userId) {
		// TODO Auto-generated method stub
		
		try {
		return	expenseDao.viewExpense(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	
	@Override
	public int deleteExpense(int expenseId) {
		// TODO Auto-generated method stub
		
		try {
			return expenseDao.deleteExpense(expenseId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	
	
	
	
	
	@Override
	public Expense findDetailsByExpenseId(int expenseId) {
		// TODO Auto-generated method stub
		try {
			return expenseDao.findDetailsByExpenseId(expenseId);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	
	
	
	@Override
	public int updateExpense(Expense expense, int expenseId) {
		// TODO Auto-generated method stub
		try {
			return expenseDao.updateExpenseDetails(expense, expenseId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}




	@Override
	public double caluclateTotalExpenses(Date startDate, Date endDate, int userId) {
		// TODO Auto-generated method stub
		
		try {
			return expenseDao.caluclateTotalExpenses(startDate, endDate, userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	
	@Override
	public List<Expense> filterExpenseByCategory(String category, int userId) {

		try {
			return expenseDao.viewExpense(userId).stream().filter(t -> t.getCategory().equals(category))
					.collect(Collectors.toList());
		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Expense> filterExpenseByAmountRange(int start, int end, int userId) {
		try {
			return expenseDao.viewExpense(userId).stream().filter(t -> t.getAmount() >= start && t.getAmount() <= end)
					.collect(Collectors.toList());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}




	@Override
	public int addingRequest(int userId, String username, String email) {
		// TODO Auto-generated method stub
		
		try {
			return expenseDao.addingRequest(userId, username, email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}




	@Override
	public List<UserRequest> ViewUserRequest() {
		// TODO Auto-generated method stub
		try {
		return	expenseDao.ViewUserRequest();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	
}
