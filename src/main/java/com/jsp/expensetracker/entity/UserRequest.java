package com.jsp.expensetracker.entity;

public class UserRequest {

	
private int userId;
private String userName;
private String email;




public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}




public UserRequest(int userId, String userName, String email) {
	super();
	this.userId = userId;
	this.userName = userName;
	this.email = email;
}


public UserRequest() {
	super();
	// TODO Auto-generated constructor stub
}
@Override
public String toString() {
	return "UserRequest [userId=" + userId + ", userName=" + userName + ", email=" + email + "]";
}





}
