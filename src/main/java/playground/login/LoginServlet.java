package playground.login;

import jakarta.servlet.ServletException;
import playground.DBUtils;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class LoginWithSession
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String LOGIN_USER_ID = "login_user_id";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		response.setContentType("text/html; charset=utf-8");

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			Connection conn = DBUtils.getConnection();
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery(
					String.format("SELECT * FROM users WHERE username='%s' AND password='%s'", username, password)
					);

			// 如果rs可以将游标向下移动一行，说明上面的SQL返回了数据，即username对应的用户存在；反之，则说明用户不存在
			if (rs.next()) {
				// 用户提交了正确的用户与密码，允许登录
				response.sendRedirect("index.jsp");

				// 将登录用户的ID存在session中
				request.getSession().setAttribute(LOGIN_USER_ID, rs.getString("id"));

			} else {
				// 用户提交了错误的用户与密码，不允许登录或者用户名不存在
				response.getWriter().println("登录失败");
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
