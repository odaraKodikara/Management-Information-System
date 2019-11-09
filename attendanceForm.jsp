<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Attendance Form</title>
		
	</head>

	<body>
	
			<div class="header">
			
				<img src="images/one.jpg" class="header-img">
				<a href="login.jsp"><button class="btn-login">Log Out</button></a>
				<button class="btn-page" disabled>Employee Handling</button>
				
			</div>
			
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="attendanceForm.jsp">Add Attendance</a>
					<a href="AttendanceDetails.jsp">Leave Details</a>
		            <a href="Leave.jsp">Leave Form</a>
		            <a href="LeaveDetails.jsp" class="active">Update Leave Details</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox">
            
            <input type = "text" placeholder = "Search..."/>
            <hr style="border: 1px solid black;width:95%;">
            <h1 style ="position:relative;left:30px;top:2px;font-size:40px">Attendance Form</h1>
            
				<form class="newCustomer" action="./addAttendance" method="post">
				
				<div class="row">
					  <div class="col-lbl">
						<label for="fname">Employee ID</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="eid" placeholder="Enter Month">
					  </div>
					</div>
					
					<br>
				
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Date</label>
					  </div>
					  <div class="col-txt">
						<input type="date" name="date" placeholder="Enter Month">
					  </div>
					</div>
					
					<br>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Count</label>
					  </div>
					  <div class="col-txt">
						<input type="number" name="count" placeholder="Enter the Year">
					  </div>
					</div>
					<br>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">In Time</label>
					  </div>
					  <div class="col-txt">
						<input type="time" name="inTime" placeholder="Enter the Basic Salary">
					  </div>
					</div>
					<br>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Out Time</label>
					  </div>
					  <div class="col-txt">
						<input type="time" name="outTime" placeholder="Enter the OT Hours">
					  </div>
					</div>
					<br>
					
					<div class="row">
					  <input type="submit" value="Submit">
					</div>
				  </form>
				  
				  <br>
				  <br>
<!-- *********************************************************************************************************************************************** -->				  

           <br><br>
         

</body>
</html>