<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="styles/styles1.css">
		<link rel="stylesheet" type="text/css" href="styles/stylesSW1.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Discounts</title>
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
			
				<div class="row">
				
				<form class="" action="" method="POST">
				  <div class="column">
					<h2>Loyalty Members</h2>
					<hr class="second-hr"><br>
					
						<div class="row">
						  <div class="col-lbl">
							<label for="discount">Discount</label>
						  </div>
						  <div class="col-txt">
							<input type="text" name="discount" placeholder="Enter New Discount">
						  </div>
						  <br><br><br><br><br><br><br>
						  <input type="submit" value="UPDATE">
						  
						</div>
					
					
				  </div>
				  </form>
				  
				  <form class="bankDiscount" action="./updateBankDiscount" method="POST">
				  <div class="column">
					<h2>Credit Card Holders</h2>
					<hr class="second-hr"><br>
					
						<div class="row">
						  <div class="col-lbl">
							<label for="bank">Bank</label>
						  </div>
						  <div class="col-txt">
							<select name="bank"required>
								<option value="" disabled selected>Select Bank</option>
							  <option value="Peoples Bank">People's Bank</option>
							  <option value="Bank of Ceylon">Bank of Ceylon</option>
							</select>
						  </div>
						  
						  
						  
						</div><br>
						
						<div class="row">
						  <div class="col-lbl">
							<label for="discount">Discount</label>
						  </div>
						  <div class="col-txt">
							<input type="text" name="discount" placeholder="Enter New Discount">
						  </div>
						  <br><br><br>
						  <input type="submit" value="UPDATE">
						  
						</div>
					
				  </div>
				 </form>
				  
				</div>
			
<!-- ************************************************************************************************************************************************ -->

<div >
		<table id="supplier" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Bank</b></th>
				<th><b>Discount</b></th>
			</tr>

			<%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from CreditCard");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("bank") %></td>
				<td><%=db.rs.getString("discount") %></td>
			</tr>
			
			<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
			</div>
			
			</div>

</body>
</html>