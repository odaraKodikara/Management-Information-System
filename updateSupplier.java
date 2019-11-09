package manageSuppliers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class updateSupplier
 */
@WebServlet("/updateSupplier")
public class updateSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateSupplier() {
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
			String uMail = request.getParameter("email");
			String uPhone = request.getParameter("conNo");
			String uAddress = request.getParameter("address");
			
				try {
					Supplier newSupplierInstance = new Supplier();
					
					newSupplierInstance.setName(uName);
					newSupplierInstance.setEmail(uMail);
					newSupplierInstance.setContactNo(uPhone);
					newSupplierInstance.setAddress(uAddress);
					
					supplierService adds=new supplierService();
					adds.updateSupplier(newSupplierInstance);
					
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		response.sendRedirect("addSupplier.jsp");
		doGet(request, response);
	}

}
