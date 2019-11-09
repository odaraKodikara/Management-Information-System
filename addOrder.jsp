<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html>
<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Add Order</title>
		
	</head>

	<body>
	
			<%@include file="/header.jsp" %> 
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="supplierDashboard.jsp">Dashboard</a>
		            <a href="addSupplier.jsp">Supplier Details</a>
		            <a href="addQuotation.jsp">Quotation Details</a>
		            <a href="addOrder.jsp" class="active">Order Details</a>
		            <a href="shReports.jsp">Reports</a>
		            <a href="suggestions.jsp">Get Best Supplier Suggestions</a>
			</div>
				
            </div>  
              
            <div class = "middlebox"> 
                <h2>Add New Order</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" method="POST" action="addOrder">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Supplier</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="sname" placeholder="Enter supplier..." required>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Item Id</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="item" placeholder="Enter item id..." required>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Cost</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="cost" placeholder="Enter cost..." required>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Quantity</label>
					  </div>
					  <div class="col-txt">
						<input type="number" name="qty" placeholder="Enter quantity..." pattern="[>0]" required>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Date</label>
					  </div>
					  <div class="col-txt">
						<input type="date" name="date" placeholder="YYYY-MM-DD">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Rank</label>
					  </div>
					  <div style="position:relative;right:25px;" class="col-txt">
						<select name="rank">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						</select>
					  </div>
					</div>
					
					</br>
					<div class="row">
					  <input type="submit" value="Submit">
					</div>
				  </form>

				
          
  <br><br><br>
  <hr>  
  <br><br><br>      
<!-- ************************************************************************************************************************************************ -->

<div >
		<table id="supplier" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Order ID</b></th>
				<th><b>Supplier Name</b></th>
				<th><b>Item</b></th>
				<th><b>Cost</b></th>
				<th><b>Quantity</b></th>
				<th><b>Date</b></th>
				<th><b>Rank</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
			</tr>

			<%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from Orders");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("oid") %></td>
				<td><%=db.rs.getString("supplier") %></td>
				<td><%=db.rs.getString("item") %></td>
				<td><%=db.rs.getString("cost") %></td>
				<td><%=db.rs.getString("quantity") %></td>
				<td><%=db.rs.getString("date") %></td>
				<td><%=db.rs.getString("rank") %></td>
				<td><a href="updateOrder.jsp?u=<%=db.rs.getString("oid") %>"><input 
				onMouseOver="this.style.backgroundColor='blue'"
   				onMouseOut="this.style.backgroundColor='#757573'"
							 type="submit" value="Update"></a></td>
				<td>
					<form action="deleteOrder" method="post">
						<input type="hidden" name="id"
							value="<%=db.rs.getString("oid") %>"> <input
							 type="submit" value="Delete">
					</form>
				</td>
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