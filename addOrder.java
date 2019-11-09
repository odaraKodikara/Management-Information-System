package manageSuppliers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class addOrder
 */
@WebServlet("/addOrder")
public class addOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addOrder() {
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
			
			String uName = request.getParameter("sname");
			String uItem = request.getParameter("item");
			String uQty = request.getParameter("qty");
			String uCost = request.getParameter("cost");
			String uDate = request.getParameter("date");
			String uRank = request.getParameter("rank");
			
			//validation
			
			if(uName == "" || uItem == "" || uQty == "" || uCost == "" || uDate == "" || uRank == "")
			{
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("addOrder.jsp");
			}	
			else
			{
				
				try {
					Order newOrderInstance = new Order();
					
					newOrderInstance.setSupplier(uName);
					newOrderInstance.setItem(uItem);
					newOrderInstance.setQuantity(uQty);
					newOrderInstance.setCost(uCost);
					newOrderInstance.setDate(uDate);
					newOrderInstance.setRank(uRank);
					
					orderService addo=new orderService();
					addo.addOrder(newOrderInstance);
					
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
		response.sendRedirect("addOrder.jsp");
		doGet(request, response);
	}

}