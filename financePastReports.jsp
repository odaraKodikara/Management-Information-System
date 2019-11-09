<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Past Reports</title>
		
	</head>

	<body>
	
			<div class="header">
			
				<img src="images/one.jpg" class="header-img">
				<a href="login.jsp"><button class="btn-login">Log Out</button></a>
				<button class="btn-page" disabled>Finance</button>
				
			</div>
			
			
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="financeDashboard.jsp">Dashboard</a>
		            <a href="financeProfile.jsp">Profile</a>
		            <a href="financePastReports.jsp" class="active">Past Reports</a>
		            <a href="financeMonthReport.jsp">Current Month Report</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox">
            <input type = "text" placeholder = "Search..."/>
            <hr style="border: 1px solid black;width:95%;">
            <h1 style ="position:relative;left:30px;top:2px;font-size:40px">Past Reports</h1>
            
            <p style ="position:realtive;margin-left:30px;top:3px"><b>Select :</b></p>
         <select style="position:absolute ; left: 570px;top: 300px;width: 150px">
         	<option value=""selected="selected">Year</option>
         	<option value="2018">2018</option>
         	<option value="2017">2017</option>
         	<option value="2016">2016</option>
		</select>
	 <select style= "position:absolute ; left: 750px; top: 300px;width: 150px" onChange="window.location.href=this.value">
        	<option value="" selected="selected">Month</option>
        	<option value="pr1.jsp">January</option>
   			<option value="pr2.jsp">February</option>
   			<option value="pr3.jsp">March</option>
   			<option value="pr4.jsp">April</option>
   			<option value="pr5.jsp">May</option>
   			<option value="pr6.jsp">June</option>
   			<option value="pr7.jsp">July</option>
   			<option value="pr8.jsp">August</option>
   			<option value="pr9.jsp">September</option>
   			<option value="pr10.jsp">October</option>
   			<option value="pr11.jsp">November</option>
   			<option value="pr12.jsp">December</option>
		</select>
			
			
			 <div style="height:400px;width: 95%;border: 2px solid green;padding:50px;margin: 20px;position:relative;top:30px;overflow:auto;">
				<div class="row">
				  <div class="column">
					<h3>Employee Salary</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" style = "text-align:right ; font-size:11px" id="discount" name="discount" placeholder="" disabled>
						  </div>
						  
						  
						</div>
					
					
				  </div>
				  
				  <div class="column">
					<h3>Supply Report</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" style = "text-align:right ; font-size:11px" id="discount" name="discount" placeholder="" disabled>
						  </div>
						  
						  
						</div>
					
					
				  </div><br>
				  
				  
				  
				  <div class="row">
				  <div class="column">
					<h3>Vehical Maintanace</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text"  style = "text-align:right ; font-size:11px" id="discount" name="discount" placeholder="" disabled>
						  </div>
						  
						  
						</div>
					
					
				  </div>
				  
				  <div class="column">
					<h3>Utility Expenses</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" style = "text-align:right ; font-size:11px" id="discount" name="discount" placeholder="" disabled>
						  </div>
						  
						  
						</div>
					
					
				  </div><br>
				  
				  <div class="row">
				  <div class="column">
					<h3>Total Sales</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" style = "text-align:right ; font-size:11px" id="discount" name="discount" placeholder="" disabled>
						  </div>
						  
						  
						</div>
					
					
				  </div>
				  
				  <div class="column">
					<h3>Profit</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" style = "text-align:right ; font-size:11px" id="discount" name="discount" placeholder="" disabled>
						  </div>						  
						</div>
				  </div><br>
				</div>
			</div> 
            </div>
            </div><br><br>
            </div>
         
    </body>  
</html> 