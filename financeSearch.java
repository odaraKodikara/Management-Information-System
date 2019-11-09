package manageFinance;

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
 * Servlet implementation class financeSearch
 */
@WebServlet("/financeSearch")
public class financeSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public financeSearch() {
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
            String query = "select * from UtilityExpense where description='" + pid + "' ";
 
            System.out.println("query " + query);
            st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
 
            while (rs.next()) {
                al = new ArrayList();
                
              al.add(rs.getString(1));
              al.add(rs.getString(2));
              al.add(rs.getString(3));

              System.out.println("al :: " + al);
              pid_list.add(al);
          }

          request.setAttribute("piList", pid_list);
          RequestDispatcher view = request.getRequestDispatcher("/financeSearch.jsp");
          view.forward(request, response);
          conn.close();
          System.out.println("Disconnected!");
      } catch (Exception e) {
          e.printStackTrace();
      }
        
	}

}
