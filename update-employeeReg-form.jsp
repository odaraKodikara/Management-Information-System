<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Update Employee</title>
</head>
<body>

		<div class="header">
			
				<img src="images/fashionbug.jpg" class="header-img">
				<button class="btn-login">Log Out</button>
				<button class="btn-page" disabled>Employee Profile</button>
				
			</div>
			
			
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="#" class="active">Employee Home</a>
		            <a href="#">Add New Employee</a>
		            <a href="#">Employee Attendance </a>
		            <a href="#">Employee Salary </a>
		            <a href="#">Employee Details</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox">
                <h2>Update Employee Details</h2> 
                 <hr class="second-hr"><br>
				
               <form action="EmployeeRegControllerServlet" method="GET">
               	
               		<input type="hidden" name="command" value="UPDATE">
               		
               		<input type="hidden" name="employeeRegId" value="${THE_EMPLOYEEREG.id}"/>
               		
               		<table>
               			<tbody>
               				<tr>
               					<td><label>Full name:</label></td>
               					<td><input type="text" name="name"
               								value="${THE_EMPLOYEEREG.name}"/></td>
               				</tr>
               				
               				<tr>
               					<td><label>NIC:</label></td>
               					<td><input type="text" name="nic"
               								value="${THE_EMPLOYEEREG.nic}"/></td>
               				</tr>
               				
               				<tr>
               					<td><label>Phone:</label></td>
               					<td><input type="tel" name="phone"
               								value="${THE_EMPLOYEEREG.phone}"/></td>
               				</tr>
               				
               				<tr>
               					<td><label>Email:</label></td>
               					<td><input type="email" name="email"
               								value="${THE_EMPLOYEEREG.email}"/></td>
               				</tr>
               				
               				<tr>
               					<td><label>Basic Salary:</label></td>
               					<td><input type="text" name="basicSalary"
               								value="${THE_EMPLOYEEREG.basicSalary}"/></td>
               				</tr>
               				
               				<tr>
               					<td><label>Leave Limit:</label></td>
               					<td><input type="number" name="leaveLimit"
               								value="${THE_EMPLOYEEREG.leaveLimit}"/></td>
               				</tr>
               				
               				<tr>
               					<td><label>Date of join:</label></td>
               					<td><input type="text" name="registeredDate"
               								value="${THE_EMPLOYEEREG.registeredDate}"/></td>
               				</tr>
               				
               				<tr>
               					<td><label></label></td>
               					<td><input type="submit" value="Save" class="save" /></td>
               				</tr>
               				
               			</tbody>
               		</table>
               	
               </form>
        
            </div> 

</body>
</html>