<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="util.DBConnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Update Quotation</title>
		
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
				db.rs = db.st.executeQuery("select * from Quotation where qid='"+id+"'");
				while(db.rs.next())
				{
		%>
            
                <h2>Update Quotation Details</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" method="POST" action="./updateQuotation">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Quotation ID</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="qid" value=<%=db.rs.getString("qid") %> readonly>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Supplier</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="sname" value=<%=db.rs.getString("supplier") %>>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Date</label>
					  </div>
					  <div class="col-txt">
						<input type="date" name="date" value=<%=db.rs.getString("date") %> pattern="[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Item Name</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="item" value=<%=db.rs.getString("itemName") %>>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Price</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="price" value=<%=db.rs.getString("pricePerItem") %>>
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