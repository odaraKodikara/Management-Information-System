package employeeHandling;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnect;

public class attendanceDbUtill {
	
private Connection connection;
	
	private PreparedStatement preparedStatement;
	
	
	public attendanceDbUtill() {
		super();
	}


	public void addAttendance(Attendance attendance)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into Attendance (eid ,date, count, inTime, outTime;) values ( ?, ?, ?, ?, ?);");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, attendance.getEid());
			preparedStatement.setString(2, attendance.getDate());
			preparedStatement.setString(3, attendance.getCount());
			preparedStatement.setString(4, attendance.getInTime());
			preparedStatement.setString(5, attendance.getOutTime());
			
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
	
	
	public void updateattendance(Attendance attendance)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement
			("UPDATE Attendance set name= ?, date= ?, count= ?, inTime= ?, outTime= ? where eid= ?");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, attendance.getName());
			preparedStatement.setString(2, attendance.getDate());
			preparedStatement.setString(3, attendance.getCount());
			preparedStatement.setString(4, attendance.getInTime());
			preparedStatement.setString(5, attendance.getOutTime());
			preparedStatement.setString(6, attendance.getEid());
			
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