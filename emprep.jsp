<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@page import="util.DBConnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Employee Salary Reports</title>
		
	</head>

	<body>
	
			<div class="header">
			
				<img src="images/one.jpg" class="header-img">
				<a href="login.jsp"><button class="btn-login">Log Out</button></a>
				<a href="List-EmployeeReg.jsp"><button class="btn-page">Employee Handling</button></a>
				
			</div>
			
			
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="empSal.jsp">Employee Salary</a>
					<a href="emprep.jsp">Employee Salary Report</a>
			</div>
				
            </div>  
              
            <div class = "middlebox">            
            
            <h1 style ="position:relative;left:30px;top:2px;font-size:40px">Employee Salary Reports</h1>
            <hr style="border: 1px solid black;width:95%;">
            
            
            <form method="post" name="frm" action="empReport">
	            <p style ="position:realtive;margin-left:30px;top:3px"><b>Select :</b></p>
	        	<select style="position:absolute ; left: 570px;top: 300px;width: 150px" name="year">
	         	<option value="">Year</option>
	         	<option value="2019">2019</option>
	         	<option value="2018">2018</option>
	         	<option value="2017">2017</option>
	         	<option value="2016">2016</option>
	         	<option value="2015">2015</option>
	         	<option value="2014">2014</option>
	         	<option value="2013">2013</option>
	         	<option value="2012">2012</option>
	         	<option value="2011">2011</option>
	         	<option value="2010">2010</option>
	         	<option value="2009">2009</option>
	         	<option value="2008">2008</option>
	         	<option value="2007">2007</option>
	         	<option value="2006">2006</option>
	         	<option value="2005">2005</option>
	         	<option value="2004">2004</option>
	         	<option value="2003">2003</option>
	         	<option value="2002">2002</option>
	         	<option value="2001">2001</option>
	         	<option value="2000">2000</option>
				</select>
		 		<select style= "position:absolute ; left: 750px; top: 300px;width: 150px" name="month">
	        	<option value="">Month</option>
	        	<option value="1">January</option>
	   			<option value="2">February</option>
	   			<option value="3">March</option>
	   			<option value="4">April</option>
	   			<option value="5">May</option>
	   			<option value="6">June</option>
	   			<option value="7">July</option>
	   			<option value="8">August</option>
	   			<option value="9">September</option>
	   			<option value="10">October</option>
	   			<option value="11">November</option>
	   			<option value="12">December</option>
				</select>
			<input class="row" style="position:relative;right:500px;top:-8px;" type="submit" name="submit" id="submit" value="Search">
			</form>
			
			
			<br></br>
			<br></br>
			
			<table id="supplier" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Month</b></th>
				<th><b>Year</b></th>
				<th><b>Employee ID</b></th>
				<th><b>OT Hours</b></th>
				<th><b>OT Rate</b></th>
				<th><b>OT Pay</b></th>
				<th><b>Basic Salary</b></th>
				<th><b>Final Salary</b></th>
			</tr>
			
			<%
                int count = 0;
                String color = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#ffdbe4";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
            %>

			<tr>
				<td><%=pList.get(0)%></td>
				<td><%=pList.get(1)%></td>
				<td><%=pList.get(2)%></td>
				<td><%=pList.get(3)%></td>
				<td><%=pList.get(7)%></td>
				<td><%=pList.get(4)%></td>
				<td><%=pList.get(6)%></td>
				<td><%=pList.get(5)%></td>
			</tr>
			 <%
                    }
                }
                if (count == 0) {
            %>
            <%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from MonthlySalary");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("month") %></td>
				<td><%=db.rs.getString("year") %></td>
				<td><%=db.rs.getString("employee") %></td>
				<td><%=db.rs.getString("otHours") %></td>
				<td><%=db.rs.getString("otRate") %></td>
				<td><%=db.rs.getString("otPay") %></td>
				<td><%=db.rs.getString("basicSalary") %></td>
				<td><%=db.rs.getString("finalSalary") %></td>
			</tr>
			
			<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
            
            <%            }
            %>
			
		</table>
      </div>   
    </body>  
</html> 