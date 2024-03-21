<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
                <%@page import="com.jsp.expensetracker.entity.User" %>
                    <%@page import="com.jsp.expensetracker.service.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Send Expenses Request</title>
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
        
        .inpu,select,input::placeholder
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
        
        #chb{
                height:40px;
        color:white;
        margin-left:70px;
        font-size:large;
        }
        form h4
        {
        font-weight:bold;
        font-size:24px;
        letter-spacing:2px;
        word-spacing:3px;
        padding:4px;
        color:blueviolet;
        
        }
        form button
        {
        height:35px;
        width:220px;
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
        width:270px;
        
        }
        label
        {
        	margin-left:67px;
        	color:white;
        	font-weight:bold;
        	font-size:large;
        	letter-spacing:3px;
        }
       .trm{
               	margin-left:70px;
       
       height:50px;
       width:400px;
       font-size:medium;
       color:white;
       font-weight:bold;
       }
     </style>
</head>
<body>
<div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>
        <a href="home.jsp" id="dd"><i class="fa-solid fa-home"></i>&nbsp;Home</a>

    </div>
     <%
     User userInfo=(User)session.getAttribute("userInfo"); 
   //System.out.println("checking in sending mail"+userInfo);
   UserService userService=new UserServieImpl();
   User user=userService.findUserById(userInfo.getUserId());
   System.out.println(user+"check");
    %>
   <div id="fffrm">
   <form method="post" action="SendExpenses"><br>
 <center>  <h4>SEND MY EXPENSES VIA EMAIL</h4></center>
   <br><br>
   <input type="text" hidden=true  value=<%=user.getUserId() %> name="uid">
   <label>USERNAME </label><br>
 <center>  <input type="text" name="uname" value=<%=user.getUsername()%> readonly class="inpu">   </center>
 
<br><br>
<label>EMAIL</label><br>
 <center><input type="email" name="email" value=<%=user.getEmail() %> readonly  class="inpu">   </center>
<br>

        <input type="checkbox" name="agree" required id="chb"><span style="float:right;color:white;font-style:normal;margin-right:286px;margin-top:10px;font-size:medium;">click here to agree</span>
   
<div class="trm">
<span>After clicking the submit button you will recieve your expenses details through email within 24 hours</span>
</div><br>
 <center><button type="submit">Send My Expenses</button></center>
   </form>
   
   </div>
   
   
   
</body>
</html>