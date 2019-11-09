package customerHandling;

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
 * Servlet implementation class customerReport
 */
@WebServlet("/customerReport")
public class customerReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerReport() {
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
            String cName = request.getParameter("cname");
   //************************************************************************************************         
            ArrayList al1 = null;
            ArrayList pid_list1 = new ArrayList();
            String query = "select * from Customer where name= '"+cName+"' ";
 
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
            
            request.setAttribute("piList", pid_list1);
            RequestDispatcher view = request.getRequestDispatcher("/customerReport.jsp");
            view.forward(request, response);
            conn.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
