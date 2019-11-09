package manageSuppliers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Report
 */
@WebServlet("/Report")
public class Report extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Report() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        String url = "jdbc:sqlserver://localhost:1433;databaseName=FashionBug";
        String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
        String userName = "odara";
        String password = "odara";
 
        Statement st;
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url , userName, password);
            System.out.println("Connected!");
            String fDate = request.getParameter("fromDate");
            String tDate = request.getParameter("toDate");
 //-----------------------------------------------------------------------------------------------------------------         
            int sum1 = 0;
            String sumQuery1 = "select sum(cost) from Orders where rank between 1 and 3 and date between '"+fDate+"' and '"+tDate+"'";
 
            System.out.println("sumquery1 " + sumQuery1);
            st = conn.createStatement();
            ResultSet srs1 = st.executeQuery(sumQuery1);
 
            while (srs1.next()) {
                
              sum1=srs1.getInt(1);
         
              System.out.println("sum1 :: " + sum1);
          }
 //-----------------------------------------------------------------------------------------------------------
            
            int sum2 = 0;
            String sumQuery2 = "select sum(cost) from Orders where rank=4 and date between '"+fDate+"' and '"+tDate+"'";
 
            System.out.println("sumquery2 " + sumQuery2);
            st = conn.createStatement();
            ResultSet srs2 = st.executeQuery(sumQuery2);
 
            while (srs2.next()) {
                
              sum2=srs2.getInt(1);
         
              System.out.println("sum2 :: " + sum2);
          }
 //-----------------------------------------------------------------------------------------------------------
            ArrayList al1 = null;
            ArrayList pid_list1 = new ArrayList();
            String query = "select * from Orders where rank between 1 and 3 and date between '"+fDate+"' and '"+tDate+"'";
 
            System.out.println("query1 " + query);
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
 
            while (rs.next()) {
                al1 = new ArrayList();
                
              al1.add(rs.getString(1));
              al1.add(rs.getString(2));
              al1.add(rs.getString(3));
              al1.add(rs.getString(4));
              al1.add(rs.getString(5));
              al1.add(rs.getString(6));
              al1.add(rs.getString(7));

              System.out.println("al1 :: " + al1);
              pid_list1.add(al1);
          }
            ArrayList al2 = null;
            ArrayList pid_list2 = new ArrayList();
            String query2 = "select * from Quotation where date between '"+fDate+"' and '"+tDate+"'";
            
            System.out.println("query2 " + query2);
            ResultSet rs2 = st.executeQuery(query2);
            
            while (rs2.next()) {
                al2 = new ArrayList();
                
              al2.add(rs2.getString(1));
              al2.add(rs2.getString(2));
              al2.add(rs2.getString(3));
              al2.add(rs2.getString(4));
              al2.add(rs2.getString(5));

              System.out.println("al2 :: " + al2);
              pid_list2.add(al2);
          }
            
            ArrayList al3 = null;
            ArrayList pid_list3 = new ArrayList();
            String query3 = "select * from Orders where rank=4 and date between '"+fDate+"' and '"+tDate+"'";
            
            System.out.println("query3 " + query3);
            ResultSet rs3 = st.executeQuery(query3);
            
            while (rs3.next()) {
                al3 = new ArrayList();
                
              al3.add(rs3.getString(1));
              al3.add(rs3.getString(2));
              al3.add(rs3.getString(3));
              al3.add(rs3.getString(4));
              al3.add(rs3.getString(5));
              al3.add(rs3.getString(6));
              al3.add(rs3.getString(7));

              System.out.println("al3 :: " + al3);
              pid_list3.add(al3);
          }

          request.setAttribute("piList", pid_list1);
          request.setAttribute("piList2", pid_list2);
          request.setAttribute("piList3", pid_list3);
          request.setAttribute("sum1", sum1);
          request.setAttribute("sum2", sum2);
          RequestDispatcher view = request.getRequestDispatcher("/shReports.jsp");
          view.forward(request, response);
          conn.close();
          System.out.println("Disconnected!");
      } catch (Exception e) {
          e.printStackTrace();
      }
	}

}
