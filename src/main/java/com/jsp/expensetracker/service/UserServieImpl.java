package com.jsp.expensetracker.service;


import java.io.InputStream;
import java.sql.ResultSet;
import java.util.List;

import com.jsp.expensetracker.dao.UserDao;
import com.jsp.expensetracker.entity.ContactUs;
import com.jsp.expensetracker.entity.User;
import com.jsp.expensetracker.entity.UserDaoImpl;

public class UserServieImpl implements UserService{
private UserDao userdao=new UserDaoImpl();

public int register(User user,String cpassword)
{
	if(user.getPassword().equals(cpassword))
	{
		try
		{
			int userId=userdao.register(user);
			System.out.println("SERVICE LAYER USER ID "+userId);
			return userId;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	return 0;
}

@Override
public User login(String username, String password) {

	try
	{
		return userdao.login(username, password);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return null;
}

@Override
public String forgotPassword(String email) {
	// TODO Auto-generated method stub
	
	try {
		return userdao.forgotPassword(email);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
}

@Override
public User findUserById(int id)  {
	// TODO Auto-generated method stub
	try {
		return userdao.findUserById(id);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return null;
}

@Override
public int updateUser(User user, int userId) {
	// TODO Auto-generated method stub
	
	try {
		return userdao.updateUserInfo(user, userId);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return 0;
}

@Override
public int updateProfile(User user, InputStream is) {
	// TODO Auto-generated method stub
	
	try {
		return userdao.updateUserProfile(user, is);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return 0;
}

@Override
public int addFeedback(String username, String email, String comment) {
	// TODO Auto-generated method stub
	
	try {
		return userdao.addFeedback(username, email, comment);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return 0;
}

@Override
public byte[] getUserProfileImage(int userId) {
	// TODO Auto-generated method stub
	
	try {
		return userdao.getUserProfileImage(userId);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
}

@Override
public int addRating(int number) {
	// TODO Auto-generated method stub
	
	try {
		return userdao.addRating(number);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return 0;
}

@Override
public int fetchRating(int number) {
	// TODO Auto-generated method stub
	
	try {
		return userdao.fetchRating(number);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return 0;
}

@Override
public List<ContactUs> getFeedback() {
	// TODO Auto-generated method stub
	
	try {
		return userdao.getFeedback();
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	
	return null;
}

@Override
public int deleteFeedback(int sno) {
	// TODO Auto-generated method stub
	
	try {
		return userdao.deleteContact(sno);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	return 0;
}

@Override
public int deleteUserById(int id) {
	// TODO Auto-generated method stub
	
	try {
		return userdao.deleteUserById(id);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	return 0;
}

@Override
public int deleteUserRequest(int id) {
	// TODO Auto-generated method stub
	try {
		return userdao.deleteUserRequest(id);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return 0;
}




}