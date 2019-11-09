<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Attendance Details</title>
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
					<a href="AttendanceDetails.jsp">Leave Details</a>
		            <a href="Leave.jsp">Leave Form</a>
		            <a href="LeaveDetails.jsp" class="active">Update Leave Details</a>
		            
			</div>
				
            </div>  
            
              <div class = "middlebox">
                <h2>Attendance Details</h2> 
                 <hr class="second-hr"><br>
                 
                 
                 <div >
		<table id="supplier" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>date</b></th>
				<th><b>Employee id</b></th>
				<th><b>count</b></th>
				<th><b>inTime</b></th>
				<th><b>outTime</b></th>
				<th><b>Status</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
			</tr>
			
			<%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from Attendance");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("date") %></td>
				<td><%=db.rs.getString("eid") %></td>
				<td><%=db.rs.getString("count") %></td>
				<td><%=db.rs.getString("inTime") %></td>
				<td><%=db.rs.getString("outTime") %></td>
				<td><a href="updateLeave.jsp?u=<%=db.rs.getString("eid") %>"><input 
				onMouseOver="this.style.backgroundColor='blue'"
   				onMouseOut="this.style.backgroundColor='#757573'"
							 type="submit" value="Update"></a></td>
				<td>
					<form action="./deleteLeave" method="post">
						<input type="hidden" name="id"
							value="<%=db.rs.getString("eid") %>"> <input
							 type="submit" value="Delete">
					</form>
				</td>
				
				<td>
					<input type="radio" name="status" value="">
				</td>
			</tr>
			
			<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
</body>
</html>