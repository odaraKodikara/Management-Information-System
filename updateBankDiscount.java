package customerHandling;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customerHandling.bankDiscount;
import customerHandling.addDao;;

/**
 * Servlet implementation class updateBankDiscount
 */
@WebServlet("/updateBankDiscount")
public class updateBankDiscount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateBankDiscount() {
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
		try
		{
			//getting values
			
			String bName = request.getParameter("bank");
			String discount = request.getParameter("discount");
			
			
				try {
					bankDiscount updateBDiscountInstance = new bankDiscount();
					
					updateBDiscountInstance.setBankName(bName);
					updateBDiscountInstance.setDiscount(discount);
					
					
					addDao addd= new addDao();
					addd.updateBDiscount(updateBDiscountInstance);
					
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		response.sendRedirect("customerDiscounts.jsp");
		doGet(request, response);
	}

}
