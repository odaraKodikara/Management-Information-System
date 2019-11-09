<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="util.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
</head>
<body>


			<%@include file="/header2.jsp" %> 
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="supplierDashboard.jsp">Dashboard</a>
		            <a href="addSupplier.jsp" class="active">Supplier Details</a>
		            <a href="addQuotation.jsp">Quotation Details</a>
		            <a href="addOrder.jsp">Order Details</a>
		            
			</div>
				
            </div>  
             <div class = "middlebox"> 
             <%int id=Integer.parseInt(request.getParameter("INo"));%>	
            <% 
           
			try
			{
			
				DBConnect db = new DBConnect();
				String sql="select * from Item";
				db.rs=db.st.executeQuery(sql);
				while(db.rs.next())
				{
		%>
		
		<h2>Update Item Details</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" method="POST" action="./updateItemServletr">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Item Name</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="name" value=<%=db.rs.getString("name")%> readonly>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Category</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="category" value=<%=db.rs.getString("category") %>>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Quantity</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="quantity" value=<%=db.rs.getInt("quantity") %> required>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Cost price</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="maxCost" value=<%=db.rs.getString("maxCost") %>>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Selling price</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="unitPrice" value=<%=db.rs.getString("unitPrice") %>>
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

</body>
</html>