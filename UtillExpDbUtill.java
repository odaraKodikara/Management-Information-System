package manageFinance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnect;

public class UtillExpDbUtill {
	
private Connection connection;
	
	private PreparedStatement preparedStatement;
	
	
	public UtillExpDbUtill() {
		super();
	}


	public void addUtillExp(UtillExp utillExp)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into UtilityExpense(description,cost) values ( ?, ?);");
			connection.setAutoCommit(false);
			
			//preparedStatement.setString(1, utillExp.getUid());
			preparedStatement.setString(1, utillExp.getDescription());
			preparedStatement.setString(2, utillExp.getCost());
			
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
	
	
	public void updateUtillExp(UtillExp utillExp)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement
			("UPDATE UtilityExpense set description= ?,cost= ? where uid= ?");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, utillExp.getDescription());
			preparedStatement.setString(2, utillExp.getCost());
			preparedStatement.setString(3, utillExp.getUid());
			
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