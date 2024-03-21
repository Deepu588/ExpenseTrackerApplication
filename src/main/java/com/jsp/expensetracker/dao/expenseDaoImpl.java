package com.jsp.expensetracker.dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jsp.expensetracker.entity.Expense;
import com.jsp.expensetracker.entity.UserRequest;
import com.jsp.expensetracker.utility.SingletonClass;

public class expenseDaoImpl implements ExpenseDao{

	private Connection connection=SingletonClass.getSingletonClassObject().getConnect();
	private PreparedStatement ptsmt;
	@Override
	public int addExpense(Expense expense,int userId) throws Exception {

		
			
			String query="insert into expenses(amount, category, Description, date,userId) values(?,?,?,?,?)";
			
			ptsmt = connection.prepareStatement(query);
			ptsmt.setDouble(1, expense.getAmount());
			ptsmt.setString(2, expense.getCategory());
			ptsmt.setString(3, expense.getDescription());
			ptsmt.setDate(4, expense.getDate());
		ptsmt.setInt(5,userId);

			int status = ptsmt.executeUpdate();
			if(status!=0) {

				String selectQuery="SELECT LAST_INSERT_ID()";
				ptsmt=connection.prepareStatement(selectQuery);

				
				ResultSet rs=ptsmt.executeQuery(selectQuery);
				if(rs.isBeforeFirst())
				{
					rs.next();
					int expenseId=rs.getInt(1);
					return expenseId;
				}
			}
			
			return 0;
		
	
	}
	@Override
	public List<Expense> viewExpense(int userId) throws Exception {
		// TODO Auto-generated method stub
		String query="select  * from expenses where userId=?";
		ptsmt=connection.prepareStatement(query);
		ptsmt.setInt(1, userId);
		ResultSet res=ptsmt.executeQuery();
		List<Expense> expensesList=new ArrayList<Expense>();
		if(res.isBeforeFirst())
		{
			while(res.next())
			{
				Expense expense =new Expense();
				expense.setAmount(res.getDouble("amount"));
				expense.setDescription(res.getString("Description"));
				expense.setDate(res.getDate("date"));
				expense.setCategory(res.getString("category"));
				expense.setExpenseId(res.getInt("expenseId"));
				expensesList.add(expense);
				System.out.println(expense);
			}
			return expensesList;

		}
		
		return null;
	}
	
	
	
	
	
	@Override
	public int deleteExpense(int expenseId) throws Exception {
		// TODO Auto-generated method stub
		
		String query="delete   from expenses where expenseId=?";
		ptsmt=connection.prepareStatement(query);
		ptsmt.setInt(1, expenseId);
		int result=ptsmt.executeUpdate();
		return result;
	}
	
	
	
	
	
	@Override
	public Expense findDetailsByExpenseId(int expenseId) throws Exception {
		// TODO Auto-generated method stub
		String query="select * from expenses where expenseId=?";
		ptsmt=connection.prepareStatement(query);
		ptsmt.setInt(1, expenseId);
		ResultSet res=ptsmt.executeQuery();
		res.next();
		Expense expense =new Expense();
		expense.setAmount(res.getDouble("amount"));
		expense.setDescription(res.getString("Description"));
		expense.setDate(res.getDate("date"));
		expense.setCategory(res.getString("category"));
		return expense;
	}
	
	
	
	
	
	@Override
	public int updateExpenseDetails(Expense expense, int expenseId) throws Exception {
		// TODO Auto-generated method stub
		
		String query="update expenses set amount=?,category=?,Description=?,date=?  where expenseId=?";
		System.out.println(expense);
		System.out.println(expenseId);
		ptsmt=connection.prepareStatement(query);
		ptsmt.setDouble(1, expense.getAmount());
		ptsmt.setString(2, expense.getCategory());
		ptsmt.setString(3, expense.getDescription());
		ptsmt.setDate(4, expense.getDate());
		ptsmt.setInt(5, expenseId);
		int status=ptsmt.executeUpdate();
		return status;
	}
	@Override
	public double caluclateTotalExpenses(Date startDate, Date endDate, int userId) throws Exception{
		// TODO Auto-generated method stub
		
		String query="select * from expenses where date>?  and  date<? and  userId=?";
		ptsmt=connection.prepareStatement(query);
		ptsmt.setDate(1,startDate);
		ptsmt.setDate(2, endDate);
		ptsmt.setInt(3, userId);
		double sum=0.0;
		ResultSet res=ptsmt.executeQuery();
		if(res.isBeforeFirst())
		{
			while(res.next())
			{
			sum+=res.getDouble("amount");
			
			}
		}
		return sum;
	}
	
	@Override
	public int addingRequest(int userId, String username, String email) throws Exception {
		// TODO Auto-generated method stub
		
		String query="insert into sendexpenses(userid,username,email) values (?,?,?)";
		ptsmt=connection.prepareStatement(query);

		ptsmt.setInt(1, userId);
		ptsmt.setString(2, username);
		ptsmt.setString(3, email);
		
		int status=ptsmt.executeUpdate();
		System.out.println("status of insertion "+status);
		return status;
	}
	
	
	
	@Override
	public List<UserRequest> ViewUserRequest() throws Exception {
		// TODO Auto-generated method stub
		
		String query="select * from sendexpenses";
		ptsmt=connection.prepareStatement(query);
	ResultSet rs=ptsmt.executeQuery();
	List<UserRequest> userRequests=new ArrayList();
	if(rs.isBeforeFirst())	
	{
		while(rs.next()) {
			UserRequest req=new UserRequest();
			req.setUserId(rs.getInt("userid"));
			req.setUserName(rs.getString("username"));
			req.setEmail(rs.getString("email"));
			
			userRequests.add(req);
		}
	}
		System.out.println(userRequests);
		return userRequests;
	}
	
}
