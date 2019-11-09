package manageFinance;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import util.DBConnect;

/**
 * Servlet implementation class addUtilExp
 */
@WebServlet("/addUtilExp")
public class addUtilExp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addUtilExp() {
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
		try
		{
			//getting values
			
			//String id = request.getParameter("uid");
			String description = request.getParameter("des");
			String cost = request.getParameter("value");
			
			//validation
			
			if(description == "" || cost == "")
			{
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("utilityExpenses.jsp");
			}	
			else
			{
				
				try {
					UtillExp newUtillExpInstance = new UtillExp();
					
					//newUtillExpInstance.setUid(id);
					newUtillExpInstance.setDescription(description);
					newUtillExpInstance.setCost(cost);
					
					UtillExpDbUtill adds=new UtillExpDbUtill();
					adds.addUtillExp(newUtillExpInstance);
					
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		response.sendRedirect("utilityExpenses.jsp");
		doGet(request, response);
	}

}
