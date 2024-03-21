<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RateUs</title>
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
        span{
            font-size: 48px;
            color:black;
            letter-spacing: 2px;
        
        }
        #maincont
        {
            position:absolute;
            left:40%;
            top:45%;
            height:60px;
            width:310px;
            background-color:rgba(138, 43, 226,0.5);
            box-shadow:3px 2px 2px 2px lightgrey;
            
        }
        #display{
            font-size:30px;
            letter-spacing: 2px;
            text-align:center;
            position:absolute;
            top:30%;
            left:40%;
            color:blueviolet;
            text-shadow:1px 1px lightgrey;
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
   
    #que
    {
    	font-size:30px;
            letter-spacing: 2px;
            text-align:center;
            position:absolute;
            top:38%;
            left:42%;
            color:blueviolet;
            text-shadow:1px 1px grey;
    }
    
    #tqmsg{
    	font-size:30px;
            letter-spacing: 2px;
            text-align:center;
            position:absolute;
            top:61%;
            left:35%;
            color:blueviolet;
            text-shadow:1px 1px grey;
    }
    #tqmsg{
    	font-size:30px;
            letter-spacing: 2px;
            text-align:center;
            position:absolute;
            top:56%;
            left:35%;
            color:blueviolet;
            text-shadow:1px 1px grey;
    }
     #tqemj{
    	
            position:absolute;
            top:60%;
            left:48%;
           display:none;
    }
    #vrdt{
    font-size:25px;
            letter-spacing: 2px;
            text-align:center;
            position:absolute;
            top:39%;
            left:42%;
            color:red;
            text-shadow:1px 1px grey;
    }
   
</style>
</head>
<body>

<%String feemess=(String) request.getAttribute("feemes");
 if(feemess!=null){
 %>
 <script>alert('<%=feemess%>')</script>
 <%} %>
 
 
<div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>
        <a href="home.jsp" id="dd"><i class="fa-solid fa-home"></i>&nbsp;Home</a>

    </div>
    <center>
<b id="display" ></b>
<h3 id="que">Please Rate Us...</h3>
</center>
 <div id="maincont">
        
    <center><form  action="Rating" method="post">
 <span onclick="fill(1)"> &#9734;    </span>
  <span onclick="fill(2)"> &#9734;    </span>
  <span onclick="fill(3)"> &#9734;    </span>
  <span onclick="fill(4)"> &#9734;    </span>
  <span onclick="fill(5)"> &#9734;    </span>
  <input type="text"  id="rate" name="rateVal" hidden=true required><br><br>
    <input type="submit" style="background-color:blueviolet;color:white;border-radius:100px;border-style:none;height:30px;width:140px;font-size:medium;display:none;" id="sbt"></form>
  
</center>
</div><br><h3 id="tqmsg"></h3>
<h5 id="vrdt"></h5>
<img  id="tqemj" src="media/hand-shake.png" height="77px" width="70px"><br><br>

<script>

function fill(input)
{
	document.getElementById("rate").value=input;
	document.getElementById("que").style.display="none";
    var elements=document.getElementsByTagName("span");

    for(var v=0;v<input;v++)
    {
        elements[v].innerHTML='&#9733;';
    }
   // document.getElementById("maincont").style.height='90px';
document.getElementById("sbt").style.display="block";
	document.getElementById("display").innerHTML='Your  rating is '+input+'  of '+5;

	showEmoji(input);	
    
}
function showEmoji(input)
{
if(input==1)
	{
	

	document.getElementById("vrdt").innerHTML=' &nbsp;&nbsp;&nbsp;   POOR   &#128542;&#128542;';
	}
else if(input==2)
{
	document.getElementById("vrdt").innerHTML='&nbsp;&nbsp;AVERAGE   &#128578;&#128578;';
}
else if(input==3)
{
	
document.getElementById("vrdt").innerHTML='&nbsp;&nbsp;GOOD   &#128519;&#128519;&#128519;';
}
else if(input==4 )
{
	
document.getElementById("vrdt").innerHTML='VERY GOOD   &#128515;&#128515;';
}
else if(input==5)
{
	
document.getElementById("vrdt").innerHTML='OUTSTANDING   &#128077;&#128077;';
}

	}



</script>



 <%Integer numberObj=(Integer) request.getAttribute("number");
 if(numberObj!=null ){
	    int number = numberObj.intValue();
System.out.println("num value "+number);
 %>
<script>
alert("thanks for rating");
document.getElementById("que").style.display="none";
document.querySelector("#maincont").style.display="none";
document.getElementById("tqmsg").innerHTML='THANKS FOR THE RATING !!';
document.getElementById("tqemj").style.display="block";

</script>

<%} %>

</body>
</html>