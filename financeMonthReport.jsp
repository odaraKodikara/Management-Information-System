<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html>
<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Current Month Report</title>
		
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
		            <a href="financePastReports.jsp">Past Reports</a>
		            <a href="financeMonthReport.jsp" class="active">Current Month Report</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox">
            
            <input type = "text" placeholder = "Search..."/>
            <hr style="border: 1px solid black;width:95%;">
            <h1 style ="position:relative;left:30px;top:2px;font-size:40px">Current Month Report</h1> 
            
            <%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select sum(finalSalary) from MonthlySalary");
				while(db.rs.next())
				{
		%>
				<div class="row">
				  <div class="column">
					<h3>Employee Salary</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="discount" name="discount" placeholder="" value="<%=db.rs.getInt(1) %>" readonly>
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
				db.rs = db.st.executeQuery("select sum(cost) from Orders");
				while(db.rs.next())
				{
		%>
				  <div class="column">
					<h3>Total Supplier Cost</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="discount" name="discount" placeholder="" value="<%=db.rs.getInt(1) %>" readonly>
						  </div>
						  
						  
						</div>
					
					
				  </div><br>
				  <%
		}
			
		}catch(Exception e){
			
		}
	
	%> 
				  
				  
				  <div class="row">
				  <div class="column">
					<h3>Transportation Costs</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="discount" name="discount" placeholder="" value="0" readonly>
						  </div>
						  
						  
						</div>
					
					
				  </div>
				  
				  
				   <%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select sum(cost) from UtilityExpense");
				while(db.rs.next())
				{
		%>
				  <div class="column">
					<h3>Utility Expenses</h3>
					<hr><br>
					<a href="utilityExpenses.jsp"><button style= "width: 80px; height: 40px;position:absolute ; left: 1350px; top:550px" type="button"><font size="+1"><b>Edit</b></font></button></a>
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="discount" name="discount" placeholder="" value="<%=db.rs.getInt(1) %>" readonly>
						  </div>
						  
						  
						</div>
					
					
				  </div><br>
				  <%
		}
			
		}catch(Exception e){
			
		}
	
	%> 
				  
				  <div class="row">
				  <div class="column">
					<h3>Total Sales</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="discount" name="discount" placeholder="" value="1540000" readonly>
						  </div>
						  
						  
						</div>
					
					
				  </div>
				  
				  
				   <%
			try
			{
				DBConnect db = new DBConnect();
				int salaryCost=0;
				int orderCost=0;
				int utilityCost=0;
				int profit;
				db.rs = db.st.executeQuery("select sum(finalSalary) from MonthlySalary");
				while(db.rs.next())
				{
					salaryCost=db.rs.getInt(1);
				}
				
				db.rs = db.st.executeQuery("select sum(cost) from Orders");
				while(db.rs.next())
				{
					orderCost=db.rs.getInt(1);
				}
				
				db.rs = db.st.executeQuery("select sum(cost) from UtilityExpense");
				while(db.rs.next())
				{
					utilityCost=db.rs.getInt(1);
				}
				
				profit=1540000-(salaryCost+orderCost+utilityCost);
		%>
				  <div class="column">
					<h3>Profit</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="discount" name="discount" placeholder="" value="<%=profit%>" readonly>
						  </div>						  
						</div>
				  </div><br>
				</div>
			</div> 
            </div>
            <%
		
			
		}catch(Exception e){
			
		}
	
	%> 
            </div><br><br>
         
    </body>  
</html> 