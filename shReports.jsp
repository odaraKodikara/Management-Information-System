<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles/styles.css">
		<link rel="stylesheet" type="text/css" href="styles/styles1.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Supplier Handling Reports</title>
</head>
<body>
<%@include file="/header.jsp" %> 
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="supplierDashboard.jsp" class="active">Dashboard</a>
		            <a href="addSupplier.jsp">Supplier Details</a>
		            <a href="addQuotation.jsp">Quotation Details</a>
		            <a href="addOrder.jsp">Order Details</a>
		            <a href="shReports.jsp">Reports</a>
		            <a href="suggestions.jsp">Get Best Supplier Suggestions</a>
				</div>	
				
            </div>  
            
            <div class = "middlebox"> 
            
<!-- *********************************************************************************************** -->
<form method="post" name="frm" action="Report">
	<h3>Search By Date</h3>
	<label for="fname">From Date</label>
	<input type="date" name="fromDate" placeholder="From Date"> <br></br>
	<label for="fname">To Date</label>
	<input type="date" name="toDate" placeholder="To Date">	 
	<br>
	<input class="row" style="colspan:6;align:center;position:relative;right:1000px;" type="submit" name="submit" id="submit" value="Search">
</form>

			
<div >		
<br></br>
<h3 style ="position:relative;left:30px;top:2px;font-size:40px">Accepted Orders</h3>
<hr style="border: 1px solid black;width:95%;">

<%
                if (request.getAttribute("sum1") != null) {
                	Integer sumCost =(Integer)request.getAttribute("sum1"); 
                    System.out.println(sumCost);
            %>
				  <div class="column">
					<h3>Total Purchase</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="daily" name="daily" placeholder="" value="<%=sumCost %>"readonly>
						  </div>  
						</div>
				  </div>
				  
				  
				</div>
			<%
                } 
            %>
            
            
		<table id="supplier" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Order ID</b></th>
				<th><b>Item ID</b></th>
				<th><b>Quantity</b></th>
				<th><b>Cost</b></th>
				<th><b>Date</b></th>
				<th><b>Rank</b></th>
				<th><b>Supplier Name</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
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
				<td><%=pList.get(4)%></td>
				<td><%=pList.get(5)%></td>
				<td><%=pList.get(6)%></td>
				<td><a href="updateOrder.jsp?u=<%=pList.get(0)%>"><input 
				onMouseOver="this.style.backgroundColor='blue'"
   				onMouseOut="this.style.backgroundColor='#757573'"
							 type="submit" value="Update"></a></td>
				<td>
					<form action="deleteOrder" method="post">
						<input type="hidden" name="id"
							value="<%=pList.get(0)%>"> <input
							 type="submit" value="Delete">
					</form>
				</td>
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
		<br></br>
<!-- ******************************************************************************************************************* -->
	<h3 style ="position:relative;left:30px;top:2px;font-size:40px">Pending Orders</h3>
<hr style="border: 1px solid black;width:95%;">		
<div >
		<table id="supplier" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Supplier Name</b></th>
				<th><b>Item Name</b></th>
				<th><b>Price per item</b></th>
				<th><b>Called Date</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
			</tr>

			<%
                int count2 = 0;
                String color2 = "#F9EBB3";
                if (request.getAttribute("piList2") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList2");
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
				<td><%=pList.get(1)%></td>
				<td><%=pList.get(3)%></td>
				<td><%=pList.get(4)%></td>
				<td><%=pList.get(2)%></td>
				<td><a href="updateQuotation.jsp?u=<%=pList.get(0)%>"><input 
				onMouseOver="this.style.backgroundColor='blue'"
   				onMouseOut="this.style.backgroundColor='#757573'"
							 type="submit" value="Update"></a></td>
				<td>
					<form action="deleteQuotation" method="post">
						<input type="hidden" name="id"
							value="<%=pList.get(0)%>"> <input
							 type="submit" value="Delete">
					</form>
				</td>
			</tr>
	 <%
                    }
                }
                if (count2 == 0) {
            %>
            <tr>
                <td colspan=4 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            }
            %>
			</table>
		<br></br>
<!-- ******************************************************************************************************************* -->
	<h3 style ="position:relative;left:30px;top:2px;font-size:40px">Rejected Orders</h3>
<hr style="border: 1px solid black;width:95%;">	

<%
                if (request.getAttribute("sum2") != null) {
                	Integer sumLoss =(Integer)request.getAttribute("sum2"); 
                    System.out.println(sumLoss);
            %>
				  <div class="column">
					<h3>Total Loss</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="daily" name="daily" placeholder="" value="<%=sumLoss %>"readonly>
						  </div>  
						</div>
				  </div>
				  
				  
				</div>
			<%
                } 
            %>
<div >
		<table id="supplier" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Order ID</b></th>
				<th><b>Item ID</b></th>
				<th><b>Quantity</b></th>
				<th><b>Cost</b></th>
				<th><b>Date</b></th>
				<th><b>Rank</b></th>
				<th><b>Supplier Name</b></th>
				<th text-align="center"></th>
				<th text-align="center"></th>
			</tr>

			<%
                int count3 = 0;
                String color3 = "#F9EBB3";
                if (request.getAttribute("piList3") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList3");
                    System.out.println(al);
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count3 % 2) == 0) {
                            color3 = "#ffdbe4";
                        }
                        count3++;
                        ArrayList pList = (ArrayList) itr.next();
            %>

			<tr>
				<td><%=pList.get(0)%></td>
				<td><%=pList.get(1)%></td>
				<td><%=pList.get(2)%></td>
				<td><%=pList.get(3)%></td>
				<td><%=pList.get(4)%></td>
				<td><%=pList.get(5)%></td>
				<td><%=pList.get(6)%></td>
				<td><a href="updateOrder.jsp?u=<%=pList.get(0)%>"><input 
				onMouseOver="this.style.backgroundColor='blue'"
   				onMouseOut="this.style.backgroundColor='#757573'"
							 type="submit" value="Update"></a></td>
				<td>
					<form action="deleteOrder" method="post">
						<input type="hidden" name="id"
							value="<%=pList.get(0)%>"> <input
							 type="submit" value="Delete">
					</form>
				</td>
			</tr>
			
			 <%
                    }
                }
                if (count3 == 0) {
            %>
            <tr>
                <td colspan=4 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            }
            %>
		</table>
		<br></br>


	</div>		
</body>
</html>