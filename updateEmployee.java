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
 * Servlet implementation class updateEmployee
 */
@WebServlet("/updateEmployee")
public class updateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateEmployee() {
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
			
			String eid = request.getParameter("eid"); 
			String position = request.getParameter("position");
			String basicSalary = request.getParameter("basicSal"); 
			
				try {
					EmployeeReg newEmployeeInstance = new EmployeeReg();
					
					newEmployeeInstance.setEid(eid);
					newEmployeeInstance.setPosition(position);
					newEmployeeInstance.setBasicSalary(basicSalary);
					
					
					employeeService adds=new employeeService();
					adds.updateEmployee(newEmployeeInstance);
					
				}
				catch(Exception e) {
					e.printStackTrace();
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
