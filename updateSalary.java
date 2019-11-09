package employeeHandling;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateSupplier
 */
@WebServlet("/updateSalary")

public class updateSalary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateSalary() {
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
			
			String eid = request.getParameter("eid");
			String employee = request.getParameter("employee");
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			String basicSalary = request.getParameter("basicSalary");
			String otHours = request.getParameter("otHours");
			String otPay = request.getParameter("otPay");
			String finalSalary = request.getParameter("finalSalary");
			
				try {
					empSalary newempSalaryInstance = new empSalary();
					
					newempSalaryInstance.setEid(eid);
					newempSalaryInstance.setEmployee(employee);
					newempSalaryInstance.setMonth(month);
					newempSalaryInstance.setYear(year);
					newempSalaryInstance.setBasicSalary(basicSalary);
					newempSalaryInstance.setOtHours(otHours);
					newempSalaryInstance.setOtRate(otPay);
					newempSalaryInstance.setFinalSalary(finalSalary);
					
					
					salaryDbUtill adds=new salaryDbUtill();
					adds.addSalary(newempSalaryInstance);
										
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		response.sendRedirect("empsal.jsp");
		doGet(request, response);
	}

}

