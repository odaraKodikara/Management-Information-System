<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html>
<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<link rel="stylesheet" type="text/css" href="styles/styles1.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Supplier Handling</title>
	</head>

	<body>
	
			<%@include file="/header.jsp" %> 
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="supplierDashboard.jsp" class="active">Dashboard</a>
		            <a href="addSupplier.jsp">Supplier Details</a>
		            <a href="addQuotation.jsp">Quotation Details</a>
		            <a href="addOrder.jsp">Order Details</a>
		            <a href="shReports.jsp">Reports</a>
		            <a href="suggestions.jsp">Get Best Supplier Suggestions</a>
				</div>	
				
            </div>  
              
            <div class = "middlebox"> 
            
          <form method="post" name="frm" action="Search"> 
          <input class="col-txt" type ="text" name="pid" id="pid" placeholder = "Search..."/>
          <input class="row" style="colspan:6;align:center;" type="submit" name="submit" id="submit" value="Search">
          </form>
         
          <br><br><br>
            <hr style="border: 1px solid black;width:95%;">
            <h1 style ="position:relative;left:30px;top:2px;font-size:40px">Dashboard</h1>
            
            
            <%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select count(*) from Orders where rank between 1 and 3");
				while(db.rs.next())
				{
		%>
			
				<div class="row">
			
				  <div class="column">
					<h3>Orders</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="daily" name="daily" placeholder="" value="<%=db.rs.getInt(1) %>" readonly>
						  </div>
						  
						  
						</div>
					
					
				  </div>
		<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
	
	 <%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select count(*) from Quotation");
				while(db.rs.next())
				{
		%>
				  
				  <div class="column">
					<h3>Pending Orders</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="weekly" name="weekly" placeholder="" value="<%=db.rs.getInt(1) %>" readonly>
						  </div>
						  
						  
						</div>
					
					
				  </div>
				  
				  <%
		}
			
		}catch(Exception e){
			
		}
	
	%>
				 
				 <%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select count(*) from Orders where rank=4");
				while(db.rs.next())
				{
		%> 
				  <div class="column">
					<h3>Rejections</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="daily" name="daily" placeholder="" value="<%=db.rs.getInt(1) %>" readonly>
						  </div>  
						</div>
				  </div>
				   <%
		}
			
		}catch(Exception e){
			
		}
	
	%>
				  
	   <%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select sum(cost) from Orders where rank between 1 and 3 ");
				while(db.rs.next())
				{
		%> 
				  <div class="column">
					<h3>Total Purchase</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="daily" name="daily" placeholder="" value="<%=db.rs.getInt(1) %>"readonly>
						  </div>  
						</div>
				  </div>
				  
				  
				</div>
			 <%
		}
			
		}catch(Exception e){
			
		}
	
	%>
			
            </div> 
    </body>  
</html> 