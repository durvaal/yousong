package br.com.ufrn.database;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author Paulo Lima (paulo.xavier.700@ufrn.edu.br, plimayep@gmail.com)
 */
public class ConnectionFactory {
	
	private String driver = "com.mysql.cj.jdbc.Driver";
	
	private String url = "jdbc:mysql://localhost:3306/projeto1";

	private String user = "admin";

	private String password = "Password@123";
	
	public Connection getConnection() {
		Connection connection = null;
		
		try {
			Class.forName(driver);
			
			connection = DriverManager.getConnection(url, user, password);
			
			return connection;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
			return null;
		}
	}
	
	public void testConnection() {
		try {
			Connection connection = getConnection();
			
			System.out.println("Conexão criada com sucesso");
			System.out.println(connection);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
	}

}
