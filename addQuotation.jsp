<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html>
<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Add Quotation</title>
		
	</head>

	<body>
	
			<%@include file="/header.jsp" %> 
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="supplierDashboard.jsp">Dashboard</a>
		            <a href="addSupplier.jsp">Supplier Details</a>
		            <a href="addQuotation.jsp" class="active">Quotation Details</a>
		            <a href="addOrder.jsp">Order Details</a>
		            <a href="shReports.jsp">Reports</a>
		            <a href="suggestions.jsp">Get Best Supplier Suggestions</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox"> 
                <h2>Add Quotation</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" method="POST" action="./addQuotation">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Supplier</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="sname" placeholder="Enter supplier name..." required>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Item</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="item" placeholder="Enter item name..." required>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Price Per Item</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="price" placeholder="Enter item price..." required>
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
				<th><b>Supplier Name</b></th>
				<th><b>Item Name</b></th>
				<th><b>Price</b></th>
				<th><b>Date</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
			</tr>

			<%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from Quotation");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("supplier") %></td>
				<td><%=db.rs.getString("itemName") %></td>
				<td><%=db.rs.getString("pricePerItem") %></td>
				<td><%=db.rs.getString("date") %></td>
				<td><a href="updateQuotation.jsp?u=<%=db.rs.getString("qid") %>"><input 
				onMouseOver="this.style.backgroundColor='blue'"
   				onMouseOut="this.style.backgroundColor='#757573'"
							 type="submit" value="Update"></a></td>
				<td>
					<form action="deleteQuotation" method="post">
						<input type="hidden" name="id"
							value="<%=db.rs.getString("qid") %>"> <input
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