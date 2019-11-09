package manageSuppliers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateQuotation
 */
@WebServlet("/updateQuotation")
public class updateQuotation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateQuotation() {
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
			
			String uQid = request.getParameter("qid");
			String uName = request.getParameter("sname");
			String uDate = request.getParameter("date");
			String uItem = request.getParameter("item");
			String uPrice = request.getParameter("price");
			
				try {
					Quotation newQuotationInstance = new Quotation();
					
					newQuotationInstance.setQid(uQid);
					newQuotationInstance.setSupplier(uName);
					newQuotationInstance.setDate(uDate);
					newQuotationInstance.setItem(uItem);
					newQuotationInstance.setPrice(uPrice);
					
					quotationService addq=new quotationService();
					addq.updateQuotation(newQuotationInstance);
					
				}
				catch(Exception e) {
					e.printStackTrace();
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
