package manageInventory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.DBConnect;

public class Controller {
private Connection connection;
	
	private PreparedStatement preparedStatement;
	


	public Controller() {
		super();
	}


	public void addItem(Item item)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into item (name,category,quantity,maxCost,unitPrice) values (?, ?, ?, ?);");
			connection.setAutoCommit(false);

			preparedStatement.setString(1, item.getName());
			preparedStatement.setInt(2, item.getQuantity());
			preparedStatement.setString(3, item.getCategory());
			preparedStatement.setInt(4, item.getMaxCost());
			preparedStatement.setInt(5, item.getUnitPrice());
			
			
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
	
	
	public void updateItem(Item item)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			//String id=supplier.getName();
			
			preparedStatement = connection.prepareStatement("Update Item set name=?,cat=?,quantity=?,maxCost=?,unitPrice=? where id=?");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, item.getName());
			preparedStatement.setInt(2, item.getQuantity());
			preparedStatement.setString(3, item.getCategory());
			preparedStatement.setInt(4, item.getMaxCost());
			preparedStatement.setInt(5, item.getUnitPrice());
			
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
