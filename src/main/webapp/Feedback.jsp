<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.jsp.expensetracker.service.*" %>
        <%@page import="com.jsp.expensetracker.entity.*" %>
        <%@page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Feedback</title>
<script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <link rel="icon" href="media/expenses-removebg-preview (1).png">
    <link rel="stylesheet" href="tablestyle.css">
    <style>
    table
    {
    height:300px;
    width:1000px;
    }
   
    tr
    {
    height:8px;
    
    }
     button
        {
        	border-style:none;
        	color:white;
        	height:30px;
        	width:90px;
        	border-radius:20px;
        	font-size:15px;
        	
        }
    </style>
</head>
<body>
<center><br><br>
<table border="1">
<tr><th colspan="5">USERS FEEDBACK INFO</th></tr>
<tr>
<th>SNO</th>
<th>USERNAME</th>
<th>EMAIL</th>
<th>COMMENT</th>
<th>ACTION</th>
</tr>
<%
UserService userService=new UserServieImpl();


List<ContactUs> feedback=userService.getFeedback();

System.out.println("FEEDBACK--- "+feedback);

int sno=0;
if(feedback!=null){
	for(ContactUs c:feedback){
	%>
	<tr>
	<td><%=++sno %></td>
	<td><%=c.getUsername() %></td>
	<td><%=c.getEmail() %></td>
	<td><%=c.getComment() %></td>
	<td ><center><button type="submit"  class="ud"  style="background-color:rgba(0,0,255,0.7);">&#10558; <a href="mailto:<%=c.getEmail() %>" style="text-decoration:none;color:white;">REPLY</a> </button>
 &nbsp; &nbsp;&nbsp;<form method="post" action="DeleteContact" style="display:inline;"><input value=<%=c.getSno()%> hidden=true   name="sno"><button type="submit" class="de" style="background-color:rgba(255,0,0,0.7);"><i class="fa-solid fa-trash"></i> Delete</button></form></center></td>
	
	</tr>
	
<% }}%>
</table></center>


<%
String ms=(String) request.getAttribute("delmsg");
if(ms!=null){
%>
<script>alert('<%=ms%>')</script>
<%} %>
<br><br>
<br><center>
<a href="admindb.jsp"><button style="width:200px;background-color:blueviolet;color:white;height:40px;">GO BACK</button></a></center><br><br><br>
</body>
</html>