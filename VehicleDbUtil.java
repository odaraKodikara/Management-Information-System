package manageTransportation;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import util.DBConnect;

public class VehicleDbUtil {

    private Connection connection;
	
	private PreparedStatement preparedStatement;
	
	public VehicleDbUtil() {
		super();
	}
	
	public void addNewVehicle(Vehicle newVehicle)  
	{
		
		
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into Vehicle(regNo,type1,model,price,insureNo) values(?,?,?,?,?);");
			
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1,newVehicle.getRegNo());
			preparedStatement.setString(2,newVehicle.getType());
			preparedStatement.setString(3,newVehicle.getModel());
			preparedStatement.setDouble(4,newVehicle.getPrice());
			preparedStatement.setString(5,newVehicle.getInsNo());
			
			
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
	
	public void updateVehicle(Vehicle theVehicle)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("update Vehicle "
				+"set type1= ? ,model= ? ,price= ? ,insureNo= ?  "
				+"where regNo= ? ");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, theVehicle.getType());
			preparedStatement.setString(2, theVehicle.getModel());
			preparedStatement.setDouble(3, theVehicle.getPrice());
			preparedStatement.setString(4, theVehicle.getInsNo());
			preparedStatement.setString(5, theVehicle.getRegNo());
			
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
