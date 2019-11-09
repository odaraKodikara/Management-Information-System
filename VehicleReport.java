package manageTransportation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VehicleReport
 */
@WebServlet("/VehicleReport")
public class VehicleReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleReport() {
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
//-------------------------------------------------------------
            int sum1 = 0;
            String sumQuery1 = "select count(dNo) from Delivery where date1 between '"+fDate+"' and '"+tDate+"'";
 
            System.out.println("sumquery1 " + sumQuery1);
            st = conn.createStatement();
            ResultSet srs1 = st.executeQuery(sumQuery1);
 
            while (srs1.next()) {
                
              sum1=srs1.getInt(1);
         
              System.out.println("sum1 :: " + sum1);
          }
//--------------------------------------------------------------------------		
            int sum2 = 0;
            String sumQuery2 = "select sum(total) from Delivery where date1 between '"+fDate+"' and '"+tDate+"'";
 
            System.out.println("sumquery2 " + sumQuery2);
            st = conn.createStatement();
            ResultSet srs2 = st.executeQuery(sumQuery2);
 
            while (srs2.next()) {
                
              sum2=srs2.getInt(1);
         
              System.out.println("sum2 :: " + sum2);
          }
//-------------------------------------------------------------------------
            int sum3 = 0;
            String sumQuery3 = "select sum(distance) from Delivery where date1 between '"+fDate+"' and '"+tDate+"'";
 
            System.out.println("sumquery3 " + sumQuery3);
            st = conn.createStatement();
            ResultSet srs3 = st.executeQuery(sumQuery3);
 
            while (srs3.next()) {
                
              sum3=srs3.getInt(1);
         
              System.out.println("sum3 :: " + sum3);
          }
//---------------------------------------------------------------------------------
            request.setAttribute("sum1", sum1);
            request.setAttribute("sum2", sum2);
            request.setAttribute("sum3", sum3);
            RequestDispatcher view = request.getRequestDispatcher("/reports.jsp");
            view.forward(request, response);
            conn.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        } 
		
		
	}

}

