package playground;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class DBTestServlet
 */
public class DBTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DBTestServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ��ѯusers�����ж����У�����������ʾ����ҳ��
	
	}
	
	private void queryAll(HttpServletResponse response) throws IOException {
		// 1. �������ݿ�����
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try {
			// 2. �������ݿ�����
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://192.168.152.128:3306/playground?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
					"root", "1");
			
			// 3. ����statement
			Statement statement = conn.createStatement();
			
			// 4. ��statement��ִ��sql��䣬���ؽ���洢��ResultSet��
			ResultSet resultSet = statement.executeQuery("SELECT * FROM users;");

			// 5. ��resultSet�ж�ȡ����
			do {
				// ���α�ָ����һ��
				resultSet.next();
				String username = resultSet.getNString("username");
				String password = resultSet.getNString("password");
				response.getWriter().append(username + ": " + password + "\n");
			} while (!resultSet.isLast());

		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.flushBuffer();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
