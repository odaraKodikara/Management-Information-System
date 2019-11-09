<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="util.DBConnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Leaves Details</title>
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
                <h2>Leave Details</h2> 
                 <hr class="second-hr"><br>
                 
                 
                 <div >
		<table id="employee" align="center" Style="width: 70%; text-align:center">
			<tr>
			
			 <div class = "leftbox">
            
            <input type = "text" placeholder = "Search..."/>
            <hr style="border: 1px solid black;width:95%;">
   
           
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Leave type</label>
					  </div>
					  <div class="col-txt">
						<input type="text" id="fname" name="fullname" placeholder="Enter Name here..">
					  </div>
					</div>
					
			<div class="row">
					  <div class="col-lbl">
						<label for="lname">Employee Name</label>
					  </div>
					  <div class="col-txt">
						<input type="text" id="name" name="conNo">
					  </div>
					</div>		
					
					
					

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Employee Id</b></th>
				<th><b>Leave Type</b></th>
				<th><b>No of Days</b></th>
				<th><b>Leave No</b></th>
				<th><b>From Date</b></th>
				<th><b>To Date</b></th>
				<th><b>Salary Cut Off Percent</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
			</tr>
		<%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from Leave");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("employee") %></td>
				<td><%=db.rs.getString("type") %></td>
				<td><%=db.rs.getString("noOfDays") %></td>
				<td><%=db.rs.getString("leaveNo") %></td>
				<td><%=db.rs.getString("fromDate") %></td>
				<td><%=db.rs.getString("toDate") %></td>
				<td><%=db.rs.getString("salaryCutOffPercent") %></td>
				<td><a href="updateLeave.jsp?u=<%=db.rs.getString("lid") %>"><input 
				onMouseOver="this.style.backgroundColor='blue'"
   				onMouseOut="this.style.backgroundColor='#757573'"
							 type="submit" value="Update"></a></td>
				<td>
					<form action="./deleteLeave" method="post">
						<input type="hidden" name="id"
							value="<%=db.rs.getString("sName") %>"> <input
							 type="submit" value="Delete">
					</form>
				</td>
			</tr>
			
			<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
</body>
</html>