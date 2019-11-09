<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.* %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<link type="text/css" rel="stylesheet" href="css/style.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Title</title>
</head>


<body>

		<div class="header">
			
				<img src="Images/fashionbug.jpg" class="header-img">
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
            
   		
   		<!-- *********************************************************************************************** -->
<form method="post" name="frm" action="VehicleReport">
	<h3>Search By Date</h3>
	<label for="fname">From Date</label>
	<input type="date" name="fromDate" placeholder="From Date"> <br></br>
	<label for="fname">To Date</label>
	<input type="date" name="toDate" placeholder="To Date">	 
	<br>
	<input class="row" style="colspan:6;align:center;position:relative;right:1000px;" type="submit" name="submit" id="submit" value="Search">
</form>

			
<div >		
<br></br>
<h3 style ="position:relative;left:30px;top:2px;font-size:40px">Delivery Trips</h3>
<hr style="border: 1px solid black;width:95%;">

<%
                if (request.getAttribute("sum1") != null) {
                	Integer sumCost1 =(Integer)request.getAttribute("sum1"); 
                    System.out.println(sumCost1);
            %>
				  <div class="column">
					<h3>Total Trips</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="daily" name="daily" placeholder="" value="<%=sumCost1 %>"readonly>
						  </div>  
						</div>
				  </div>
				  
				  
				</div>
			<%
                } 
            %>
            
<%
                if (request.getAttribute("sum2") != null) {
                	Integer sumCost2 =(Integer)request.getAttribute("sum2"); 
                    System.out.println(sumCost2);
            %>
				  <div class="column">
					<h3>Total Cost</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="daily" name="daily" placeholder="" value="<%=sumCost2 %>"readonly>
						  </div>  
						</div>
				  </div>
				  
				  
				</div>
			<%
                } 
            %>
            
            <%
                if (request.getAttribute("sum3") != null) {
                	Integer sumCost3 =(Integer)request.getAttribute("sum3"); 
                    System.out.println(sumCost3);
            %>
				  <div class="column">
					<h3>Total Distance</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="daily" name="daily" placeholder="" value="<%=sumCost3 %>"readonly>
						  </div>  
						</div>
				  </div>
				  
				  
				</div>
			<%
                } 
            %>

			
         
   
 		</div>
	 	
            
            
</body>
</html>




</html>