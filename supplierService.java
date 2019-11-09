package manageSuppliers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import manageSuppliers.Supplier;
import util.DBConnect;

public class supplierService {

	private Connection connection;
	
	private PreparedStatement preparedStatement;
	
	
	public supplierService() {
		super();
	}


	public void addSupplier(Supplier supplier)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into Supplier (sname,contactNo,email,address) values (?, ?, ?, ?);");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, supplier.getName());
			preparedStatement.setString(2, supplier.getContactNo());
			preparedStatement.setString(3, supplier.getEmail());
			preparedStatement.setString(4, supplier.getAddress());
			
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
	
	
	public void updateSupplier(Supplier supplier)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			//String id=supplier.getName();
			
			preparedStatement = connection.prepareStatement("Update Supplier set contactNo=?,email=?,address=? where sName=?");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, supplier.getContactNo());
			preparedStatement.setString(2, supplier.getEmail());
			preparedStatement.setString(3, supplier.getAddress());
			preparedStatement.setString(4, supplier.getName());
			
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