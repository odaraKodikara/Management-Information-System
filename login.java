package login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import util.DBConnect;

/**
 * Servlet implementation class loginVal
 */
@WebServlet("/loginServlet")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException , NullPointerException{
		try {
			// getting login values

			String lName = request.getParameter("uname");
			String lPass = request.getParameter("pass");
			String password = null;
			String username = null;
			String userId = null;

			DBConnect dbPass = new DBConnect();
			dbPass.rs = dbPass.st.executeQuery("select * from users where username='" + lName + "'  ");

			// validate login and checking the user level

			if (!dbPass.rs.next()) {
				JOptionPane.showMessageDialog(null, "Please Enter your Username");
				response.sendRedirect("login.jsp");
			} 
			else {
				do {
					password = dbPass.rs.getString("password");
					username = dbPass.rs.getString("username");
					userId = dbPass.rs.getString("userId");

				} while (dbPass.rs.next());

				if (password.equals(lPass)) {
					if (username.equals("chmanager")) {
						HttpSession session = request.getSession();
						session.setAttribute("name", username);
						session.setAttribute("userId", userId);
						response.sendRedirect("newCustomer.jsp");
					} 
					else if(username.equals("imanager")){
						HttpSession session = request.getSession();
						session.setAttribute("name", username);
						session.setAttribute("userId", userId);
						response.sendRedirect("addItem.jsp");
					}
					else if(username.equals("shmanager")){
						HttpSession session = request.getSession();
						session.setAttribute("name", username);
						session.setAttribute("userId", userId);
						response.sendRedirect("supplierDashboard.jsp");
				    } 
					else if(username.equals("hrmanager")){
						HttpSession session = request.getSession();
						session.setAttribute("name", username);
						session.setAttribute("userId", userId);
						response.sendRedirect("List-EmployeeReg.jsp");
				    }
					else if(username.equals("fmanager")){
						HttpSession session = request.getSession();
						session.setAttribute("name", username);
						session.setAttribute("userId", userId);
						response.sendRedirect("financeDashboard.jsp");
				    }
					else if(username.equals("tmanager")){
						HttpSession session = request.getSession();
						session.setAttribute("name", username);
						session.setAttribute("userId", userId);
						response.sendRedirect("vehicleManagement.jsp");
				    }
					else {
					JOptionPane.showMessageDialog(null, "Entered Password is incorrect");
					response.sendRedirect("login.jsp");
				}
			}
			}
		}
		 catch (Exception e) {
			System.out.println(e.toString());
		}

		doGet(request, response);

	}
}
