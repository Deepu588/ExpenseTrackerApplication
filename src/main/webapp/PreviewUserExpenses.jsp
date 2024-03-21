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
<title>Preview User Expenses</title>
<script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <link rel="icon" href="media/expenses-removebg-preview (1).png">
    <link rel="stylesheet" href="tablestyle.css">

</head>
<body>


<br><br>
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
<%
StringBuilder encodedExpenses = new StringBuilder();
String mailtoLink ="";

if(listOfExpenses!=null){
for (Expense expense : listOfExpenses) {
    encodedExpenses.append(URLEncoder.encode(expense.toString(), "UTF-8")).append("%0A"); // %0A represents a newline character
    
    mailtoLink = userDetails.getEmail() +
            "?subject=Your%20Expense%20Details" +
            "&body=" + encodedExpenses.toString();
}}

else if(listOfExpenses==null){

 mailtoLink = userDetails.getEmail() +
            "?subject=Your%20Expense%20Details" +
            "&body=You didnot added any expense details" ;


} %>
<a href="mailto:<%=mailtoLink%>" style="text-decoration:none;"><button style="background-color:blueviolet;border-radius:10px;color:white;height:50px;width:550px;font-size:medium;display:block;text-decoration:none;border-style:none;border-radius:100px;font-weight:bold;letter-spacing:2px;" id="bax">&#128231; SEND VIA EMAIL</button></a><br><br><br>
<a href="GetUserRequest" style="text-decoration:none;"><button style="background-color:red;color:white;height:40px;width:200px;font-size:medium;display:block;text-decoration:none;border-style:none;border-radius:10px;" id="bax">GO BACK</button></a>
<br><br>
</center>


</body>
</html>