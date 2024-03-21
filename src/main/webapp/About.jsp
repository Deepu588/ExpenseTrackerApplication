<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About</title>
<link rel="icon" href="media/expenses-removebg-preview (1).png">

    <script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
<style>
		  body
        {
            background-image: url(media/bg.png);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
        }
        
         *
        {
            margin:0%;
            padding:0%;
        }
        .header
        {
            margin:0%;
            padding:0%;
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
        
        .abbox{
        height:500px;
        width:830px;
        background-image:linear-gradient(to top ,gold,lightgreen,lightgrey,rgba(255,165,0,0.5),pink,bisque,lightblue);
        margin-left:365px;
        padding-left:25px;
        border-radius:10px;
        z-index:2;
        box-shadow:5px 6px 5px 4px white;
		animation-name:box;
		animation-duration:10s;
		animation-delay:1s;
		animation-iteration-count:1;
        }
        @keyframes box
        {
        
        1%{
                background-image:linear-gradient(to right,gold,yellow,lightgreen,lightgrey,rgba(255,165,0,0.5),pink,bisque,lightblue);
        
        
        }
        
        20%
        {
                background-image:linear-gradient(to bottom right,gold,yellow,lightgreen,lightgrey,rgba(255,165,0,0.5),pink,bisque,lightblue);
        
        }
        
        40%
        {
        
                background-image:linear-gradient(to top left,gold,yellow,lightgreen,lightgrey,rgba(255,165,0,0.5),pink,bisque,lightblue);
        
        }
        
        60%{
        
                background-image:linear-gradient(to top right,gold,yellow,lightgreen,lightgrey,rgba(255,165,0,0.5),pink,bisque,lightblue);
        
        }
        
        
        80%{
        		        background-image:linear-gradient(to bottom left,gold,yellow,lightgreen,lightgrey,rgba(255,165,0,0.5),pink,bisque,lightblue);
        		
        
        }
        
        99%{
        
                background-image:linear-gradient(to  left,gold,yellow,lightgreen,lightgrey,rgba(255,165,0,0.5),pink,bisque,lightblue);
        
        }
        
        }
        
        
        
        
        .abbox h3{
        letter-spacing:7px;
        color:red;
        font-size:34px;
        font-weight:bold;
        text-shadow:2px 2px white;
        text-align:center;
        }
        .abbox .cont{
        font-size:22px;
        word-spacing:3px;
        font-weight:normal;
        text-shadow:1px 0px white;
        
        }
</style>
</head>
<body>
<div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>
        <a href="home.jsp" id="dd"><i class="fa-solid fa-home"></i>&nbsp;Home</a>

    </div>
<br><br><br>

<div class="abbox"><br>
<h3>ABOUT</h3>
<br>
<p class="cont">Spring Expense Tracker is a tool or  web application designed to help individuals and businesses manage and monitor their spending habits and financial transactions. These tools play a crucial role in personal finance management, budgeting, and achieving financial goals.
</p>

<br>
<p class="cont"> In this Application Users can input and track their daily expenses, including purchases, bills, and other financial transactions. This real-time tracking helps maintain an accurate and up-to-date overview of financial activities.</p>
<br>
<p class="cont">Expenses are often categorized into specific groups such as groceries, utilities, entertainment, and more. Categorization enables users to understand where their money is going and identify areas where adjustments can be made.</p>
<br>
<p class="cont">Good expense trackers prioritize the security and privacy of users' financial data. This includes using secure connections, encryption, and implementing robust authentication methods.</p>

</div></body></html>