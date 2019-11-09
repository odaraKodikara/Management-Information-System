package employeeHandling;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import employeeHandling.EmployeeReg;
import employeeHandling.employeeRegServlet;
import util.DBConnect;

public class employeeService {
	
private Connection connection;
	
	private PreparedStatement preparedStatement;
	
	
	public employeeService() {
		super();
	}


	public void addEmployee(EmployeeReg employee)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into Employee (nic,name,phone,registeredDate,position,basicSalary,leaveLimit) values (?,?,?,?,?,?,?);");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, employee.getNic());
			preparedStatement.setString(2, employee.getName());
			preparedStatement.setString(3, employee.getPhone());
			preparedStatement.setString(4, employee.getRegisteredDate());
			preparedStatement.setString(5, employee.getPosition());
			preparedStatement.setString(6, employee.getBasicSalary());
			preparedStatement.setString(7, employee.getLeaveLimit());
			
			preparedStatement.execute();
			
			connection.commit();

			
			
		    } catch (SQLException | ClassNotFoundException e)
			{
			    System.out.println("Severe Exception "+e.getMessage());
	    	} finally
			{
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				     if (preparedStatement != null)
				     {
					     preparedStatement.close();
				     }
				     if (connection != null) 
			         {
					     connection.close();
				     }
			    } 
				catch (SQLException e) 
			    {
				     System.out.println("Severe SQL error"+ e.getMessage());
		    	}
		       }
	}
	
	
	
	public void updateEmployee(EmployeeReg employee)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			//String id=supplier.getName();
			
			preparedStatement = connection.prepareStatement("Update Employee set position=?,basicSalary=? where eid=?");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, employee.getPosition());
			preparedStatement.setString(2, employee.getBasicSalary());
			preparedStatement.setString(3, employee.getEid());
			
			int i=preparedStatement.executeUpdate();
			
			connection.commit();

			if(i>0)
				System.out.print("Updated Successfully");
			
			
		    } catch (SQLException | ClassNotFoundException e)
			{
			    System.out.println("Severe Exception "+e.getMessage());
	    	} finally
			{
			/*
			 * Close prepared statement and database connectivity at the end of
			 * transaction
			 */
			try {
				     if (preparedStatement != null)
				     {
					     preparedStatement.close();
				     }
				     if (connection != null) 
			         {
					     connection.close();
				     }
			    } 
				catch (SQLException e) 
			    {
				     System.out.println("Severe SQL error"+ e.getMessage());
		    	}
		       }
	}

}
