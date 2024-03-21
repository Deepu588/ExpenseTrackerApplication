package com.jsp.expensetracker.dao;


import java.io.InputStream;
import java.util.List;

import com.jsp.expensetracker.entity.ContactUs;
import com.jsp.expensetracker.entity.User;
//data access object
//all database operation on user table
public interface UserDao {

	int register(User user) throws Exception;
	//return id after inserting data
	User login(String username,String password) throws Exception;
	
String forgotPassword(String email) throws Exception;

	
	User findUserById(int id )throws Exception;
	
	int updateUserInfo(User user,int userId) throws Exception;
	
	int updateUserProfile(User user,InputStream is) throws Exception;
	
	byte[] getUserProfileImage(int userId) throws Exception;

	int addFeedback(String username,String email,String comment) throws Exception;
	
	
	int addRating(int number) throws Exception;
	
	int fetchRating(int number) throws Exception;
	
	List<ContactUs> getFeedback() throws Exception;
	
	
	int deleteContact(int sno) throws Exception; 
	
	int deleteUserById(int id) throws Exception;
	
	int deleteUserRequest(int id)throws Exception;
}
