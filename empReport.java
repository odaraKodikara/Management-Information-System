package employeeHandling;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * Servlet implementation class empReport
 */
@WebServlet("/empReport")
public class empReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public empReport() {
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
        PreparedStatement ps=null;
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
            Integer year = Integer.parseInt(request.getParameter("year"));
            Integer month = Integer.parseInt(request.getParameter("month"));
            
            //**********************************************************************
            ArrayList al1 = null;
            ArrayList pid_list1 = new ArrayList();
            String query = "select * from MonthlySalary where month="+month+" and year="+year+" ";
            //ps=conn.prepareStatement(query);
            
            //ps.setInt(1, year);
            //ps.setInt(2, month);
            
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
              al1.add(rs.getString(8));

              System.out.println("al1 :: " + al1);
              pid_list1.add(al1);
          }
            
            request.setAttribute("piList", pid_list1);
            RequestDispatcher view = request.getRequestDispatcher("/emprep.jsp");
            view.forward(request, response);
            conn.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
