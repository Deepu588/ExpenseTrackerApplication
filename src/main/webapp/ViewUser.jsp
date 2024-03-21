<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.util.*" %>
            <%@page import="com.jsp.expensetracker.entity.User" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>USER-DETAILS</title>
<script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <link rel="icon" href="media/expenses-removebg-preview (1).png">
        <link rel="stylesheet" href="tablestyle.css">
        <style>
        .hh:hover::before{
        content:"\1F512";
        z-index:4;
        }
        .hh:hover
        {
                color:whitesmoke;
        
        }
        
             a button
      {
      height:49px;
      width:450px;
      background-color:blueviolet;
      color:white;
      text-align:center;
      border-style:none;
      border-radius:10px;
      letter-spacing:2px;
      font-size:larger;
      font-weight:normal;
      box-shadow:2px 2px 2px 2px whitesmoke;
      
      
      }
      a button:hover{
                  background-color: rgba(153, 50, 204,0.8);
      
      }
        </style>
   
</head>
<body><br><br><br><center>
<table border="2" cellspacing="3px" width="1400px">
<tr>
<th colspan="8"><b>&#129187;  USER INFORMATION   &#129186;</b></th>
</tr>
<tr>
		<th>&#128290; SNO</th>
		<th>&#128100; USERNAME</th>
		<th>&#127924; FULLNAME</th>
	    <th>&#128241; MOBILE</th>
		
		<th>&#128231; EMAIL</th>
		<th>&#128273; PASSWORD</th>
		<th>&#11166;   ACTION</th>
		<th>&#9249; DELETE</th>
		
</tr>

<%
int sno=0;
		List<User> userdetails=(List)request.getAttribute("userlist");
if(userdetails!=null){
			for(User user:userdetails)
			{
				%>
				<tr>
				<td><b><%=++sno  %></b></td>
				<td><%=user.getUsername() %></td>
				<td><%=user.getFullname() %></td>
				<td><%=user.getMobile() %></td>
				<td><a href="mailto:<%=user.getEmail() %>?subject=expense Tracker Support&body=Thank You for creating an account !!!!" target="_blank"><%=user.getEmail() %></a></td>
				<td class="hh"><%=user.getPassword().hashCode() %></td>
				<td><form method="post" action="ViewUserExpense" style="display:inline;"><input  value=<%=user.getUserId()%> name="uid" hidden=true><button class="btt"><i class="fa-solid fa-eye"></i> <i>View Expenses</i></button></form></td>
								<td><form method="post" action="DeleteUser" style="display:inline;"><input  value=<%=user.getUserId()%> name="userid" hidden=true><button class="btt" style="background-color:red;width:90px;"><i class="fa-solid fa-trash"></i> <i>Delete</i></button></form></td>
				
				</tr>	
				
				<% 
			}}
%>

</table></center><br><br><br>
    <center><a href="admindb.jsp" ><button  >&#10096; GO BACK</button></a></center>


<%
String delMsg=(String) request.getAttribute("delMsg");
if(delMsg!=null){
%>
<script>alert('<%=delMsg%>')

window.location.href="ViewUser";</script>
<%} %>
</body>
</html>