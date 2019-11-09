<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Employee Salary</title>
		
	</head>

	<body>
	
			<div class="header">
			
				<img src="images/one.jpg" class="header-img">
				<a href="login.jsp"><button class="btn-login">Log Out</button></a>
				<a href="List-EmployeeReg.jsp"><button class="btn-page">Employee Handling</button></a>
				
			</div>
			
			
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="empSal.jsp" class="active">Employee Salary</a>
		            <a href="emprep.jsp">Monthly Report</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox">
            
            
            <h1 style ="position:relative;left:30px;top:2px;font-size:40px">Employee Salary</h1>
            <hr style="border: 1px solid black;width:95%;">
            
				<form class="newCustomer" action="./addSalary" method="post">
				
				<div class="row">
					  <div class="col-lbl">
						<label for="fname">Employee ID</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="eid" placeholder="Enter Employee ID">
					  </div>
					</div>
					
					<br>
				
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Month</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="month" placeholder="Enter Month">
					  </div>
					</div>
					
					<br>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Year</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="year" placeholder="Enter Year">
					  </div>
					</div>
					<br>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Basic Salary</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="bSal" placeholder="Enter the Basic Salary">
					  </div>
					</div>
					<br>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">OT Hours</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="otHrs" placeholder="Enter the OT Hours">
					  </div>
					</div>
					<br>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">OT Rate</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="otRate" placeholder="Enter the OT Rate">
					  </div>
					</div>
					<br>
					
					<div class="row">
					  <input type="submit" value="Submit">
					  <input type="reset">
					</div>
				  </form>
				  
				  <br>
				  <br>
<!-- *********************************************************************************************************************************************** -->				  
<div >
		<table id="supplier" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Employee</b></th>
				<th><b>Month</b></th>
				<th><b>Year</b></th>
				<th><b>OT Hours</b></th>
				<th><b>OT Rate</b></th>
				<th><b>OT Pay</b></th>
				<th><b>Basic Salary</b></th>
				<th><b>Final Salary</b></th>
				<th text-align="center"></th>
			</tr>	
           <br><br>
           
           <%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from MonthlySalary");
				while(db.rs.next())
				{
		%>
		
		<tr>
				<td><%=db.rs.getString("employee") %></td>
				<td><%=db.rs.getString("month") %></td>
				<td><%=db.rs.getString("year") %></td>
				<td><%=db.rs.getString("otHours") %></td>
				<td><%=db.rs.getString("otRate") %></td>
				<td><%=db.rs.getString("otPay") %></td>
				<td><%=db.rs.getString("basicSalary") %></td>
				<td><%=db.rs.getString("finalSalary") %></td>
				<td>
					<form action="./deleteSalary" method="post">
						<input type="hidden" name="id"
							value="<%=db.rs.getString("employee") %>"> <input
							 type="submit" value="Delete">
					</form>
				</td>
			</tr>
			
			<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
	</table>
	</div>
         
    </body>  
</html>