package manageInventory;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class addItem
 */
@WebServlet("/addItem")
public class addItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addItem() {
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
		// TODO Auto-generated method stub
		doGet(request, response);

		int id=Integer.parseInt(request.getParameter("id"));		
		String name=request.getParameter("name");
		String category=request.getParameter("category");
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		int maxCost=Integer.parseInt(request.getParameter("maxCost"));
		int unitPrice=Integer.parseInt(request.getParameter("unitPrice"));
	
		if( name == "" || category == "" )
		{
			JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
			response.sendRedirect("addItem.jsp");
		}	
		else
		{
			try {
					Item newitem = new Item();
					newitem.setName(name);
					newitem.setCategory(category);
					newitem.setQuantity(quantity);
					newitem.setMaxCost(maxCost);
					newitem.setUnitPrice(unitPrice);
					
					
					itemService add= new itemService();
					add.addItem(newitem);
					
		
				}
				catch(Exception e) {
					e.printStackTrace();
		
				}
			
	response.sendRedirect("addItem.jsp");
	doGet(request, response);
}

}
}
