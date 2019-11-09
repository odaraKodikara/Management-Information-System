package manageSuppliers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateOrder
 */
@WebServlet("/updateOrder")
public class updateOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateOrder() {
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
			
			String uOid = request.getParameter("oid");
			String uName = request.getParameter("sname");
			String uItem = request.getParameter("item");
			String uQty = request.getParameter("qty");
			String uCost = request.getParameter("cost");
			String uDate = request.getParameter("date");
			String uRank = request.getParameter("rank");
			
				try {
					Order newOrderInstance = new Order();
					
					newOrderInstance.setId(uOid);
					newOrderInstance.setSupplier(uName);
					newOrderInstance.setItem(uItem);
					newOrderInstance.setQuantity(uQty);
					newOrderInstance.setCost(uCost);
					newOrderInstance.setDate(uDate);
					newOrderInstance.setRank(uRank);
					
					orderService addo=new orderService();
					addo.updateOrder(newOrderInstance);
					
				}
				catch(Exception e) {
					e.printStackTrace();
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
