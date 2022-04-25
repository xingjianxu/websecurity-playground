package playground.upload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import playground.DBUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class DownloadServlet
 */
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DownloadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fileId = request.getParameter("fileId");
		try {
			Connection conn = DBUtils.getConnection();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM upload_files WHERE id=" + fileId);

			// 没有找到fileID对应的上传路径，返回404错误
			if (!rs.next()) {
				response.sendError(HttpServletResponse.SC_NOT_FOUND);
				return;
			}

			File file = new File(rs.getString("path"));

			// response.addHeader("Content-Disposition", "attachment;filename=" +
			// file.getName());

			InputStream in = new FileInputStream(file);

			// 读取file的内容并写入到response里
			byte[] buffer = new byte[1000];
			while (in.read(buffer) != -1) {
				response.getOutputStream().write(buffer);
			}
			response.flushBuffer();

			in.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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
