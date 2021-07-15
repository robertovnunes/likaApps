package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.sql.ResultSet;

public class DataBaseConnector {
	
	private Connection connection ;
	
	public DataBaseConnector() throws InstantiationException, IllegalAccessException,
	ClassNotFoundException, SQLException
	{
		Properties properties = new Properties() ;
		properties.setProperty( "user", "root" ) ;
		properties.setProperty( "password", "" ) ;
		properties.setProperty( "host", "localhost" ) ;
		Class.forName( "com.mysql.jdbc.Driver" ).newInstance() ;
		connection = DriverManager.getConnection( "jdbc:mysql://localhost/chatmodule", properties ) ;
	}
	
	public ResultSet db_query( String query ) throws InstantiationException, IllegalAccessException,
	ClassNotFoundException, SQLException
	{
		Statement stmResp = connection.createStatement() ;
		stmResp.executeQuery( query ) ;
		
		return stmResp.getResultSet() ;
	}
	
	public void closeConnection() throws SQLException
	{
		connection.close() ;
	}
	
}
