<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.jsp.expensetracker.entity.User" %>
            <%@page import="com.jsp.expensetracker.service.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
    <link rel="icon" href="media/expenses-removebg-preview (1).png">

    <script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>


<style>

    #ctf
    {
height:476px;
width:480px;
border-style:none;
background-image:linear-gradient(to top right,rgba(138, 43, 226,0.6),rgba(138, 43, 226,0.4),rgba(138, 43, 226,0.5),rgba(138,43,226,0.7));
margin-top:80px;
margin-left:127px;
border-top-style:solid;
border-left-style:solid;
border-top-color:blueviolet;
border-left-color:blueviolet;
border-width:9px;
z-index: 2;
animation-name: cform;
animation-duration: 5s;
animation-iteration-count: 1;
    }
    @keyframes cform
    {
        from{
            transform:rotateY(90deg);
        }
        to  
        {
            transform:rotateY(0deg);
        }
    }
    label
    {
        margin-left:75px;
        font-weight: bolder;
        letter-spacing:2px;
        font-size:18px;
        color:white;
        text-shadow:1px 1px blueviolet;
    }

    input{

        border-style: none;
        text-align:center;
        margin-left:56px;
        width:70%;
        height:39px;
        font-size:medium;
        color:blueviolet;

    }

    input:focus{
        width:72%;
    }
    textarea:focus{
        width:72%;
    }
    #cth
    {
        letter-spacing:3px;
        font-size: 25px;
        color:white;
        text-align: center;
        text-shadow:2px 2px grey;
        font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
    padding-top: 1px;
    }
    .buton
    {
        height:35px;
        width:20%;
        color:white;
        border-radius:20px;
        border-style:none;

    }
    #sbm
    {
        background-color:blueviolet;
        margin-left:114px;
        font-size:20px;
        width:50%;
        height:40px;
        letter-spacing: 3px;
        font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;

    }
    #cont
    {
        position: absolute;
        right:11%;
        top:26%;
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
   
</style>
</head>
<body>
<%   
//User user=(User) session.getAttribute("userInfo");


User userInfo=(User)session.getAttribute("userInfo"); 
//System.out.println("checking in sending mail"+userInfo);
UserService userService=new UserServieImpl();
User user=userService.findUserById(userInfo.getUserId());
System.out.println(user+"checking");
%>

 
<div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>
        <a href="home.jsp" id="dd"><i class="fa-solid fa-home"></i>&nbsp;Home</a>

    </div>
<div id="ctf"><br>
        <form method="post" action="Contact">
            <h3 id="cth">CONTACT US</h3>
<br><br>
            <label for="uname"><i class="fa-solid fa-user"></i> USERNAME </label><br>
            <input type="text"    required   id="uname"  name="username" autocomplete="off" value=<%=user.getUsername() %> readonly><br><br>

            <label for="mail"><i class="fa-solid fa-envelope"></i> EMAIL</label><br>
            <input type="email"    required   id="mail"  name="email" autocomplete="off"  value=<%=user.getEmail() %> readonly><br><br>


            <label for="comment"><i class="fa-solid fa-comment"></i> COMMENT</label><br>
            <textarea name="comment" id="cmt" required rows="7"  style="margin-left:56px;border-style:none;width:70%;text-align: center;color:blueviolet;font-size: large;" autofocus></textarea><br><br>


      <input type="submit" value="SUBMIT" id="sbm" class="buton">


        </form>
    </div>
    <img src="media/contactus.png" height="410px" width="480px" id="cont">
</body>
</html>