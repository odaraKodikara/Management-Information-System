<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="styles/styles1.css">
		<link rel="stylesheet" type="text/css" href="styles/stylesSW1.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
		rel="stylesheet">
		<title>Notify Discounts</title>
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
                <h2>Notify Discounts</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" action="#">
					<div class="row">
					  <div class="col-lbl">
						<label for="subject">Subject</label>
					  </div>
					  <div class="col-txt">
						<input type="text" id="subject" name="subject" placeholder="Enter Subject">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="attach">Attach</label>
					  </div>
					  <div class="col-txt">
						<input type="file" id="file">
						<!--<i class="material-icons">
						add_photo_alternate
						</i>
						<label for="file">Choose File</label>-->
						
					  </div>
					</div>
					
					
					<div class="row">
						<div class="col-25">
						  <label for="info">Addition Information</label>
						</div>
						<div class="col-75">
						  <textarea id="info" name="info" placeholder="Write Additional Information.." style="height:200px"></textarea>
						</div>
					  </div>
					
					
					
					</br>
					<div class="row">
					  <input type="submit" value="Send">
					</div>
				  </form>
	
            </div>

</body>
</html>