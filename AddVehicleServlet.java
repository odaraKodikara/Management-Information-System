package manageTransportation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class AddVehicleServlet
 */
@WebServlet("/AddVehicleServlet")
public class AddVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddVehicleServlet() {
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
			String regNo=request.getParameter("regNo");
			String type=request.getParameter("type"); 
			String model=request.getParameter("model");
			Double price = Double.parseDouble(request.getParameter("price"));
			String insNo=request.getParameter("insNo");
			
			//validation
			if(regNo == "" || type == "" || model == "" || insNo == "")
			{
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("vehicleManagement.jsp");
			}
			else {
				
				try {
					
					Vehicle newVehicle = new Vehicle();
					
					newVehicle.setRegNo(regNo);
					newVehicle.setType(type);
					newVehicle.setModel(model);
					newVehicle.setPrice(price);
					newVehicle.setInsNo(insNo);
					
					VehicleDbUtil addVehicle =new VehicleDbUtil();
					addVehicle.addNewVehicle(newVehicle);
					
					
				}
				
				catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		catch(Exception e) {
			System.out.println(e.toString());
		}
		response.sendRedirect("vehicleManagement.jsp");	
		doGet(request, response);
	}

}
