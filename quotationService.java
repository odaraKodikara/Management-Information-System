package manageSuppliers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DBConnect;

public class quotationService {
	
	private Connection connection;
	
	private PreparedStatement preparedStatement;

	public quotationService() {
		super();
	}
	
	public void addQuotation(Quotation quotation)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into Quotation (supplier,date,itemName,pricePerItem) values (?, ?, ?, ?);");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, quotation.getSupplier());
			preparedStatement.setString(2, quotation.getDate());
			preparedStatement.setString(3, quotation.getItem());
			preparedStatement.setString(4, quotation.getPrice());
			
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
	
	
	public void updateQuotation(Quotation quotation)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			//String id=supplier.getName();
			
			preparedStatement = connection.prepareStatement("Update Quotation set supplier=?,date=?,itemName=? ,pricePerItem=? where qid=?");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, quotation.getSupplier());
			preparedStatement.setString(2, quotation.getDate());
			preparedStatement.setString(3, quotation.getItem());
			preparedStatement.setString(4, quotation.getPrice());
			preparedStatement.setString(5, quotation.getQid());
			
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
