<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="util.DBConnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Update Utility Expense</title>
		
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
				String sql="select * from UtilityExpense";
				db.rs=db.st.executeQuery(sql);
				while(db.rs.next())
				{
		%>
            
                <h2>Update Utility Expense Details</h2> 
                <hr class="second-hr"><br>
				<form class="newCustomer" method="POST" action="./updateUtilExp">
				
				<div class="row">
					  <div class="col-lbl">
						<label for="fname">Utility Expense Id</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="uid" value=<%=db.rs.getString("uid") %> readonly>
					  </div>
					</div>
				
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Description</label>
					  </div>
					  <div class="col-txt">
						<input type="text"  name="desc" value=<%=db.rs.getString("description") %>>
					  </div>
					</div>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Cost</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="cost" value=<%=db.rs.getString("cost") %>>
					  </div>
					</div>
					
					</br>
					<div class="row">
					  <input type="submit" value="Submit">
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