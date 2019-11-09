<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="util.DBConnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Update Supplier</title>
		
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
            <% String id=request.getParameter("u");%>
            <%
           
			try
			{
				DBConnect db = new DBConnect();
				String sql="select * from Supplier where sName='"+id+"'";
				db.rs=db.st.executeQuery(sql);
				while(db.rs.next())
				{
		%>
            
                <h2>Update Supplier Details</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" method="POST" action="./updateSupplier">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Name</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="sname" value=<%=db.rs.getString("sName") %> readonly>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">E-mail Address</label>
					  </div>
					  <div class="col-txt">
						<input type="email" name="email" value=<%=db.rs.getString("email") %>>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Contact No</label>
					  </div>
					  <div class="col-txt">
						<input type="tel" name="conNo" value=<%=db.rs.getString("contactNo") %> pattern="[0-9]{10}" required>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Address</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="address" value=<%=db.rs.getString("address") %>>
					  </div>
					</div>
					
					</br>
					<div class="row">
					  <input type="submit" value="Submit">
					</div>
				  </form>
				  
				  <%
		}
			
		}catch(Exception e){
			
		}
	
	%>

				 </div> 
</body>
</html>