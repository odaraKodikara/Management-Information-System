<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Profile</title>
		
	</head>

	<body>
	
			<%@include file="/header.jsp" %> 
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="financeDashboard.jsp">Dashboard</a>
		            <a href="financeProfile.jsp">Profile</a>
		            <a href="financePastReports.jsp">Past Reports</a>
		            <a href="financeMonthReport.jsp" class="active">Current Month Report</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox"> 
            <% String id=request.getParameter("u");%>
            <%
           
			try
			{
				DBConnect db = new DBConnect();
				String sql="select * from users where userid = 5";
				db.rs=db.st.executeQuery(sql);
				while(db.rs.next())
				{
		%>  
                <h2>Profile</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" method="POST" action="./updateProfile">
				
				<div class="row">
					  <div class="col-lbl">
						<label for="fname">Profile ID</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="uid" value=<%=db.rs.getString("userId") %> readonly>
					  </div>
					</div>
				
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Username</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="uname" value=<%=db.rs.getString("username")%>>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Password</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="pass" value=<%=db.rs.getString("password") %>>
					  </div>
					</div>	
					<br>
					<div class="row">
					  <input type="submit" value="Update">
					</div>
				  </form>
				  
				  <br><br>
				  		  
				  <%
		}
			
		}catch(Exception e){
			
		}
	
	%>
				 </div> 
</body>
</html>