package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	//dbÄ¿³Ø¼Ç
	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/sohwak?useSSL=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword="my1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return null;
	}
}

