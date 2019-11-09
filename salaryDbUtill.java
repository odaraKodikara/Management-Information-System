package employeeHandling;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnect;

public class salaryDbUtill {
	
	
private Connection connection;
	
	private PreparedStatement preparedStatement;
	
	
	public salaryDbUtill() {
		super();
	}


	public void addSalary(empSalary EmpSalary)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into MonthlySalary(employee,month,year,basicSalary,otHours,otRate,otPay,finalSalary) values ( ?, ?, ?, ?, ?, ?, ?, ?);");
			connection.setAutoCommit(false);
			
			float otPay = Float.parseFloat(EmpSalary.getOtHours())*Float.parseFloat(EmpSalary.getOtRate());
			float basicSal = Float.parseFloat(EmpSalary.getBasicSalary());
			float finalSal = otPay + basicSal;
			
			preparedStatement.setString(1, EmpSalary.getEid());
			preparedStatement.setString(2, EmpSalary.getMonth());
			preparedStatement.setString(3, EmpSalary.getYear());
			preparedStatement.setString(4, EmpSalary.getBasicSalary());
			preparedStatement.setString(5, EmpSalary.getOtHours());
			preparedStatement.setString(6, EmpSalary.getOtRate());
			preparedStatement.setFloat(7, otPay);
			preparedStatement.setFloat(8, finalSal);
			
			
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
	
	
	public void updateSalary(empSalary EmpSalary)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement
			("UPDATE MonthlySalary set employee= ?, month= ?, year= ?, basicSalary= ?, otHours= ?, otPays= ?, finalSalary= ?, where eid= ?");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, EmpSalary.getEid());
			preparedStatement.setString(2, EmpSalary.getMonth());
			preparedStatement.setString(3, EmpSalary.getYear());
			preparedStatement.setString(4, EmpSalary.getBasicSalary());
			preparedStatement.setString(5, EmpSalary.getOtHours());
			preparedStatement.setString(6, EmpSalary.getOtRate());
			preparedStatement.setString(7, EmpSalary.getFinalSalary());
			
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
