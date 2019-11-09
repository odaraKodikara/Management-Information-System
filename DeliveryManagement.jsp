<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@page import="util.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<link type="text/css" rel="stylesheet" href="styles/style.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Delivery Management</title>
</head>


<body>

		<div class="header">
			
				<img src="images/fashionbug.jpg" class="header-img">
				<a href="login.jsp"><button class="btn-login">Log Out</button></a>
				<button class="btn-page" disabled>Transportation</button>
				 
     
     
     
     
     
     
        </div>
	
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="#" class="active" onclick="window.location.href='vehicleManagement.jsp'">Vehicle Management </a>
		            <a href="#" onclick="window.location.href='DeliveryManagement.jsp'">Delivery Management</a>
		            <a href="#" onclick="window.location.href='reports.jsp'">Reports</a>
		            
		            
			</div>
				
            </div>  
               
            <div class = "middlebox">
            
            	 <h1 align="center" style ="font-size:40px">Delivery Management</h1>
            <hr style="border: 1px solid black;width:95%">
          
            
    		<form method="post" name="frm" action="SearchServlet">
      <table border="0" width="300" align="center" bgcolor="#e9f">
        <tr><td colspan=2 style="font-size:12pt;" align="center">
        <h3>Search Vehicle Registration Number </h3></td></tr>
        <tr><td ><b>Vehicle Registration Number:</b></td>
          <td><input  type="text" name="regNo">
        </td></tr>        
        <tr><td colspan=2 align="center">
        <input  type="submit" name="submit" value="Search"></td></tr>
      </table>
    </form>
    
    <table width="700px" align="center"
               style="border:1px solid #000000;">
            <tr>
                <td colspan=4 align="center"
                    style="background-color:teal">
                    <b></b></td>
            </tr>
            <tr style="background-color:lightgrey;">
                <td><b>Vehicle Registration Number</b></td>
                
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
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
            %>
            <tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                
            </tr>
            <%
                    }
                }
                if (count == 0) {
            %>
            <tr>
                <td colspan=4 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            }
            %>
        </table>
        
        <form method="post" name="frm" action="SearchServlet">
      <table border="0" width="300" align="center" bgcolor="#e9f">
        <tr><td colspan=2 style="font-size:12pt;" align="center">
        <h3>Search Employee Name </h3></td></tr>
        <tr><td ><b>Employee Name:</b></td>
          <td><input  type="text" name="epid">
        </td></tr>        
        <tr><td colspan=2 align="center">
        <input  type="submit" name="submit" value="Search"></td></tr>
      </table>
    </form>
    
    <table width="700px" align="center"
               style="border:1px solid #000000;">
            <tr>
                <td colspan=4 align="center"
                    style="background-color:teal">
                    <b></b></td>
            </tr>
            <tr style="background-color:lightgrey;">
                <td><b>Employee ID</b></td>
                
            </tr>
            <%
                int c = 0;
                String col = "#F9EBB3";
                if (request.getAttribute("piList2") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList2");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
            %>
            <tr style="background-color:<%=col%>;">
                <td><%=pList.get(0)%></td>
                
            </tr>
            <%
                    }
                }
                if (count == 0) {
            %>
            <tr>
                <td colspan=4 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            }
            %>
        </table>
            
			<form action="AddDeliverySevlet" method="POST">
	  
	    <div class="form">
    	<label>Delivery Number: </label>
    	<input type="text" name="dNo"/><br><br>
    	<label>Vehicle Registration Number:</label>
        <input type="text" name="rNo"/><br><br> 
    	<label>Employee Id:</label>
         <input type="text" name="empId"/><br><br>
    	<label>Date:</label>
    	 <input type="date" name="date1"/><br><br>
    	<label>Description:</label>
    	 <input type="text" name="description1"/><br><br>
    	<label>Rate per 1km:</label>
    	 <input type="text" name="rate"/><br><br>
    	<label>Distance:</label>
    	 <input type="text" name="distance"/><br><br>
    	<!-- <label>Total:</label>
    	 <input type="text" name="total"/><br><br> -->
    	 

    	<button type="submit" class="btn-login">CALCULATE</button> <br><br>
    	
    	  <div id="container">
     
          <div id="content">
              
              <table  id="supplier" align="center" Style="width: 100%; text-align:center">
              
                 <tr bgcolor="#f2f2f2">
                    <th>Delivery Number</th>
                    <th>Registration No</th>
                    <th>Employee Id</th>
                    <th>Date</th>
                     <th>Description</th>
                     <th>Rate</th>
                     <th>Distance</th>
                     <th>Total</th>
                 </tr>
                 <%
			try
			{
			    DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from Delivery");
				while(db.rs.next())
				{
		%>

			<tr>
			    <td><%=db.rs.getInt("dNo") %></td>
				<td><%=db.rs.getString("rNo") %></td>
				<td><%=db.rs.getInt("empId") %></td>
				<td><%=db.rs.getString("date1") %></td>
				<td><%=db.rs.getString("description1") %></td>
				<td><%=db.rs.getDouble("rate") %></td>
				<td><%=db.rs.getDouble("distance") %></td>
				<td><%=db.rs.getDouble("total") %></td>
				

			</tr>
			
			<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
                 
                 
                 
                 
                 
              </table>
              
          </div>
     </div>
   		
   		
   		</div>
   	  </form>
 		</div>
            </div>
            
            </body>
            </html>