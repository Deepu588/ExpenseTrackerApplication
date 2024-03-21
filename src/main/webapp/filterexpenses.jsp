<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
   <title>Filter Expenses</title>
    <script src="https://kit.fontawesome.com/c51795afff.js" crossorigin="anonymous"></script>
    <link rel="icon" href="media/expenses-removebg-preview (1).png">
    <link rel="stylesheet" href="filterexpenses.css">   
     </head>
<body>
<div class="header">
        <a href="index.jsp"> <img src="media/expenses-removebg-preview (1).png" style="height:47px;width:47px;padding:22px;margin-left:33px;"> </a>    <b>Spring Expenses Tracker</b>
        <a href="home.jsp" id="dd"><i class="fa-solid fa-home"></i>&nbsp;Home</a>

    </div> <center>
    <div class="mab">
        <h3><i class="fa-solid fa-filter" style="color:grey;"></i>Filter Expenses</h3><br><br>
<form method="get" action="FilterExpense">
    <label><h4>Select Date</h4></label><br>
    <input type="date"  placeholder="dd-mm-yyyy" name="date">
    <br><br>
    <label><h4>Select Category</h4></label><br>
 <input type="text" class="form-control" list="sub" name="category">
                    <datalist id="sub">
                        <option>Utilities</option>
                        <option>Transportation</option>
                        <option>Groceries</option>
                        <option>Dining out</option>
                        <option>Entertainment</option>
                        <option>HealthCare</option>
                        <option>Education</option>
                        <option>PersonalCare</option>
                        <option>Clothing</option>
                        <option>HomeMaintainance</option>
                        <option>Gifts&Donations</option>
                        <option>Saving&investments</option>
                        <option>Tax</option>
                        <option>Others</option>
                    </datalist>    <br><br>
    <label><h4>Select Amount</h4></label><br>
                        <select class="form-control"  name="amount">
                    	<option>-Select-</option>
                        <option>100-500</option>
                        <option>500-1500</option>
                        <option>1500-2500</option>
                        <option>2500-4000</option>
                    </select>
    
    <br><br>
    <input type="submit" value="Filter" class="bttt">&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" value="Reset" class="bttt">
</form>
    </div></center>
</body>
</html>