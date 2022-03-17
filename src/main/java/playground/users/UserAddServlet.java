package playground.users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import playground.DBUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * ������û�
 */
public class UserAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserAddServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");

		// 判断密码是否一致
		if (!password1.equals(password2)) {
			response.getWriter().println("密码不一致！");
			return;
		}

		try {
			Connection connection = DBUtils.getConnection();
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM users WHERE username='" + username + "'");
			rs.next();
			int c = rs.getInt(1);
			if (c != 0) {
				response.getWriter().println("用户已存在");
				return;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		try {
			Connection connection = DBUtils.getConnection();
			Statement st = connection.createStatement();

			st.executeUpdate("INSERT INTO users (username,password) VALUES ('" + username + "', '" + password1 + "')");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("list.jsp");

	}

}
