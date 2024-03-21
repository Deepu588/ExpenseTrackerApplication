<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.time.LocalDate" %>
    <%@page import="java.sql.Date" %>
    <%@page import="java.util.*" %>
    <%@page import="com.jsp.expensetracker.entity.Expense" %>
        <%@page import="com.jsp.expensetracker.entity.User" %>
                <%@page import="com.jsp.expensetracker.service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>THIS WEEK EXPENSES</title>

<script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

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
        
        td,th{
        text-align:center;
        height:30px;
        border-style:solid;
        border-color:lightgrey;
        width:180px;
        }
        th
        {
        color:blueviolet;
        }
       table{
       margin-top:70px;
       height:190px;
       background-color:white;
       }
       </style> 
</head>
<body>
<div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>
        <a href="home.jsp" id="dd"><i class="fa-solid fa-home"></i>&nbsp;Home</a>

    </div>
<%
LocalDate currentDate = LocalDate.now();

    Date d7=Date.valueOf(currentDate );
	Date d6=Date.valueOf(currentDate.minusDays(1));
	Date d5=Date.valueOf(currentDate.minusDays(2));
	Date d4=Date.valueOf(currentDate.minusDays(3));
	Date d3=Date.valueOf(currentDate.minusDays(4));
	Date d2=Date.valueOf(currentDate.minusDays(5));
	Date d1=Date.valueOf(currentDate.minusDays(6));

ExpenseService expenseService=new ExpenseServiceImpl();
double d7Total=0;
double d6Total=0;
double d5Total=0;
double d4Total=0;
double d3Total=0;
double d2Total=0;
double d1Total=0;

User user=(User) session.getAttribute("userInfo");
System.out.println("printing user details "+user);
List<Expense> listOfExpense=expenseService.viewExpense(user.getUserId());
if(listOfExpense!=null){
for(Expense l:listOfExpense)
{
	if(l.getDate().equals(d7)){
		d7Total+=l.getAmount();
	}
	else if(l.getDate().equals(d6)){
		d6Total+=l.getAmount();
	}
	else if(l.getDate().equals(d5)){
		d5Total+=l.getAmount();
	}
	else if(l.getDate().equals(d4)){
		d4Total+=l.getAmount();
	}
	else if(l.getDate().equals(d3)){
		d3Total+=l.getAmount();
	}
	else if(l.getDate().equals(d2)){
		d2Total+=l.getAmount();
	}
	else if(l.getDate().equals(d1)){
		d1Total+=l.getAmount();
	}
}
}
%>

<br><br><br>

<canvas id="myChart" style="width:100%;max-width:900px;height:500px;margin-left:30px;margin-right:60px;float:left;"></canvas>

<script>
const xValues = ['<%=d1%>','<%=d2%>','<%=d3%>','<%=d4%>','<%=d5%>','<%=d6%>','<%=d7%>'];

const yValues = [<%=d1Total%>,<%=d2Total%>,<%=d3Total%>,<%=d4Total%>,<%=d5Total%>,<%=d6Total%>,<%=d7Total%>];


new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{
      fill: false,
      lineTension: 0,
      backgroundColor: "rgba(0,0,255,1.0)",
      borderColor: "rgba(0,0,255,0.7)",
      data: yValues
    }]
  },
  options: {
    legend: {display: false},
    title: {
        display: true,
        text: "YOUR EXPENSES IN THIS WEEK",
      	  fontSize: 18, // Adjust the font size as needed
            fontColor: 'purple',
            wordSpacing:2
      }
  }
});
</script>


<table border="1" id="tb">
<tr><th colspan="2"><b><%=user.getUsername() %> EXPENSES IN THIS WEEK</b></th></tr>
<tr>
<th>DATE</th>
<th>AMOUNT SPENT</th>
</tr>
<tr>
<td><%=d1 %></td>
<td>&#8377; <%=d1Total %></td>
</tr>
<tr>
<td><%=d2 %></td>
<td>&#8377; <%=d2Total %></td>
</tr>
<tr>
<td><%=d3 %></td>
<td>&#8377; <%=d3Total %></td>
</tr>
<tr>
<td><%=d4 %></td>
<td>&#8377; <%=d4Total %></td>
</tr>
<tr>
<td><%=d5 %></td>
<td>&#8377; <%=d5Total %></td>
</tr>
<tr>
<td><%=d6 %></td>
<td>&#8377; <%=d6Total %></td>
</tr>
<tr>
<td><%=d7 %></td>
<td>&#8377; <%=d7Total %></td>
</tr>
<tr>
<td colspan="2" style="color:blueviolet;"><b>AMOUNT SPENT IN THIS WEEK Rs <%=d1Total+d2Total+d3Total+d4Total+d5Total+d6Total+d7Total %>/-</b></td>
</tr>
</table>

<%
if(d1Total==0.0 && d2Total==0.0 && d3Total==0.0 && d4Total==0.0 && d5Total==0.0 && d6Total==0.0 && d7Total==0.0)
	
{
%>
<script>
document.querySelector("#myChart").style.display="none";
document.querySelector("#tb").style.display="none";
</script>
<br><br><br><br><br>
<center><h2>Hello <%=user.getUsername() %>!!</h2></center><br><br>
<center><h2>YOU DIDNOT ADDED ANY EXPENSES IN THIS WEEK</h2></center>
<%} %>
</body>
</html>