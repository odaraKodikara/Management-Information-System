package manageTransportation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class AddDeliverySevlet
 */
@WebServlet("/AddDeliverySevlet")
public class AddDeliverySevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDeliverySevlet() {
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
		try {
			Integer dNo = Integer.parseInt(request.getParameter("dNo"));
			String rNo=request.getParameter("rNo");
			Integer empId = Integer.parseInt(request.getParameter("empId"));
			String date1=request.getParameter("date1"); 
			String description1=request.getParameter("description1");
			Double rate = Double.parseDouble(request.getParameter("rate"));
			Double distance = Double.parseDouble(request.getParameter("distance"));
			//Double total = Double.parseDouble(request.getParameter("total"));
		    Double total;
		    total = rate*distance;
			
			//validation
			if(rNo == "" || date1 == "" || description1 == "")
			{
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("DeliveryManagement.jsp");
			}
			else {
				
				try {
					
					Delivery newDelivery = new Delivery();
					
					newDelivery.setdNo(dNo);
					newDelivery.setrNo(rNo);
					newDelivery.setEmpId(empId);
					newDelivery.setDate1(date1);
					newDelivery.setDescription1(description1);
					newDelivery.setRate(rate);
					newDelivery.setDistance(distance);
					newDelivery.setTotal(total);
					
					
					
					DeliveryDbUtil addDelivery =new DeliveryDbUtil();
					addDelivery.addNewDelivery(newDelivery);
					
					
				}
				
				catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		catch(Exception e) {
			System.out.println(e.toString());
		}
		response.sendRedirect("DeliveryManagement.jsp");	
		doGet(request, response);
		
			}

}
