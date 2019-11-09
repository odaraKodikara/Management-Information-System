
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html>
<html> 
<head>
		<meta charset="ISO-8859-1">
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<link rel="stylesheet" type="text/css" href="styles/addEmployee.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Employee Details</title>
	
		<link rel="stylesheet" type="text/css" href="styles/sstyles.css">
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
                <h2>Details</h2> 
                 <hr class="second-hr"><br>
		
		<!-- ************************************************************************************************************************************************ -->

<div >
		<table id="employee" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>NIC</b></th>
				<th><b>Employee Name</b></th>
				<th><b>Phone</b></th>
				<th><b>Joined Date</b></th>
				<th><b>Position</b></th>
				<th><b>Basic Salary</b></th>
				<th><b>Leave Limit</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
			</tr>

			<%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from Employee");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("nic") %></td>
				<td><%=db.rs.getString("name") %></td>
				<td><%=db.rs.getString("phone") %></td>
				<td><%=db.rs.getString("regiteredDate") %></td>
				<td><%=db.rs.getString("position") %></td>
				<td><%=db.rs.getString("basicSalary") %></td>
				<td><%=db.rs.getString("leaveLimit") %></td>
				<td><a href="updateEmployee.jsp?u=<%=db.rs.getString("eid") %>"><input 
				onMouseOver="this.style.backgroundColor='blue'"
   				onMouseOut="this.style.backgroundColor='#757573'"
							 type="submit" value="Update"></a></td>
				<td>
					<form action="deleteEmployee" method="post">
						<input type="hidden" name="eid"
							value="<%=db.rs.getString("eid") %>"> <input
							 type="submit" value="Delete">
					</form>
				</td>
			</tr>
			
			<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
			</div>
			
		</div>
	

</body>


</html>


