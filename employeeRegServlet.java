package employeeHandling;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import util.DBConnect;
import employeeHandling.EmployeeReg;
import employeeHandling.employeeService;

/**
 * Servlet implementation class employeeRegServlet
 */
@WebServlet("/employeeRegServlet")
public class employeeRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public employeeRegServlet() {
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
			
			String name = request.getParameter("name"); 
			String nic = request.getParameter("nic"); 
			String phone = request.getParameter("phone"); 
			String position = request.getParameter("position");
			String basicSalary = request.getParameter("basicSalary"); 
			String leaveLimit = request.getParameter("leaveLimit"); 
			String registeredDate = request.getParameter("registeredDate");
			
			
			
			//validation
			
			if(name == "" || nic == "" || phone == "" || position == ""|| basicSalary == ""|| leaveLimit == ""|| registeredDate == "")
			{
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("List-EmployeeReg.jsp");
			}	
			else
			{
				
				try {
					EmployeeReg newEmployeeInstance = new EmployeeReg();
					
					newEmployeeInstance.setName(name);
					newEmployeeInstance.setNic(nic);
					newEmployeeInstance.setPhone(phone);
					newEmployeeInstance.setPosition(position);
					newEmployeeInstance.setBasicSalary(basicSalary);
					newEmployeeInstance.setLeaveLimit(leaveLimit);
					newEmployeeInstance.setRegisteredDate(registeredDate);
					
					
					employeeService adds=new employeeService();
					adds.addEmployee(newEmployeeInstance);
					
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
		response.sendRedirect("list-employeeRegs.jsp");
		doGet(request, response);
	}

}
