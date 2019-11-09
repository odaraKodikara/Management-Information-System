package customerHandling;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.CallableStatement;
import javax.swing.JOptionPane;

import customerHandling.addCustomer;

import util.DBConnect;

public class addDao {

	
	private Connection connection;
	
	private PreparedStatement preparedStatement;
	
	
	public void addNewCustomer(addCustomer newCustomer)  
	{
		
		
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("insert into Customer(name,address,contactNo,gender,date,discount) values(?,?,?,?,?,?);");
			
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1,newCustomer.getName());
			preparedStatement.setString(2,newCustomer.getEmail());
			preparedStatement.setString(3,newCustomer.getContactNo());
			preparedStatement.setString(4,newCustomer.getGender());
			preparedStatement.setString(5,newCustomer.getDateCreated());
			preparedStatement.setString(6,newCustomer.getDiscount());
			
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
	
	public void updateBDiscount(bankDiscount bDiscount)  
	{
		try {
			connection = DBConnect.getDBConnection();
			
			preparedStatement = connection.prepareStatement("UPDATE CreditCard set discount= ? where bank= ?");
			connection.setAutoCommit(false);
			
			preparedStatement.setString(1, bDiscount.getDiscount());
			preparedStatement.setString(2, bDiscount.getBankName());
			
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

