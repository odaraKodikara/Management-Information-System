<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="util.DBConnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Update Item</title>
		
	</head>

	<body>
	
			<%@include file="/header2.jsp" %> 
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					 <a href="addItem.jsp" class="active">Add Item</a>
		            <a href="Update.jsp">Update Item</a>
			</div>
				
            </div>  
              
            <div class = "middlebox"> 
            <% String id=request.getParameter("u");%>
            <%
           
			try
			{
				DBConnect db = new DBConnect();
				String sql="select * from item";
				db.rs=db.st.executeQuery(sql);
				while(db.rs.next())
				{
		%>
            
                <h2>Update Item</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" method="POST" action="./updateItem">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Name</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="name" value=<%=db.rs.getString("name") %> readonly>
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
						<input type="text" name="quantity" value=<%=db.rs.getInt("quantity") %>>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Cost price</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="maxCost" value=<%=db.rs.getInt("maxCost") %>>
					  </div>
					</div>
										
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Sell price</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="unitPrice" value=<%=db.rs.getInt("unitPrice") %>>
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