<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="util.DBConnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Update Employee</title>
		
	</head>

	<body>
	
			<%@include file="/header.jsp" %> 
              
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
            <% String id=request.getParameter("u");%>
            <%
           
			try
			{
				DBConnect db = new DBConnect();
				String sql="select * from Employee";
				db.rs=db.st.executeQuery(sql);
				while(db.rs.next())
				{
		%>
            
                <h2>Update Employee Details</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" method="POST" action="./updateEmployee">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Employee Id</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="eid" value=<%=db.rs.getString("eid") %> readonly>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Position</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="position" value=<%=db.rs.getString("position") %> required>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Basic Salary</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="basicSal" value=<%=db.rs.getString("basicSalary") %> required>
					  </div>
					</div>
					
					</br>
					<div class="row">
					  <input type="submit" value="Submit">
					</div>
				  </form>
				  
				  <%
		}
			
		}catch(Exception e){
			
		}
	
	%>

				 </div> 
</body>
</html>