<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.util.*" %>
      <%@ page import="java.net.URLEncoder" %>
      
    <%@page import="com.jsp.expensetracker.entity.Expense" %>
        <%@page import="com.jsp.expensetracker.entity.User" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View User Expenses</title>
<script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <link rel="icon" href="media/expenses-removebg-preview (1).png">
    <link rel="stylesheet" href="tablestyle.css">
</head>
<body><br><br>
<%
User userDetails=(User)request.getAttribute("userDetails");
System.out.println("user Details :"+userDetails);
%>

<center>
<image src="media/datanf.gif" height="250px" width="250px" id="ii" style="display:none;">
<h2 id="mesa" style="display:none;text-transform:uppercase;color:grey;"><%=userDetails.getFullname() %> DIDNT ADDED ANY EXPENSES TILL NOW !!</h2>
<table style="width:800px;" id="tab">
<tr><th colspan="5" style="text-transform:uppercase;"><%=userDetails.getUsername() %>  EXPENSES DETAILS</th></tr>
<tr>
<th>SNO</th>
<th>DATE </th>
<th>AMOUNT</th>
<th>CATEGORY</th>
<th>DESCRIPTION</th>

</tr>
<%
List<Expense> listOfExpenses=(List)request.getAttribute("expensesList");
if(listOfExpenses!=null){
	int sno=0;
for(Expense e:listOfExpenses)
{%>
	<tr>
			<td><%=++sno %></td>
	
			<td><%=e.getDate() %></td>
	
		<td><%=e.getAmount() %></td>
		<td><%=e.getCategory() %></td>
		<td><%=e.getDescription() %></td>
	
	</tr>
<% }
}else{
%>
<script>document.getElementById("tab").style.display="none";
document.getElementById("mesa").style.display="block";
document.getElementById("ii").style.display="block";

</script>
<%} %>


</table>

<br>
<br>
<a href="ViewUser" style="text-decoration:none;"><button style="background-color:blueviolet;color:white;height:40px;width:150px;font-size:medium;display:block;text-decoration:none;border-style:none;border-radius:10px;" id="bax">GO BACK</button></a>
<br><br>
</center>

</body>
</html>