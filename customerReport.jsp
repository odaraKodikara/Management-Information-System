<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="util.DBConnect"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles/stylesSW2.css">
<link rel="stylesheet" type="text/css" href="styles/styles.css">
<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
<title>Customer Report</title>
</head>
<body>

		<div class="header">
			
				<img src="images/fashionbug.jpg" class="header-img">
				<a href="login.jsp"><button class="btn-login">Log Out</button></a>
				<button class="btn-page" disabled>Customer Handling</button>
				
			</div>
			
			
			<hr class="first-hr"><br>
              
            <div class = "wrapper"> 
                
				<div class="left-sticky">
			
					<a href="newCustomer.jsp" class="active">Add New Customer </a>
		            <a href="customerDiscounts.jsp">Add Discount</a>
		            <a href="customerReport.jsp">Customer Reports</a>
		            <a href="notifyCustomer.jsp">Notify Customers</a>
		            
			</div>
				
            </div>  
              
            <div class = "middlebox"> 
                <h2>Customer Summary</h2> 
                <hr class="second-hr"><br>
				
				<form class="newCustomer" method="post" action="customerReport">
					
						<label for="fname">Customer Name</label>&Tab;&Tab;&Tab;
						<input type="text" name="cname" placeholder="Enter Customer Name">
						<input class="row" type="submit" name="submit" id="submit" value="Search">
					 
				  </form> 
				  <%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select count(*) from Customer");
				while(db.rs.next())
				{
		%>
			
				<form>
			
				  <div class="column">
					<h3>Total Number of Customers</h3>
					<hr><br>
					
						<div class="row">
						  <div class="col-lbl">
						  </div>
						  <div class="col-txt">
							<input type="text" id="daily" name="daily" placeholder="" value="<%=db.rs.getInt(1) %>" readonly>
						  </div>
						  
						  
						</div>
					
					
				  </div>
				  </form>
		<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
				  
<!-- ****************************************************************************************************************** -->
<br><br><br></br>
<div >
		<table id="supplier" align="center" Style="width: 70%; text-align:center">
			<tr>

			</tr>
			<tr bgcolor="#f2f2f2">
				<th><b>Customer ID</b></th>
				<th><b>Customer Name</b></th>
				<th><b>Contact No</b></th>
				<th><b>Address</b></th>
				<th><b>Gender</b></th>
				<th><b>Issued Date</b></th>
				<th><b>Discount</b></th>
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
				
				<td>
					<form action="deleteCustomer" method="post">
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

			<%
			try
			{
				DBConnect db = new DBConnect();
				db.rs = db.st.executeQuery("select * from Customer");
				while(db.rs.next())
				{
		%>

			<tr>
				<td><%=db.rs.getString("cid") %></td>
				<td><%=db.rs.getString("name") %></td>
				<td><%=db.rs.getString("contactNo") %></td>
				<td><%=db.rs.getString("address") %></td>
				<td><%=db.rs.getString("gender") %></td>
				<td><%=db.rs.getString("date") %></td>
				<td><%=db.rs.getString("discount") %></td>
				<td>
					<form action="./deleteCustomer" method="post">
						<input type="hidden" name="id"
							value="<%=db.rs.getString("cid") %>"> <input
							 type="submit" value="Delete">
					</form>
				</td>
			</tr>
			
			<%
		}
			
		}catch(Exception e){
			
		}
	
	%>
            
      
            <%            }
            %>
			</div>
			
				
            </div>

</body>
</html>