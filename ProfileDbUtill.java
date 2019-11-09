package manageFinance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnect;

public class ProfileDbUtill {
	
private Connection connection;
	
	private PreparedStatement preparedStatement;
	
	public ProfileDbUtill() {
		super();
	}

	public void updateProfile(Profile profile)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement
			("UPDATE users set username= ?,password= ? where userId= ?");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, profile.getUname());
			preparedStatement.setString(2, profile.getPass());
			preparedStatement.setString(3, profile.getUid());
			
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