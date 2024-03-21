package com.jsp.expensetracker.service;

import java.io.InputStream;
import java.util.List;

import com.jsp.expensetracker.entity.ContactUs;
import com.jsp.expensetracker.entity.User;

public interface UserService {
int register(User user,String cpassword);
User login(String username,String password);
String forgotPassword(String email);
User findUserById(int id) throws Exception;
int updateUser(User user,int userId) ;

int updateProfile(User user,InputStream is);

int addFeedback(String username,String email,String comment);
byte[] getUserProfileImage(int userId);

int addRating(int number);
int fetchRating(int number);

List<ContactUs> getFeedback();

int deleteFeedback(int sno);

int deleteUserById(int id);

int deleteUserRequest(int id);
}
