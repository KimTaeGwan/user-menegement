package jsp.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
		public static Connection getConnection() throws SQLException, ClassNotFoundException{
		Connection conn = null;
		Class.forName("org.sqlite.JDBC");
		
		//현재 디렉토리에 경로를 불러오고
		//현재 디렉토리에 있는 DB 파일 열기
		String path = "E:\\Developer Tools\\Java\\workspace\\user-menegement";
		String dbFileUrl = "jdbc:sqlite:"+path+"\\userDB.db";
//		String dbFileUrl = "jdbc:sqlite:E:\\Developer Tools\\Java\\workspace\\user-menegement\\userDB.db";
		
		conn = (Connection)DriverManager.getConnection(dbFileUrl,"admin","admin");
		 
		return conn;
	}
}
