<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>Add Expenses</title>
    <script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <link rel="icon" href="media/expenses-removebg-preview (1).png">
    <link rel="stylesheet" href="addexpenses.css">
    <style>
            #parent
        {
           margin-left:70px;
           margin-top:40px;
           height:545px;
           width:90%; 
            background-color: rgba(153, 50, 204,0.4);

        }
    
    
    </style>
</head>
<body>
 <div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>
        <a href="home.jsp" id="dd"><i class="fa-solid fa-home"></i>&nbsp;Home</a>

    </div>
    <div id="parent">
        
<div class="child1">
<img src="media/addexpimage.png" height="300px" width="300px">
</div>
<div class="child">
    <h3 >ADD EXPENSES</h3>
    <div class="child2">
<form method="get" action="AddExpense">
    <input type="text" placeholder="amount " required name="amount">
    <br><br>
    <input type="date" placeholder="dd-mm-yyyy" required name="date">
    <br><br>
    <input list="category" name="category" required placeholder="select category">
    <datalist id="category">
    	<option value="Utilities">Utilities</option>
        <option value="Transportation">Transportation</option>
        <option value="Groceries">Groceries</option>
        <option value="DiningOut">DiningOut</option>
        <option value="Entertainment">Entertainment</option>
        <option value="HealthCare">HealthCare</option>
        <option value="Education">Education</option>
        <option value="PersonalCare">PersonalCare</option>
        <option value="Clothing">Clothing</option>
        <option value="Home&maintanence">Home&maintanence</option>
        <option value="Gift&Donations">Gift&Donations</option>
        <option value="Savings&Investments">Savings&Investments</option>
        <option value="Tax">Tax</option>
    	<option value="Others">Others</option>
    </datalist>
    <br><br>
    <textarea rows="6" cols="15" name="description" placeholder="Description.."></textarea>
    <br><br>
    <center>
    <input type="submit" value="ADD" id="lb">
    </center>
</form>
</div>
</div></div>

</body>
</html>