<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Login</title>
		
	</head>

	<body>
	
			<%@include file="/headerLogIn.jsp" %> 
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="#">Customer Handling</a>
		            <a href="#">Inventory Handling</a>
		            <a href="#">Supplier Handling</a>
		            <a href="#">Employee Handling</a>
		            <a href="#">Transportation Management</a>
		            <a href="#">Finance Management</a>
		  
		            
			</div>
				
            </div>  
              
	
	 <div class = "middlebox"> 
                <h2>Login</h2> 
                <hr class="second-hr"><br>
				<form method="post" class="newCustomer" action="loginServlet">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Username :</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="uname" placeholder="Enter Username...">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Password :</label>
					  </div>
					  <div class="col-txt">
						<input type="password" name="pass" placeholder="Enter Password...">
					  </div>
					</div>
					
					
					</br>
					<div class="row">
					  <input type="submit" value="Login">
					</div>
				  </form>



<br><br>








				
            </div> 

</body>
</html>