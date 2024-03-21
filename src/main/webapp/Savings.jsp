<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@page import="com.jsp.expensetracker.entity.User" %>
            <%@page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Savings</title>
 <script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <link rel="icon" href="media/expenses-removebg-preview (1).png">
    <style>
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
       body
        {
            background-image: url("media/bg.png");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size:cover;
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
        #fffrm{
        height:445px;
        width:500px;
        background-color:rgba(153, 50, 204,0.4);
        position:absolute;
        top:27%;
        left:34%;
        border-radius:16px;
       
        }
        
        input,select,input::placeholder
        {
        height:43px;
        width:400px;
        border-style:none;
        border-radius:10px;
        text-align:center;
        color:blueviolet;
        font-size:large;
        letter-spacing:2px;
        box-shadow:1px 1px lightgrey;
        }
        form h4
        {
        font-weight:bold;
        font-size:30px;
        letter-spacing:2px;
        word-spacing:3px;
        padding:4px;
        color:blueviolet;
        
        }
        form button
        {
        height:35px;
        width:190px;
        border-style:none;
        background-color:blueviolet;
        color:white;
        box-shadow:1px 1px lightgrey;
        letter-spacing:1px;
        font-weight:bold;
        font-size:larger;
        border-radius:100px;
        }
        form button:hover{
        width:250px;
        
        }
        label
        {
        	margin-left:67px;
        	color:white;
        	font-weight:bold;
        	font-size:large;
        	letter-spacing:3px;
        }
        </style>
</head>
<body>
<div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>
        <a href="home.jsp" id="dd"><i class="fa-solid fa-home"></i>&nbsp;Home</a>

    </div>
   
    <%User userInfo=(User)session.getAttribute("userInfo"); 
   // System.out.println("checking in savings"+userInfo);
    %>
   
  <div id="fffrm">
    <form method="post" action="CaluclateSavings"><br>
   <center> <h4>Know Your Savings</h4></center><br>
    <input type="text" hidden=true  value=<%=userInfo.getUserId() %> name="userId">
    <label>&#128467; YEAR</label><br>
    <center>
    <input type="text" name="year"  required  ></center><br><br>
    <label>&#128467; MONTH</label><br>
  <center><select name="month" required >
       <option value="" disabled selected>SELECT MONTH</option>
   
  	  <option>January</option>
  	  <option>February</option>
      <option>March</option>
      <option>April</option>
      <option>May</option>
      <option>June</option>
      <option>July</option>
      <option>August</option>
      <option>September</option>
      <option>October</option>
      <option>November</option>
      <option>December</option>
   
   </select></center><br><br>
   <label>&#8377; SALARY</label><br>
  <center> <input type="text" required placeholder="ENTER YOUR SALARY" name="salary"></center><br><br>
  <center> <button type="submit">SUBMIT</button></center>
   
   
    </form></div>
     <script>
    let today=new Date();
    document.getElementsByName("year")[0].value=today.getFullYear();
    
    </script>
</body>
</html>