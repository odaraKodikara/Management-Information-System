<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Supplier Suggestions</title>
</head>
<body>
<%@include file="/header.jsp" %> 
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="supplierDashboard.jsp">Dashboard</a>
		            <a href="addSupplier.jsp">Supplier Details</a>
		            <a href="addQuotation.jsp" class="active">Quotation Details</a>
		            <a href="addOrder.jsp">Order Details</a>
		            <a href="shReports.jsp">Reports</a>
		            <a href="suggestions.jsp">Get Best Supplier Suggestions</a>
		            
				</div>
				
            </div>  
            
            <div class = "middlebox">
	            <h2>Get best supplier suggestions from the quotations received for a given item</h2> 
	            
	            <form class="newCustomer" method="POST" action="./getSuggestion">
						<div class="row">
						  <div class="col-lbl">
							<label for="fname">Item Name</label>
						  </div>
						  <div class="col-txt">
							<input type="text"  name="item" placeholder="Enter Item name...">
							<input class="row" style="colspan:6;align:center;" type="submit" name="submit" id="submit" value="Search">
						  </div>
						</div>
				</form><br></br>
	<hr></hr><br></br>
<!-- ***************************************************************************************************************** -->

<div >
		<table id="supplier" align="center" style="width: 70%; text-align:center;background-image: linear-gradient(red, blue);">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Supplier Name</b></th>
				<th><b>Cumulative Rank</b></th>
			</tr>

			<%
                int count2 = 0;
                String color2 = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count2 % 2) == 0) {
                            color2 = "#ffdbe4";
                        }
                        count2++;
                        ArrayList pList = (ArrayList) itr.next();
            %>

			<tr>
				<td><%=pList.get(0)%></td>
				<td><%=pList.get(1)%></td>
			</tr>
	 <%
                    }
                }
                if (count2 == 0) {
            %>
            <tr>
                <td colspan=4 align="center"
                    style="background-color:#eeffee"><b>No Suggestions Yet..</b></td>
            </tr>
            <%            }
            %>
			</table>
				
</div>
</div>
</body>
</html>