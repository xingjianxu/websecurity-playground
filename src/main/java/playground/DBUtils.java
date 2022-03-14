package playground;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(
				"jdbc:mysql://192.168.152.128:3306/playground?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
				"root", "1");
	}

}
