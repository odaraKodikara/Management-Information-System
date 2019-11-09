<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="util.DBConnect"%>
<!DOCTYPE html>
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
			
					<a href="#" class="active" onclick="window.location.href='vehicleManagement.jsp'">Vehicle Management </a>
		            <a href="#" onclick="window.location.href='DeliveryManagement.jsp'">Delivery Management</a>
		            <a href="#" onclick="window.location.href='reports.jsp'">Reports</a>
		            
		            
			</div>
				
            </div>  
               
            <div class = "middlebox">
            <h1 align="center" style ="font-size:40px">Vehicle Management</h1>
            <hr style="border: 1px solid black;width:95%">
            
      		<form method="POST" name="frm" action="SearchServlet"> 
          <input class="col-txt" type ="text" name="regNo" id="regNo" placeholder = "Search..."/>
          <input class="row" style="colspan:6;align:center;" type="submit" name="submit" id="submit" value="Search">
          </form><br><br><br><br><br><br>
           
   		 	 
			<form action="AddVehicleServlet" method="POST">
	  		
	    <div class="form" >
    	<label>Vehicle Registration Number: </label>
    	<input type="text" name="regNo"/><br><br>
    	<label>Vehicle Type:</label>
        <input type="text" name="type"/><br><br> 
    	<label>Model:</label>
         <input type="text" name="model"/><br><br>
    	<label>Price:</label>
    	 <input type="text" name="price"/><br><br>
    	<label>Insurance Number:</label>
    	 <input type="text" name="insNo"/><br><br>
    	 
    	<button type="submit" class="btn-login">ADD  VEHICLE</button> <br><br>
    	</form>
    	
    	  <div id="container">
     
          <div id="content">
              
		<table id="supplier" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Vehicle Registration Number</b></th>
				<th><b>Vehicle Type</b></th>
				<th><b>Model</b></th>
				<th><b>Price</b></th>
				<th><b>Insurance Number</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
			</tr>

			<%
			try
			{
			    DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from Vehicle");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("regNo") %></td>
				<td><%=db.rs.getString("type1") %></td>
				<td><%=db.rs.getString("model") %></td>
				<td><%=db.rs.getDouble("price") %></td>
				<td><%=db.rs.getString("insureNo") %></td>
				<td><a href="updateVehicleManagement.jsp?u=<%=db.rs.getString("regNo") %>"><input 
				onMouseOver="this.style.backgroundColor='red'"
   				onMouseOut="this.style.backgroundColor='#757573'"
							 type="submit" value="Update"></a></td>
				<td>
					<form action="DeleteServlet" method="post">
						<input type="hidden" name="id"
							value="<%=db.rs.getString("regNo") %>"> <input
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
   		
   		
   		
   		
   		
   		</div>
   	  
 		</div>
	 	
            
            
</body>
</html>
