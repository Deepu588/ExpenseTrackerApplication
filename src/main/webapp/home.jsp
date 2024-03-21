<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.jsp.expensetracker.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Home Page</title>
    <link rel="icon" href="media/expenses-removebg-preview (1).png">
    <link rel=stylesheet href="home.css">
    <script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <style>
    	#ima
    	{
    		animation-name:tyrning;
    		animation-duration:1s;
    		animation-iteration-count:infinite;
    		animation-direction:forward;
    		animation-timing-function:ease-in-out;
    		rotateY:0deg;
    		
    	}
    	@keyframes tyrning
    	{
    		from{
    		transform:rotateY(0deg);
    		}
    		to
    		{
    		transform:rotateY(180deg);}
    	}
    	#hed{
    		position:absolute;
    		top:4%;
    		left:7%;
    	}
    	
    	#ali
{
    display:none;
    position:absolute;
        background-color:black;
    
    top:11%;
    right:3%;
   height:120px;
   width:140px;
   z-index:2;

}
#ali .lk
{
    width:170px;
    height:33px;
    border-style:none;
    background-color:black;
    color:white;
    font-size:medium;
}
#ali .lk:hover{
    background-color: grey;
}
#ali a
{
    text-decoration: none;
    
    
}
  
    </style>
</head>
<body>

  <div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b id="hed">Spring Expenses Tracker</b>
<img src="media/setting.png" height="45px" width="45px" style="position:absolute;top:4%;right:4%;" onmouseover="showing()" id="ima">
 <div id="ali">
<a href="EditProfile.jsp"><button class="lk">&#9998; Edit Profile</button></a>
<a href="About.jsp"><button class="lk">&#9432; About</button></a>
<a href="contactus.jsp"><button class="lk">&#128231; Contact Us</button></a>
<a href="rating.jsp"><button class="lk">&#10032; Rate Us</button></a>
<a href="Savings.jsp"><button class="lk">&#8377; Your Savings</button></a>
<a href="SendExpensesRequest.jsp"><button class="lk">&#10066; Send My Expenses</button></a>
<a href="ThisWeekExpenses.jsp"><button class="lk">&#10066; This Week Expenses</button></a>

<a href="Logout"><button class="lk">&#11025; Logout</button></a>
</div>
 
  </div>  <div class="bpart">
    
   
   <a href="addexpenses.jsp"> <div id="c1"><i class="fa-solid fa-plus fa-beat-fade"></i><h5>Add Expenses</h5></div></a>
  <a href="ViewExpenses"> <div id="c2"><i class="fa-regular fa-eye fa-beat-fade"></i><h5>View Expenses</h5></div></a>
 
   <%
String message=(String) request.getAttribute("msg");
    User user=(User) session.getAttribute("userInfo");
     
    if(message !=null)
    {
    %>
    <script>alert('<%=message%>')</script>
   <h4 style="color:red;font-size:29px;position:absolute;margin-left:610px;margin-top:320px;">welcome <%= user.getUsername() %></h4>

    <%}
    %>
   <a href="totalexpenses.jsp"> <div id="c3"><i class="fa-solid fa-calculator fa-beat-fade"></i><h5>Total Expenses</h5></div></a>
  <a href="filterexpenses.jsp" > <div id="c4"><i class="fa-solid fa-filter fa-beat-fade"></i><h5>Filter Expenses</h5></div></a>
    </div>
    
    <script>
    function showing()
    {
        document.getElementById("ali").style.display="block";
        setTimeout(hide,6000);
    }
    function hide()
    {
        document.getElementById("ali").style.display="none";
    }
</script>
   
   
   
   <%   String cfmess=(String) request.getAttribute("cfm"); 
if(cfmess!=null){
%>
<script type="text/javascript">
alert('<%=cfmess%>')
</script>
<%} %> 
</body>
</html>