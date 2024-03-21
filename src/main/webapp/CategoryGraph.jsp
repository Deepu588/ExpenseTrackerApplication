<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.jsp.expensetracker.entity.Expense" %>
        <%@page import="com.jsp.expensetracker.entity.User" %>
                <%@page import="com.jsp.expensetracker.service.*" %>
        
            <%@page import="java.util.*" %>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Category Graph</title>
<script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <link rel="stylesheet" href="tablestyle.css">

    <link rel="icon" href="media/expenses-removebg-preview (1).png">
    <style>
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
        
        #myChart,h2
        {
        
        animation-name:graph;
        animation-duration:4s;
        animation-iteration-count:1;
        
        }
        
        @keyframes graph
    {
        from{
            transform:rotateY(90deg);
        }
        to  
        {
            transform:rotateY(0deg);
        }
    }
    
    td{
    height:10px;
   background-color:none;
    }
    
     button
      {
      height:35px;
      width:450px;
      background-color:blueviolet;
      color:white;
      text-align:center;
      border-style:none;
      border-radius:10px;
      letter-spacing:2px;
      font-size:medium;
      font-weight:normal;
      
      
      }
       button:hover{
                  background-color: rgba(153, 50, 204,0.8);
      
      }
      
    </style>
</head>
<body>
<div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>
        <a href="home.jsp" id="dd"><i class="fa-solid fa-home"></i>&nbsp;Home</a>

    </div>
    
    <%    
	 ExpenseService expenseService=new ExpenseServiceImpl();

    User user=(User) session.getAttribute("userInfo");
	System.out.println("print user details "+user);
    List<Expense> listOfExpense=expenseService.viewExpense(user.getUserId());

    System.out.println("GRAPHS "+listOfExpense);
   double utilitiesAmount=0.0;
   double transportAmount=0.0;
   double groceryAmount=0.0;
   double diningAmount=0.0;
   double entertaainmentAmount=0.0;
   double healthAmount=0.0;
   double educationAmount=0.0;
   double personalCareAmount=0.0;
   double clothingAmount=0.0;
   double HomeAmount=0.0;
   double giftsAmount=0.0;
   double savingsAmount=0.0;
   double taxAmount=0.0;
   double othersAmount=0.0;
   double totalAmount=0.0;
    for(Expense e:listOfExpense)
    {
    	totalAmount+=e.getAmount();
    	if(e.getCategory().equalsIgnoreCase("utilities"))
    	{
    		utilitiesAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("transportation"))
    	{
    		transportAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("groceries"))
    	{
    		groceryAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("DiningOut"))
    	{
    		diningAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("Entertainment"))
    	{
    		entertaainmentAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("HealthCare"))
    	{
    		healthAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("Education"))
    	{
    		educationAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("PersonalCare"))
    	{
    		personalCareAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("Clothing"))
    	{
    		clothingAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("Home&maintanence"))
    	{
    		HomeAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("Gift&Donations"))
    	{
    		giftsAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("Savings&Investments"))
    	{
    		savingsAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("Tax"))
    	{
    		taxAmount+=e.getAmount();
    	}
    	else if(e.getCategory().equalsIgnoreCase("Others"))
    	{
    		othersAmount+=e.getAmount();
    	}
    	
    }
    
 %>
 <br><br>
 <a href="ViewExpenses" style="position:absolute;top:14%;right:3%;"><button style="width:90px;">BACK</button></a>
     <canvas id="myChart"   width="700" height="200"></canvas>
 <script>
 
var xValues = ["utilities", "Transportation", "Groceries", "Dining Out", "Entertainment","Health Care","Education","personal care","Clothing","Home Maintanence","Gifts & Donations","Savings &Investments","Tax","Others"];
var yValues = [<%= utilitiesAmount%>,<%=transportAmount%>,<%= groceryAmount%>,<%=diningAmount%>,<%= entertaainmentAmount%>,<%=healthAmount%>,<%= educationAmount%>,<%=personalCareAmount%>,<%=clothingAmount%>,<%=HomeAmount%>,<%= giftsAmount%>,<%=savingsAmount%>,<%= taxAmount%>,<%=othersAmount%>];
//var barColors = ["red", "green","blue","orange","brown"];

new Chart("myChart", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor:'blueviolet',
     
      data: yValues
    }]
  },
  options: {
    legend: {display:false},
    title: {
      display: true,
      text: "AMOUNT SPENT ON EACH CATEGORY TILL TODAY",
    	  fontSize: 18, // Adjust the font size as needed
          fontColor: 'purple',
          wordSpacing:2
    }
  }
});
</script>
<center>
<div id="vd" style="z-index:19;border-style:solid;position:absolute;top:15%;left:26%;display:none;    background-color:white;">
<table border="2" style="height:130px;width:690px;">
<tr><th colspan="3" align="center">  AMOUNT SPENT TILL DATE = &#8377; <%=totalAmount %></th></tr>

<tr><th>SNO</th><th>CATEGORY</th> <th>AMOUNT</th></tr>
<tr><td>1</td><td>Utilities</td><td>&#8377;<%= utilitiesAmount%> </td></tr>
<tr><td>2</td><td>Transportation</td><td>&#8377; <%=transportAmount%></td></tr>
<tr><td>3</td><td>Groceries</td><td>&#8377; <%= groceryAmount%></td></tr>
<tr><td>4</td><td>Dining Out</td><td>&#8377;<%=diningAmount%> </td></tr>
<tr><td>5</td><td>Entertainment</td><td>&#8377; <%= entertaainmentAmount%></td></tr>
<tr><td>6</td><td>Health Care</td><td>&#8377; <%=healthAmount%> </td></tr>
<tr><td>7</td><td>Education</td><td>&#8377; <%= educationAmount%></td></tr>
<tr><td>8</td><td>Personal Care</td><td>&#8377; <%=personalCareAmount%></td></tr>
<tr><td>9</td><td>Clothing</td><td>&#8377; <%=clothingAmount%></td></tr>
<tr><td>10</td><td>Home Maintanence</td><td>&#8377;<%=HomeAmount%> </td></tr>
<tr><td>11</td><td>Gifts & Donations</td><td>&#8377; <%= giftsAmount%></td></tr>
<tr><td>12</td><td>Savings & Investments</td><td>&#8377; <%=savingsAmount%></td></tr>
<tr><td>13</td><td>Taxes</td><td>&#8377; <%= taxAmount%></td></tr>
<tr><td>14</td><td>Others</td><td>&#8377; <%=othersAmount%></td></tr>
</table>
<button id="close" style="width:690px;align:center;height:29px;background-color:red;border-radius:0px;" onclick="hide()">  Close </button>

</div>
</center>
    <br>
    <center>
    <h2 style="color:red;text-shadow:1px 1px white;letter-spacing:1px;word-spacing:2px;">TOTAL AMOUNT SPENT TILL DATE = &#8377; <%=totalAmount %></h2>
    <br>
    <button onclick="showDetails();">VIEW AMOUNT SPENT ON EACH CATEGORY</button>
    </center>
    
    <script>
    function showDetails(){
    	var x=document.querySelector("#vd");
    	var y=document.querySelector("#myChart");
    	if(x.style.display=='none')
    		{
    		x.style.display="block";
    		y.style.display="none";
    		}
    	else
    		{
    		
    		x.style.display="none";
    		y.style.display="block";

    		}
    }
    
    function hide()
    {
    	var x=document.querySelector("#vd");
		x.style.display="none";
    	var y=document.querySelector("#myChart");
		y.style.display="block";

    }
    </script>
</body>
</html>