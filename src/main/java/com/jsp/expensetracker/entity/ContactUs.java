package com.jsp.expensetracker.entity;

public class ContactUs {

	
	private int sno;
	private String username;
	private String email;
	private String comment;
	
	
	public ContactUs(int sno, String username, String email, String comment) {
		super();
		this.sno = sno;
		this.username = username;
		this.email = email;
		this.comment = comment;
	}
	
	
	public ContactUs() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getSno() {
		return sno;
	}


	public void setSno(int sno) {
		this.sno = sno;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	@Override
	public String toString() {
		return "ContactUs [sno=" + sno + ", username=" + username + ", email=" + email + ", comment=" + comment + "]";
	}
	
	
	
	
	
}
