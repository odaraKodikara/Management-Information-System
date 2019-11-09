<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Dashboard</title>
		
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
			
					<a href="financeDashboard.jsp" class="active">Dashboard</a>
		            <a href="financeProfile.jsp">Profile</a>
		            <a href="financePastReports.jsp">Past Reports</a>
		            <a href="financeMonthReport.jsp">Current Month Report</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox">
            
            <form method="post" name="frm" action="financeSearch"> 
          <input class="col-txt" type ="text" name="pid" id="pid" placeholder = "Search Utility Expenses..."/>
          <input class="row" style="colspan:6;align:center;" type="submit" name="submit" id="submit" value="Search">
          </form>
            
            <hr style="border: 1px solid black;width:95%;">
            <h1 style ="position:relative;left:30px;top:2px;font-size:40px">Dashboard</h1>
			
				<div class="row">
				  <div class="column">
					<h3>Salary Expense</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" style = "text-align:right ; font-size:11px" id="daily" name="daily" placeholder="650000" disabled>
						  </div>
						  
						  
						</div>
					
					
				  </div>
				  
				  <div class="column">
					<h3>Total Monthly Expense</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" style = "text-align:right ; font-size:11px" id="weekly" name="weekly" placeholder="800000" disabled>
						  </div>
						  
						  
						</div>
					
					
				  </div>
				 
				  
				</div>
			
			
			
			
			</div> 
            
         
    </body>  
</html> 