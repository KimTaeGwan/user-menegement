package jsp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
		public static Connection getConnection() throws SQLException, ClassNotFoundException{
		Connection conn = null;
		Class.forName("org.sqlite.JDBC");
		String dbFileUrl = "jdbc:sqlite:C:\\sqlite\\myDBDB.db";
		conn = (Connection)DriverManager.getConnection(dbFileUrl,"admin","admin");
		 
		return conn;
	}
}
