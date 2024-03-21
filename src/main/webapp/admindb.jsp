<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN </title>
<link rel="icon" href="media/expenses-removebg-preview (1).png">

    <script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
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
      
</style>
</head>
<body>
 <div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>

    </div>
<br><br><center><h3>ADMIN DASHBOARD</h3>
</center>
<br><br><br>
<center>
<a href="ViewUser"><button>VIEW USER INFO</button></a><br><br><br>
<a href="RatingGraph"><button>VIEW RATINGS</button></a><br><br><br>
<a href="Feedback.jsp"><button>VIEW CUSTOMER FEEBACK</button></a><br><br><br>
<a href="GetUserRequest"><button>VIEW USERS REQUESTS</button></a>

</center>
</body>
</html>