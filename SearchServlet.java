package manageTransportation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
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
        String username = "odara";
	    String password = "odara";
 
        Statement st;
        try {
            Class.forName(driver).newInstance();
            conn = DriverManager.getConnection(url , username, password);
            System.out.println("Connected!");
            String regNo = request.getParameter("regNo");
            String epid = request.getParameter("epid");
 
            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
            String query = "select * from Vehicle where regNo LIKE '" + regNo + "%" + "' ";
 
            System.out.println("query " + query);
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
 
            while (rs.next()) {
                al = new ArrayList();
                
              al.add(rs.getString(1));
              al.add(rs.getString(2));
              al.add(rs.getString(3));
              al.add(rs.getDouble(4));
              al.add(rs.getString(5));

              System.out.println("al :: " + al);
              pid_list.add(al);
          }
     //***********************************************************************************************************

            ArrayList al2 = null;
            ArrayList pid_list2 = new ArrayList();
            String query2 = "select eid from Employee where name LIKE '" + epid + "%" + "' ";
 
            System.out.println("query " + query2);
            st = conn.createStatement();
            ResultSet rs2 = st.executeQuery(query2);
 
            while (rs2.next()) {
                al2 = new ArrayList();
                
              al2.add(rs2.getString(1));
              //al2.add(rs2.getString(2));
              //al2.add(rs2.getString(3));
              //al2.add(rs2.getDouble(4));
              //al2.add(rs2.getString(5));
              //al2.add(rs2.getString(6));
              //al2.add(rs2.getString(7));
              //al2.add(rs2.getString(8));

              System.out.println("al :: " + al2);
              pid_list2.add(al2);
          }
            
          request.setAttribute("piList", pid_list);
          request.setAttribute("piList2", pid_list2);
          RequestDispatcher view = request.getRequestDispatcher("/DeliveryManagement.jsp");
          view.forward(request, response);
          conn.close();
          System.out.println("Disconnected!");
      } catch (Exception e) {
          e.printStackTrace();
      }
	}
	
	/** 
	   * Returns a short description of the servlet.
	   * @return a String containing servlet description
	   */
	  @Override
	  public String getServletInfo() {
	      return "Short description";
	  }

}
