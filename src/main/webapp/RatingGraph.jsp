<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Arrays" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ratings Graph</title>
<script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

    <link rel="icon" href="media/expenses-removebg-preview (1).png">
    <style>
    
           a button
      {
      height:49px;
      width:450px;
      background-color:blueviolet;
      color:white;
      text-align:center;
      border-style:none;
      border-radius:10px;
      letter-spacing:2px;
      font-size:larger;
      font-weight:normal;
      box-shadow:2px 2px 2px 2px whitesmoke;
      
      
      }
      a button:hover{
                  background-color: rgba(153, 50, 204,0.8);
      
      }
      body{
      overflow:hidden;
      }
    </style>
</head>
<body>
<%
Integer one=(Integer) request.getAttribute("one");
Integer two=(Integer) request.getAttribute("two");
Integer three=(Integer) request.getAttribute("three");
Integer four=(Integer) request.getAttribute("four");
Integer five=(Integer) request.getAttribute("five");


int ones=one.intValue();
int twos=two.intValue();
int threes=three.intValue();
int fours=four.intValue();
int fives=five.intValue();
System.out.println(ones);
System.out.println(twos);
System.out.println(threes);
System.out.println(fours);
System.out.println(fives);

%>
<center>
<div style="width:800px;height:1900px;margin-top:100px;">
 <canvas id="myChart"    ></canvas></div></center>
 <script>
 var canvas = document.getElementById("myChart");
 //canvas.width = 200; // Set the width in pixels
 //canvas.height = 120; 
var xValues = ["1 STAR","2 STAR","3 STAR","4 STAR","5 STAR"];
var yValues = [<%= ones%>,<%=twos%>,<%= threes%>,<%=fours%>,<%= fives%>];
//var barColors = ["red", "green","blue","orange","brown"];

new Chart("myChart", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor:'gold',
     
      data: yValues
    }]
  },
  options: {
    legend: {display:false},
    title: {
      display: true,
      text: "RATINGS",
    	  fontSize: 18, // Adjust the font size as needed
          fontColor: 'purple',
          wordSpacing:3
    },
  
  scales: {
      y: {
        suggestedMin: 1, // Set the base value for the y-axis
       // beginAtZero: true // Set this to false if you want to start from the suggestedMin
      }
    }
    }
});
</script>

    <center><a href="admindb.jsp" ><button >&#10096; GO BACK</button></a></center>

</body>
</html>