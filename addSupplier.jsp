<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html>
<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Add Supplier</title>
		
		<script type="text/javascript" src="jquery-1.4.2.js"></script>
  		<script type="text/javascript" src="http://dev.jquery.com/view/trunk
		/plugins/validate/jquery.validate.js"></script>
  		<script src="js/formValidation.js" type="text/javascript"></script>
		
	</head>

	<body>
	
			<%@include file="/header.jsp" %> 
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="supplierDashboard.jsp">Dashboard</a>
		            <a href="addSupplier.jsp" class="active">Supplier Details</a>
		            <a href="addQuotation.jsp">Quotation Details</a>
		            <a href="addOrder.jsp">Order Details</a>
		            <a href="shReports.jsp">Reports</a>
		            <a href="suggestions.jsp">Get Best Supplier Suggestions</a>
			</div>
				
            </div>  
              
            <div class = "middlebox"> 
                <h2>Add New Supplier</h2> 
                <hr class="second-hr"><br>
				<form id="form" class="newCustomer" method="POST" action="./addSupplier">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Name</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="sname" placeholder="Enter name...">
						<!-- <span class="label">Name *</span> -->
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">E-mail Address</label>
					  </div>
					  <div class="col-txt">
						<input type="email" name="email" placeholder="Enter email Address...">
						<!-- <span class="label">Email *</span> -->
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Contact No</label>
					  </div>
					  <div class="col-txt">
						<input type="tel" name="conNo" placeholder="xxx-xxxxxxx" pattern="[0-9]{10}" required>
						<!-- <span class="label">Contact No *</span> -->
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Address</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="address" placeholder="Enter Address...">
						<!-- <span class="label">Address *</span> -->
					  </div>
					</div>
					
					</br>
					<div class="row">
					  <input type="submit" id="Rbtn" value="Submit">
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
				<th><b>Contact No</b></th>
				<th><b>Email</b></th>
				<th><b>Address</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
			</tr>

			<%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from Supplier");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("sName") %></td>
				<td><%=db.rs.getString("contactNo") %></td>
				<td><%=db.rs.getString("email") %></td>
				<td><%=db.rs.getString("address") %></td>
				<td><a href="updateSupplier.jsp?u=<%=db.rs.getString("sName") %>"><input 
				onMouseOver="this.style.backgroundColor='blue'"
   				onMouseOut="this.style.backgroundColor='#757573'"
							 type="submit" value="Update"></a></td>
				<td>
					<form action="./deleteSupplier" method="post">
						<input type="hidden" name="id"
							value="<%=db.rs.getString("sName") %>"> <input
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