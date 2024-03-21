<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    
    <%@page import="com.jsp.expensetracker.entity.Expense" %>
        <%@page import="com.jsp.expensetracker.entity.User" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Total Expenses</title>
<script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <link rel="icon" href="media/expenses-removebg-preview (1).png">
<style>
table
{
margin-top:90px;
background-color:bisque;
border-style:none;

}
.ro:hover
{
background-color:lightgrey;
}
td
{
text-align:center;
background-color:white;
border-color:lightgrey;
padding:10px;
border-top-color:rgba(153, 50, 204,0.6);
border-bottom-color:rgba(153, 50, 204,0.6);
}

     body
        {
            background-image: url(media/bg.png);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size:cover;
        }


		*
        {
            margin:0%;
            padding:0%;
        }
        .header
        {
            margin:0px;
            padding:0px;
            height:90px;
            width:100%;
            background-color: rgba(153, 50, 204,0.6);
        }
        div b{
            position: absolute;
            top:5%;
            left:8%;
            font-size: 25px;
        }
         .header #dd
        {
            font-size:large;
            position:absolute;
            right:18%;
            top:5%;
            text-decoration: none;
            color:black;
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
        
        #ima
        {
        	height:200px;
        	width:300px;
        	margin-top:100px;
        	display:none;
        	
        }
        #meg,#mega,#meeg
        {
        	margin-top:20px;
        	display:none;
        	color:gray;
        	display:none;
        }
        #bck
        {
        	height:40px;
        	width:300px;
        	background-color:rgba(0,0,255,0.8);
        	color:white;
        	border-radius:20px;
        	font-size:medium;
        	font-weight:bold;
        	letter-spacing:1px;
        	
        }
        
        #bck:hover
        {
        		width:340px;
        		background-color:blue;
        		box-shadow:3px 3px 2px 2px white; 
        }
</style>
</head>
<body>
<div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>
        <a href="home.jsp" id="dd"><i class="fa-solid fa-home"></i>&nbsp;Home</a>

    </div>
    <%    User user=(User) session.getAttribute("userInfo");
 %>
<center>
<%
 String popup=  (String) request.getAttribute("processMsg");
    Double result=(Double)request.getAttribute("result");
    if(popup!=null  && result!=null){
    %>
    <script>alert('CALUCLATION IN PROGRES !!');
</script>    
    <%} %>
  
  <% 
  Date startDate=(Date) request.getAttribute("startdate");
Date endDate=(Date) request.getAttribute("enddate");
%>
<button style="height:37px;width:85px;border-style:none;border-radius:8px;background-color:black;position:absolute;right:3%;top:15%;"><a href="totalexpenses.jsp" style="text-decoration:none;color:white;letter-spacing:1px;"><i class="fa-solid fa-backward fa-beat-fade"></i> BACK</a></button>
<img src="media/empty.png" id="ima">
<h2 id="meg">Hello <%=user.getUsername() %> , It seems that you don't have added any expense details between given dates</h2>
<h4 id="mega" style="padding:8px;">CLICK BELOW BUTTON TO ADD ANY EXPENSE DETAILS</h4>
<button style="color:white;background-color:rgba(0,0,255,0.6);height:38px;width:210px;" id="meeg"><a href="addexpenses.jsp" style="text-decoration:none;color:white;">+ ADD EXPENSE DETAILS</a></button>

<table border="2px"  width="1100px"  cellspacing="3px" id="tbl">
<thead>
<tr style="background-color:rgba(153, 50, 204,0.6);align:center;color:white;letter-spacing:1px;font-size:20px;"   height="40px" ><th colspan="6"><b><%= user.getUsername() %> Expenses Details</b></th></tr>
<tr style="background-color:rgba(153, 50, 204,0.6);align:center;color:white;letter-spacing:1px;font-size:20px;"   height="40px">

<th colspan="6" align="center">START DATE : <%=startDate %>		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;   END DATE : <%=endDate %></th>			
</tr>


<tr style="background-color:rgba(153, 50, 204,0.6);align:center;color:white;letter-spacing:1px;font-size:20px;"   height="40px">
<th>SNO</th>
<th>DATE</th>
<th>AMOUNT</th>
<th>CATEGORY</th>
<th>DESCRIPTION</th>
<th>ACTION</th>
</tr>
</thead>

<tbody>
<%


System.out.println("sd"+startDate);
System.out.println("ed"+endDate);
	int count=0;
	List<Expense> listOfExpenses=(List)request.getAttribute("list");
System.out.println("vte "+listOfExpenses);
	if(listOfExpenses  !=null){
		int n=0;
		for(Expense e:listOfExpenses ){
			System.out.println(e.getDate());
			if(e.getDate().after(startDate) && e.getDate().before(endDate) ){
			count++;
%>
<tr >
<td class="ro"><b><%= ++n %></b></td>
<td class="ro"><i><%=e.getDate() %></i></td>
<td class="ro"><b>&#8377; <%=e.getAmount() %></b></td>
<td class="ro"><%=e.getCategory() %></td>
<td class="ro"><%=e.getDescription() %></td>
<td ><center><button type="submit"  class="ud"  style="background-color:rgba(0,0,255,0.7);"><i class="fa-solid fa-pencil "></i> <a href="UpdateExpense.jsp?expenseId=<%=e.getExpenseId() %>" style="text-decoration:none;color:white;">Update</a> </button>
 &nbsp; &nbsp;&nbsp;<form method="post" action="DeleteExpense" style="display:inline;"><input value=<%=e.getExpenseId()%> hidden=true   name="exId"><button type="submit" class="de" style="background-color:rgba(255,0,0,0.7);"><i class="fa-solid fa-trash"></i> Delete</button></form></center></td>

</tr>


  
  
  
<%
			}	}
	}
%>


<%if (result!=null ){ %>
  <tr><td colspan="6">  <b id="output" style="color:blue;font-size:21px;"><%=popup%><%=result %></b></td></tr>
  <%} %> 


</tbody>
</table>
<%	if(count==0) {%>
	
 <script>
 document.getElementById("tbl").style.display="none";
 document.getElementById("ima").style.display="block";
 document.getElementById("meg").style.display="block";
 document.getElementById("mega").style.display="block";
 document.getElementById("meeg").style.display="block";
	document.getElementById("output").style.display="none";
 </script>
</center>
<%} %>


<br><br><center><button id="bck"><a href="ViewExpenses" style="text-decoration:none;color:white;"><i class="fa fa-solid fa-eye" type="button"></i> VIEW ALL EXPENSES</a></button></center><br><br><br>

<%
	String alm=	(String) request.getAttribute("mess");
if(alm!=null){
%>
<script>alert('<%=alm%>')
window.location.href="TotalExpenses";</script>
<%

} %>



 
</body>
</html>