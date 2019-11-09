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
@WebServlet("/updateAttendance")
public class updateAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAttendance() {
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
			String name = request.getParameter("name");
			String date = request.getParameter("date");
			String count = request.getParameter("count");
			String inTime = request.getParameter("inTime");
			String outTime = request.getParameter("outTime");
			
			
				try {
						Attendance newAttendanceInstance = new Attendance();
					
						newAttendanceInstance.setEid(eid);
						newAttendanceInstance.setName(name);
						newAttendanceInstance.setDate(date);
						newAttendanceInstance.setCount(count);
						newAttendanceInstance.setInTime(inTime);
						newAttendanceInstance.setOutTime(outTime);
						
						attendanceDbUtill adds=new attendanceDbUtill();
						adds.updateattendance(newAttendanceInstance);
				}
				catch(Exception e) {
					e.printStackTrace();
				}
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		response.sendRedirect("AttendanceDetails.jsp");
		doGet(request, response);
	}

}

