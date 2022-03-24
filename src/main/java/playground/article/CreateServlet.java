package playground.article;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import playground.DBUtils;
import playground.login.LoginServlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.sql.Date;

/**
 * Servlet implementation class CreateServlet
 */
public class CreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateServlet() {
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
	 * 创建或编辑文章
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		String id = request.getParameter("id");
		
		// 取得当前登录用户的ID
		String authorId = (String) request.getSession().getAttribute(LoginServlet.LOGIN_USER_ID);
		// 如果ID为空，说明未登录，无法继续执行
		if (authorId == null || authorId.isBlank()) {
			response.getWriter().println("用户未登录，请先<a href='/playground/login.jsp'>登录</a>。");
			return;
		}
		

		// 向数据库中插入新文章
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date now = new Date(System.currentTimeMillis());
		String dateStr = simpleDateFormat.format(now);

		try {
			Connection connection = DBUtils.getConnection();
			Statement statement = connection.createStatement();

			if (id == null) {
				// 当创建文章时，id为空，执行插入新文章的代码
				statement.executeUpdate("INSERT INTO articles (title,content,createdAt,modifiedAt,author_id) VALUES ('" + title
						+ "', '" + content + "', '" + dateStr + "', '" + dateStr + "', '" + authorId + "')");
			} else {
				// 此时id不为空，说明正在编辑一个已经存在的article
				// 执行更新指定文章的代码
				statement.executeUpdate("UPDATE articles SET title='" + title + "',content='" + content
						+ "',modifiedAt='" + dateStr + "' WHERE id=" + id);
			}

		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}

		response.sendRedirect("/playground/article/list.jsp");
	}

}
