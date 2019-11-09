package manageSuppliers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBConnect;

/**
 * Servlet implementation class getSuggestion
 */
@WebServlet("/getSuggestion")
public class getSuggestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getSuggestion() {
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
		Connection conn = null;
		try {
			conn=DBConnect.getDBConnection();
			Statement st;
			String supplier,cRank;
			int maxCost=0;
			int count = 0;
			int totalRank=0;
			float cumRank;
			int pricePerItem=0;
			ArrayList<String> arr=null;
			ArrayList pid_list = new ArrayList();
			String item=request.getParameter("item");
			
			String query1 = "select supplier from Quotation where itemName= '"+item+"'";
			String query2 = "select maxCost from Item where name= '"+item+"'";
			String query3,query4,query5;
			
			//*******************************************************************
            st = conn.createStatement();
            ResultSet rs1=st.executeQuery(query2);
            while(rs1.next()) {
            	maxCost=rs1.getInt(1);
            }
            //*******************************************************************
   
            ResultSet rs2 = st.executeQuery(query1);
            while (rs2.next()) {
            	for(int i=1;i<=5;i++) {
            	supplier=new String(rs2.getString(i));
            	
            	query3="select pricePerItem from Quotation where supplier='"+supplier+"'";
            	ResultSet rs3=st.executeQuery(query3);
            	while(rs3.next()) {
            		pricePerItem=rs3.getInt(1);
            	}
            	
            	if(pricePerItem<maxCost) {
	            		query4="select count(oid) from Orders where supplier='"+supplier+"'";
	            		ResultSet rs4=st.executeQuery(query4);
	            		while(rs4.next()) {
	            			count=rs4.getInt(1);
	            		}
	            		
	            		query5="select sum(rank) from Orders where supplier='"+supplier+"'";
	            		ResultSet rs5=st.executeQuery(query5);
	            		while(rs5.next()) {
	            			totalRank=rs5.getInt(1);
	            		}
	            		
	            		cumRank=((float)totalRank/count);
	            		
	            		cRank= new String(Float.toString(cumRank));
	            		
	            		arr=new ArrayList<String>();
	            		
	            		arr.add(supplier);
	            		arr.add(cRank);
	            		
	            		System.out.println("arr :: " + arr);
	                    pid_list.add(arr);
	            		
	            		request.setAttribute("piList", pid_list);
	                    RequestDispatcher view = request.getRequestDispatcher("/suggestions.jsp");
	                    view.forward(request, response);
	                    
            		
            	}
                

            
          }
            
            conn.close();
            System.out.println("Disconnected!");
            }	
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	  public String getServletInfo() {
	      return "Short description";
	  }

}
