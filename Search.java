package manageSuppliers;

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
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
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
            String pid = request.getParameter("pid");
 
            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
            String query = "select * from Supplier where sName LIKE '" + pid + "%" + "' ";
 
            System.out.println("query " + query);
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
 
            while (rs.next()) {
                al = new ArrayList();
                

              al.add(rs.getString(1));
              al.add(rs.getString(2));
              al.add(rs.getString(3));
              al.add(rs.getString(4));

              System.out.println("al :: " + al);
              pid_list.add(al);
          }

          request.setAttribute("piList", pid_list);
          RequestDispatcher view = request.getRequestDispatcher("/searchview.jsp");
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
