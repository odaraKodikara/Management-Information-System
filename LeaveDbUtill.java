package employeeHandling;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnect;

public class LeaveDbUtill {

	
private Connection connection;
	
	private PreparedStatement preparedStatement;
	
	
	public LeaveDbUtill() {
		super();
	}


	public void addUtillExp(Leave leave)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into Leave(employee, type, noOfDays, leaveNo, fromDate, toDate, salaryCutOffPercent) values ( ?, ?, ?, ?, ?, ?, ?);");
			connection.setAutoCommit(false);
			
			//preparedStatement.setString(0, leave.getlid());
			preparedStatement.setString(1, leave.getEmployee());
			preparedStatement.setString(2, leave.getType());
			preparedStatement.setString(3, leave.getNoOfDays());
			preparedStatement.setString(4, leave.getLeaveNo());
			preparedStatement.setString(5, leave.getFromDate());
			preparedStatement.setString(6, leave.getToDate());
			preparedStatement.setString(7, leave.getSalaryCutOffPercent());
			
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
	
	
	public void updateUtillExp(Leave leave)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement
			("UPDATE Leave set employee= ?, type= ?, noOfDays= ?, leaveNo= ?, fromDate= ?, toDate= ?, salaryCutOffPercent= ? where lid= ?");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, leave.getEmployee());
			preparedStatement.setString(2, leave.getType());
			preparedStatement.setString(3, leave.getNoOfDays());
			preparedStatement.setString(4, leave.getLeaveNo());
			preparedStatement.setString(5, leave.getFromDate());
			preparedStatement.setString(6, leave.getToDate());
			preparedStatement.setString(7, leave.getSalaryCutOffPercent());
			preparedStatement.setString(8, leave.getLid());
			
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
}