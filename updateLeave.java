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
@WebServlet("/updateLeave")

public class updateLeave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateLeave() {
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
			
			String lid = request.getParameter("lid");
			String employee = request.getParameter("employee");
			String type = request.getParameter("type");
			String noOfDays = request.getParameter("noOfDays");
			String leaveNo = request.getParameter("leaveNo");
			String fromDate = request.getParameter("fromDate");
			String toDate = request.getParameter("toDate");
			String salaryCutOffPercent = request.getParameter("salaryCutOffPercent");
			
				try {
					Leave newLeaveInstance = new Leave();
					
					newLeaveInstance.setLid(lid);
					newLeaveInstance.setEmployee(employee);
					newLeaveInstance.setType(type);
					newLeaveInstance.setNoOfDays(noOfDays);
					newLeaveInstance.setLeaveNo(leaveNo);
					newLeaveInstance.setFromDate(fromDate);
					newLeaveInstance.setToDate(toDate);
					newLeaveInstance.setSalaryCutOffPercent(salaryCutOffPercent);
					
					LeaveDbUtill adds=new LeaveDbUtill();
					adds.updateUtillExp(newLeaveInstance);
					
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		response.sendRedirect("Leave.jsp");
		doGet(request, response);
	}

}

