package manageSuppliers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class addQuotation
 */
@WebServlet("/addQuotation")
public class addQuotation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addQuotation() {
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
			String uPrice = request.getParameter("price");
			String uDate = request.getParameter("date");
			
			//validation
			
			if(uName == "" || uItem == "" || uPrice == "" || uDate == "")
			{
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("addQuotation.jsp");
			}	
			else
			{
				
				try {
					Quotation newQuotationInstance = new Quotation();
					
					newQuotationInstance.setSupplier(uName);
					newQuotationInstance.setItem(uItem);
					newQuotationInstance.setPrice(uPrice);
					newQuotationInstance.setDate(uDate);
					
					quotationService addq=new quotationService();
					addq.addQuotation(newQuotationInstance);
					
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
		response.sendRedirect("addQuotation.jsp");
		doGet(request, response);
	}
}

