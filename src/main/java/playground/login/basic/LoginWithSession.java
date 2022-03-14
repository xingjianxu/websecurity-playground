package playground.login.basic;

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
public class LoginWithSession extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginWithSession() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html; charset=utf-8");
        
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			Connection conn = DBUtils.getConnection();
			Statement statement = conn.createStatement();
			ResultSet rs = statement.executeQuery("SELECT password FROM users WHERE username='"+username+"'");
			
			// ���rs���Խ��α������ƶ�һ�У�˵�������SQL���������ݣ���username��Ӧ���û����ڣ���֮����˵���û�������
			if (rs.next()) {
				String dbPassword = rs.getNString("password");
				
				if (password.equals(dbPassword)) {
					// �û��ύ����ȷ���û������룬�����¼
					response.getWriter().println("��¼�ɹ���");
					
					// ����¼�û����û�������session��
					request.getSession().setAttribute("username", username);

				} else {
					// �û��ύ�˴�����û������룬�������¼
					response.getWriter().println("��¼ʧ�ܣ��û��������벻ƥ��");
				}
			} else {
				response.getWriter().println("�û������ڣ�");
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
