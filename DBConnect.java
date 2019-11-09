package util;

import java.sql.*;

public class DBConnect {

	public Statement st;
	public Connection con;
	public ResultSet rs;
	public PreparedStatement ps;
	public static Connection connection;
	public int count;

	public ResultSet rs1;
	public Statement st1;

	public DBConnect() throws SQLException, ClassNotFoundException{

		try {

			String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
			String url = "jdbc:sqlserver://localhost:1433;databaseName=FashionBug"; 
			String username = "odara";
			String password = "odara";
			Class.forName(driver);

			Connection con = DriverManager.getConnection(url, username, password);
			System.out.println("connected to database");
			st = con.createStatement();
			st1 = con.createStatement();

		} catch (Exception e) {
			System.out.println("ERROR" + e);
		}

	}
	
	public static Connection getDBConnection() throws ClassNotFoundException, SQLException {
		/*
		 * This create new connection objects when connection is closed or it is
		 * null
		 */
		if (connection == null || connection.isClosed()) {

			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=FashionBug","odara","odara");
		}
		return connection;
	}

}