package manageInventory;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class updateItemServlet
 */
@WebServlet("/updateItemServlet")
public class updateItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try
		{
			//getting values
			
			String name = request.getParameter("name");
			String category = request.getParameter("category");
			int quantity=Integer.parseInt(request.getParameter("quantity"));
			int maxCost=Integer.parseInt(request.getParameter("maxCost"));
			int unitPrice=Integer.parseInt(request.getParameter("unitPrice"));
			
				try {
					Item newitem = new Item();

					newitem.setName(name);
					newitem.setCategory(category);
					newitem.setQuantity(quantity);
					newitem.setMaxCost(maxCost);
					newitem.setUnitPrice(unitPrice);
					
					Controller up=new Controller();
					up.updateItem(newitem);
					
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		response.sendRedirect("addItem.jsp");
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
