<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="ISO-8859-1">
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<link type="text/css" rel="stylesheet" href="styles/style.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Title</title>
</head>

	
<body>

		<div class="header">
			
				<img src="images/fashionbug.jpg" class="header-img">
				<button class="btn-login">Log Out</button> 
				<button class="btn-page" disabled>Transportation</button>
				 
     
     
     
     
     
     
        </div>
	
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="#" class="active">Vehicle Management </a>
		            <a href="#">Delivery Management</a>
		            <a href="#">Reports</a>
		            
		            
			</div>
				
            </div>  
               
            <div class = "middlebox">
            
            		 <%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from Vehicle");
				while(db.rs.next())
				{
		%>
            
                <h2>Update Vehicle Details</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" method="POST" action="./UpdatevehicleServlet">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Vehicle Registration No</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="regNo" value=<%=db.rs.getString("regNo") %> readonly>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Vehicle Type</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="type" value=<%=db.rs.getString("type1") %> >
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Model</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="model" value=<%=db.rs.getString("model") %>>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Price</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="price" value=<%=db.rs.getDouble("price") %> >
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Insurance Number</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="insNo" value=<%=db.rs.getString("insureNo") %>>
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
