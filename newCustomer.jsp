<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="styles/styles1.css">
		<link rel="stylesheet" type="text/css" href="styles/stylesSW1.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Add Customer</title>
</head>
<body>
	
			<div class="header">
			
				<img src="images/fashionbug.jpg" class="header-img">
				<a href="login.jsp"><button class="btn-login">Log Out</button></a>
				<button class="btn-page" disabled>Customer Handling</button>
				
			</div>
			
			
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="newCustomer.jsp" class="active">Add New Customer </a>
		            <a href="customerDiscounts.jsp">Add Discount</a>
		            <a href="customerReport.jsp">Customer Reports</a>
		            <a href="notifyCustomer.jsp">Notify Customers</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox"> 
                <h2>Add New Loyal Customer</h2> 
                <hr class="second-hr"><br>
                
				<form class="newCustomer" action="./addCustomerServlet" method="POST">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Full Name</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="fullname" placeholder="Your Full name..">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Address</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="email" placeholder="Postal Address">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Telephone No</label>
					  </div>
					  <div class="col-txt">
						<input type="tel" name="conNo" placeholder="xxx-xxxxxxx" pattern="[0-9]{10}" required>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="gender">Gender</label>
					  </div>
					  <div class="col-txt">
						<select name="gender" required>
						  <option value="Male">Male</option>
						  <option value="Female">Female</option>
						</select>
					  </div>
					</div>
					
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Date Created</label>
					  </div>
					  <div class="col-txt">
						<input type="date" name="dateCreated">
					  </div>
					</div>
					
					</br>
					<div class="row">
					  <input type="submit" value="Submit">
					  <input type="reset">
					</div>
				  </form>
				  <br><br>
				
            </div> 
            
         
</body>
</html>