package employeeHandling;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import util.DBConnect;

/**
 * Servlet implementation class addUtilExp
 */
@WebServlet("/addSalary")

public class addSalary extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addSalary() {
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
			
			String employee = request.getParameter("eid");
			String month = request.getParameter("month");
			String year = request.getParameter("year");
			String basicSalary = request.getParameter("bSal");
			String otHours = request.getParameter("otHrs");
			String otRate = request.getParameter("otRate");
			
			//validation
			
			if(employee == "" || month == "" || year == "" || basicSalary == "" || otHours == "" || otRate == "" )
			{
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("empSal.jsp");
			}	
			else
			{
				
				try {
					empSalary newempSalaryInstance = new empSalary();
					
					newempSalaryInstance.setEid(employee);
					newempSalaryInstance.setMonth(month);
					newempSalaryInstance.setYear(year);
					newempSalaryInstance.setBasicSalary(basicSalary);
					newempSalaryInstance.setOtHours(otHours);
					newempSalaryInstance.setOtRate(otRate);
					
					salaryDbUtill adds=new salaryDbUtill();
					adds.addSalary(newempSalaryInstance);
					
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
		response.sendRedirect("empSal.jsp");
		doGet(request, response);
	}

}
