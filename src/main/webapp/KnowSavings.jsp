<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@page import="com.jsp.expensetracker.entity.User" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Know Savings</title>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

    <link rel="icon" href="media/expenses-removebg-preview (1).png">
      <style>
      #myChart{
     position:absolute;
     top:29%;
    left:25%;
    
      }
      body{
      overflow:hidden;
      }
      #result{
      height:320px;
      width:520px;
      border-style:solid;
      position:absolute;
      top:33%;
      left:10%;
      font-size:17px;
      background-color:whitesmoke;
      animation-name: cfor;
animation-duration: 3s;
animation-iteration-count: 1;
    }
    @keyframes cfor
    {
        from{
            transform:rotateY(90deg);
        }
        to  
        {
            transform:rotateY(0deg);
        }
    }
      a button
      {
      height:39px;
      width:150px;
      background-color:blueviolet;
      color:white;
      text-align:center;
      border-style:none;
      border-radius:10px;
      letter-spacing:2px;
      font-size:medium;
      font-weight:normal;
      box-shadow:2px 2px 2px 2px whitesmoke;
      
      
      }
      a button:hover{
                  background-color: rgba(153, 50, 204,0.8);
      
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
      
       .more h4{
       font-size:28px;
       z-index:5;
       }
      </style>
</head>
<body>
<div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>
        <a href="home.jsp" id="dd"><i class="fa-solid fa-home"></i>&nbsp;Home</a>

    </div>
    <br><br><center><image src="media/datanf.gif" height="250px" width="250px" id="ii" style="display:none;">
    </image>
<%
User user=(User) session.getAttribute("userInfo");
double salary=(Double)request.getAttribute("salary");
double expenses=(Double)request.getAttribute("total");
double savings=Math.ceil((Double)request.getAttribute("savings"));
String monthName=(String)request.getAttribute("monthName");

if( expenses!=0.0){
%>

<div id="result">
<img src="media/save.gif" height="320px" width="230px" style="float:left;display:inline;">
<div  style="padding:5px;margin-left:7px;color:blueviolet;text-align:center"><br>
<h2 style="text-decoration:underline;text-shadow:1px 0px lightgrey;font-size:24px;letter-spacing:2px;word-spacing:3px;">Your Savings</h2>
<br><h3>Month Name = &#128467; <%=monthName %></h3>
<br>
<h3>Your Salary = &#8377; <%=salary %></h3><br>
<h3> Your Expenses = &#8377;<%=expenses %> </h3><br>
<h3> Your Savings = &#8377;<%=salary-expenses %> </h3><br>

<h3>Savings : <%=savings %> %</h3><br>
<h3>Expenses : <%=100-savings %> %</h3></div>
</div>

<div id="chart">

<canvas id="myChart" width="800" height="190"></canvas></div>
 <script>
 
var xValues=["EXPENSES = <%=100-savings%> %"," SAVINGS = <%=savings%> %"];
var yValues=[<%=100-savings%>,<%=savings%>];
var barColors=["red","blue"];
new Chart("myChart", {
  type: "pie",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor:barColors,
     
      data: yValues
    }]
  },
  options: {
    legend: {display:true},
    title: {
      display: true,
      text: "Your Savings & Expenses In <%=monthName%>",
    	  fontSize: 19, // Adjust the font size as needed
          fontColor: 'purple',
          wordSpacing:2
    }
  }
});
</script>
<center>
<a href="Savings.jsp" ><button style="position:absolute;top:15%;right:3%;" id="bck">&#10096; GO BACK</button></a></center>
<%}else{ %>
<script>
document.getElementById("ii").style.display="block";

</script>
<center>
<h2>Hello <%=user.getUsername() %> !! You Didn't Added Any Expenses In  <%=monthName %> </h2><br>
<h2> <a href="ViewExpenses" style="text-decoration:none;">Click here to check all Your Expenses Details</a></h2>
<br><a href="Savings.jsp" ><button  id="bck">&#10096; GO BACK</button></a></center>

</center>

<%} %>
<% if(expenses > salary) {
	%>
    <script>

    
    document.getElementById("myChart").style.display="none";
    document.getElementById("result").style.display="none";
    document.getElementById("bck").style.display="none";
   
    </script>
   
   <center >  <img src="media/flyMoney.gif" height="500px" width="1020px" style="position:absolute;top:16%;left:17%;z-index:-1;opacity:0.4;"><br> <center >
   <center >  <br><br><br><div class="more" ><h4>Hello <%=user.getUsername()  %>!!! </h4><br>
    <h4>Your Salary in <%=monthName %>=&#8377; <%=salary %></h4><br>
    <h4>Your Expenses in <%=monthName %>= &#8377; <%=expenses %></h4><br>
    <h4 style="color:purple;">You spent more than you earned in <%=monthName %></h4><br>
    <h4 id="svn"> Your Savings is <%=savings %></h4>
    
    <h4>We are suggesting some financial precautions to u <a href="media/financialprecautionset.pdf" target="blank">Click here</a></h4>
    <br><a href="Savings.jsp" ><button  >&#10096; GO BACK</button></a>
    </center>
    
    </div>
<% } %>

</body>
</html>