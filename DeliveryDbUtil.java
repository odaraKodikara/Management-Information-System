package manageTransportation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DBConnect;


import util.DBConnect;

public class DeliveryDbUtil {
	
	Connection connection;
	
	PreparedStatement preparedStatement;

	
	public DeliveryDbUtil() {
		super();
	}
	
	public void addNewDelivery(Delivery newDelivery)  
	{
		
		
		try {
						
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into Delivery(rNo,empId,date1,description1,rate,distance,total) values(?,?,?,?,?,?,?);");
			
			connection.setAutoCommit(false);
			
			//preparedStatement.setInt(1, newDelivery.getdNo());
			preparedStatement.setString(1,newDelivery.getrNo());
			preparedStatement.setInt(2, newDelivery.getEmpId());
			preparedStatement.setString(3,newDelivery.getDate1());
			preparedStatement.setString(4,newDelivery.getDescription1());
			preparedStatement.setDouble(5,newDelivery.getRate());
			preparedStatement.setDouble(6,newDelivery.getDistance());
			preparedStatement.setDouble(7,newDelivery.getTotal());
			
			
			preparedStatement.execute();
			
			connection.commit();

			
			
		    } 
			catch (SQLException | ClassNotFoundException e)
			{
			    System.out.println("Severe Exception "+e.getMessage());
	    	} 
			finally
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
