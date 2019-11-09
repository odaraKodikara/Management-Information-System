<%@ page import="java.util.*" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
 
<html>
    <head>
    <link rel="stylesheet" type="text/css" href="styles/styles.css">
		<meta name="viewport" content="width=device-width,height=device-height, initial-scale=1.0, shrink-to-fit=no">
		<title>Search Results</title>
    </head>
    <body style="background-color:#cac8b7;">
    
    <br><br><br>	
   <a href="financeDashboard.jsp"><button class="btn-login">Back</button></a>
        <table width="1000px" align="center"
               style="border:1px solid #000000;">
            <tr>
                <td colspan=6 align="center"
                    style="background-color:#ffbabc">
                    <b>Finance Records</b></td>
            </tr>
            <tr style="background-color:lightgrey;">
                <td><b>uid</b></td>
                <td><b>Description</b></td>
                <td><b>Cost</b></td>
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
            
				<tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
            </tr>
            <%
                    }
                }
                if (count == 0) {
            %>
            <tr>
                <td colspan=6 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            }
            %>
        </table>
      
    </body>
</html>