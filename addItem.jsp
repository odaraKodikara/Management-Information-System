<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Add Item</title>
		
	</head>

	<body>
	
			<%@include file="/header2.jsp" %> 
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
		            <a href="addItem.jsp" class="active">Add Item</a>
					<a href="addItem.jsp" class="active">Add Item</a>
					<a href="addItem.jsp" class="active">Add Item</a>
					<a href="addItem.jsp" class="active">Search</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox"> 
                <h2>Add New Item</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" method="POST" action="./addItemServlet">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Name</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="name" >
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Category</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="category" >
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Quantity</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="qty">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Cost Price</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="maxCost" >
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Unit Price</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="unitPrice">
					  </div>
					</div>

					</br>
					<div class="row">
					  <input type="submit" value="Submit">
					</div>
				  </form>

				

</body>
</html>