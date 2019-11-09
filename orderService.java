package manageSuppliers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DBConnect;

public class orderService {

private Connection connection;
	
	private PreparedStatement preparedStatement;
	
	
	public orderService() {
		super();
	}


	public void addOrder(Order order)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into Orders (item,quantity,cost,date,rank,supplier) values (?, ?, ?, ?, ?, ?);");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, order.getItem());
			preparedStatement.setString(2, order.getQuantity());
			preparedStatement.setString(3, order.getCost());
			preparedStatement.setString(4, order.getDate());
			preparedStatement.setString(5, order.getRank());
			preparedStatement.setString(6, order.getSupplier());
			
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
	
	
	public void updateOrder(Order order)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("UPDATE Orders set item=?,quantity=?,cost=?,date=?,rank=?,supplier=? where oid=?");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, order.getItem());
			preparedStatement.setString(2, order.getQuantity());
			preparedStatement.setString(3, order.getCost());
			preparedStatement.setString(4, order.getDate());
			preparedStatement.setString(5, order.getRank());
			preparedStatement.setString(6, order.getSupplier());
			preparedStatement.setString(7, order.getId());
			
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
