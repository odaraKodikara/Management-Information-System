<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="util.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Add new Employee</title>
</head>
<body>

		<div class="header">
			
				<img src="images/fashionbug.jpg" class="header-img">
				<a href="login.jsp"><button class="btn-login">Log Out</button></a>
				<button class="btn-page" disabled>Employee Profile</button>
				
			</div>
			
			
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
		
		            <a href="List-EmployeeReg.jsp">Add New Employee</a>
		            <a href="AttendanceDetails.jsp">Employee Attendance </a>
		            <a href="list-employeeRegs.jsp">Employee Details</a>
		            <a href="updateEmployee.jsp">Update Employee</a>
		            <a href="empSal.jsp" class="active">Employee Salary</a>
			</div>
				
            </div>  
              
            <div class = "middlebox">
                <h2>Register New Employee</h2> 
                 <hr class="second-hr"><br>  
               
               <form class="newCustomer" method="POST" action="employeeRegServlet">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname"> FullName</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="name" placeholder="Enter fullname...">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">NIC</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="nic" placeholder="Enter nic...">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Phone</label>
					  </div>
					  <div class="col-txt">
						<input type="tel" name="phone" placeholder="xxx-xxxxxxx" pattern="[0-9]{10}" required>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Position</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="position" placeholder="Enter position recruited...">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Basic Salary</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="basicSalary" placeholder="Enter basic salary...">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Leave Limit</label>
					  </div>
					  <div class="col-txt">
						<input type="number" name="leaveLimit" placeholder="Enter leave limit...">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Date Joined</label>
					  </div>
					  <div class="col-txt">
						<input type="date" name="registeredDate" placeholder="Enter joined date...">
					  </div>
					</div>
					
					</br>
					<div class="row">
					  <input type="submit" value="Submit">
					</div>
				  </form>
               
 
            </div> 

</body>
</html>