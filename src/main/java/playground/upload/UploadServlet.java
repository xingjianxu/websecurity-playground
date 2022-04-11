package playground.upload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Servlet implementation class UploadServlet
 */
@MultipartConfig
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static final String UPLOAD_DIR_PATH = "D:\\eclipse-workspace\\playground\\src\\main\\webapp\\upload\\";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServlet() {
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
		Part part = request.getPart("uploadFile");
		String partName = part.getSubmittedFileName();
		
		//限制用户上传文件类型
		if (!(partName.endsWith(".jpeg") || partName.endsWith(".jpg") || partName.endsWith(".png"))) {
			response.setStatus(HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE);
			response.getWriter().write("只能上传图片！");
			return;
		}

		File localFile = new File(UPLOAD_DIR_PATH + partName);
		
		FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
		
		InputStream in = part.getInputStream();
		
		// 将客户端的上传数据存储到localFile中
		byte[] buffer = new byte[1000];
		while (in.read(buffer) != -1) {
			localFileOutputStream.write(buffer);
		}
		
		localFileOutputStream.close();
		response.sendRedirect("upload.jsp");
	}

}
