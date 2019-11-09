<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html>
<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Uility Expenses</title>
		
	</head>

	<body>
	
			<div class="header">
			
				<img src="images/one.jpg" class="header-img">
				<a href="login.jsp"><button class="btn-login">Log Out</button></a>
				<button class="btn-page" disabled>Finance</button>
				
			</div>
			
			
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="financeDashboard.jsp" class="active">Dashboard</a>
		            <a href="financeProfile.jsp">Profile</a>
		            <a href="financePastReports.jsp">Past Reports</a>
		            <a href="financeMonthReport.jsp">Current Month Report</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox">
            
            <input type = "text" placeholder = "Search..."/>
            <hr style="border: 1px solid black;width:95%;">
            <h1 style ="position:relative;left:30px;top:2px;font-size:40px">Utility Expenses</h1>
            
				<form class="newCustomer" action="./addUtilExp" method="post">
					<div class="row">
					  <div class="col-lbl">
						<label for="fname">Description</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="des" placeholder="Enter Description">
					  </div>
					</div>
					
					<br>
					
					<div class="row">
					  <div class="col-lbl">
						<label for="lname">Value</label>
					  </div>
					  <div class="col-txt">
						<input type="text" name="value" placeholder="Enter the cost">
					  </div>
					</div>
					<br>
					<div class="row">
					  <input type="submit" value="Submit">
					  <input type="reset">
					</div>
				  </form>
				  
				  <br>
				  <br>
<!-- *********************************************************************************************************************************************** -->				  
				<div >
		<table id="supplier" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Description</b></th>
				<th><b>Cost</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
			</tr>

			<%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from UtilityExpense");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("description") %></td>
				<td><%=db.rs.getString("cost") %></td>
				<td><a href="updateUtilExp.jsp?u=<%=db.rs.getString("uid") %>"><input 
				onMouseOver="this.style.backgroundColor='blue'"
   				onMouseOut="this.style.backgroundColor='#757573'"
							 type="submit" value="Update"></a></td>
				<td>
					<form action="deleteUtilExp" method="post">
						<input type="hidden" name="id"
							value="<%=db.rs.getString("uid") %>"> <input
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
           <br><br>
         
    </body>  
</html> 