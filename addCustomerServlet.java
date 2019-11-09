package customerHandling;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import customerHandling.addCustomer;
import util.DBConnect;

/**
 *  implementation class addCustomerServlet
 */
@WebServlet("/addCustomerServlet")
public class addCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCustomerServlet() {
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
		try {
			String fName = request.getParameter("fullname");
			String email = request.getParameter("email");
			String contNo = request.getParameter("conNo");
			String gender = request.getParameter("gender");
			String dateCreated = request.getParameter("dateCreated");
			
			//validation
			if(fName == "" || email == "" || contNo == "" || gender == "" || dateCreated == "")
			{
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("addCustomer.jsp");
			}
			else {
				
				try {
					
					addCustomer newCustomerInstance = new addCustomer();
					
					newCustomerInstance.setName(fName);
					newCustomerInstance.setEmail(email);
					newCustomerInstance.setContactNo(contNo);
					newCustomerInstance.setGender(gender);
					newCustomerInstance.setDateCreated(dateCreated);
					
					addDao adds=new addDao();
					adds.addNewCustomer(newCustomerInstance);
					
					
				}
				
				catch(Exception e) {
					System.out.println(e.toString());
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("newCustomer.jsp");	
		doGet(request, response);
	}

}
