<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Leave Form</title>		
</head>
</head>
<body>
	<div class="header">
			
				<img src="images/one.jpg" class="header-img">
				<a href="login.jsp"><button class="btn-login">Log Out</button></a>
				<button class="btn-page" disabled>Attendance</button>
				
			</div>
			
			
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="attendanceForm.jsp">Add Attendance</a>
					<a href="AttendanceDetails.jsp">Attendance Details</a>
		            <a href="Leave.jsp">Leave Form</a>
		            <a href="LeaveDetails.jsp" class="active">Leave Details</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox"> 
                 <h1 style ="position:relative;left:30px;top:2px;font-size:40px">Leave form</h1>
                <hr style="border: 1px solid black;width:95%;">
                <br><br>
				<form class="newCustomer" action="#">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Employee Id</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="eid" placeholder="Enter Id..">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="type">Leave Type</label>
					  </div>
					  <div class="col-txt">
						<select name="leaveType" style="margin-left:0px" required>
						  <option value="" disabled selected>Select Type</option>
						  <option value="Normal Leave">Normal Leave</option>
						  <option value="Medical Leave">Medical Leave</option>
						</select>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="days">No of Days</label>
					  </div>
					  <div class="col-txt">
						<input type="number" name=noOfDays placeholder="Number of days">
					  </div>
					</div>
					
					
					<div class="row">
					  <div class="col-lbl">
						<label for="leave">Leave No</label>
					  </div>
					  <div class="col-txt">
						<input type="number" name="leaveNo" placeholder="Leave no" max="14">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="fDate">From Date</label>
					  </div>
					  <div class="col-txt">
						<input type="date" name="fromDate">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="tDate">To Date</label>
					  </div>
					  <div class="col-txt">
						<input type="date" name="toDate">
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="tDate">Add a attachment</label>
					  </div>
					  <div class="col-txt">
						<input type="file" name="pic" style="margin-top:10px" accept="image/*">
					  </div>
					</div>

					<div class="row">
					  <div class="col-lbl">
						<label for="cutOff">Salary Cut Off Percent</label>
					  </div>
					  <div class="col-txt">
						<input type="number" name="salCutOff" placeholder="Enter salary cut">
					  </div>
					</div>
					
					<br><br>
					<tr>
               					<td><label></label></td>
               					<td><input type="submit" value="Save & Approved" class="save" /></td>
               				</tr>
               				<br><br>
				  </form>
				
<br><br><br>

            </div> 
            
</body>
</html>