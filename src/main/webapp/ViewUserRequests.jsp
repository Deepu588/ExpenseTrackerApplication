<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="com.jsp.expensetracker.entity.UserRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View User Requests</title>
<script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <link rel="icon" href="media/expenses-removebg-preview (1).png">
        <link rel="stylesheet" href="tablestyle.css">
<style>
table{
width:890px;
}

</style>
</head>
<body>
<center>
<table id="tbb">
<tr>
<th colspan="4">VIEW USER REQUESTS</th>
</tr>
<tr>
<th>SNO</th>
<th>USERNAME </th>
<th>EMAIL</th>
<th>ACTION</th>

</tr>
<%

List<UserRequest> list=(List)request.getAttribute("requests");
if(list!=null){
	int sno=0;
for(UserRequest u:list)
{

%>
	<tr>
	<td><%=++sno %></td>
	<td><%=u.getUserName() %></td>
	<td><%=u.getEmail() %></td>
				<td><form method="post" action="PreviewUserExpenses" style="display:inline;"><input  value=<%=u.getUserId()%> name="uid" hidden=true><button class="btt"> preview Expenses</i></button></form>
				
								&nbsp;&nbsp;				<form method="post" action="DeleteUserRequest" style="display:inline;"><input  value=<%=u.getUserId()%> name="userid" hidden=true><button class="btt" style="background-color:red;width:90px;"><i class="fa-solid fa-trash"></i> <i>Delete</i></button></form></td>
				
				
	</tr>
<% }}

%>

</table>

<%if(list==null) {%>
<br><br><br>

<center><h2>NO REQUESTS FROM USERS</h2></center>
<script>document.querySelector("#tbb").style.display="none";</script>
<%} %>
<br><br><br>
<a href="admindb.jsp" style="text-decoration:none;"><button style="background-color:red;color:white;height:40px;width:200px;font-size:medium;display:block;text-decoration:none;border-style:none;border-radius:10px;" id="bax">GO BACK</button></a>

</center>

<%
String delMsg=(String) request.getAttribute("delMsg");
if(delMsg!=null){
%>
<script>alert('<%=delMsg%>')
window.location.href="GetUserRequest";
</script>
<%} %>
</body>
</html>