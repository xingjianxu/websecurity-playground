<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="playground.DBUtils"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<%
	Connection conn = DBUtils.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM users");
	%>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>用户名</th>
				<th>密码</th>
			</tr>
		</thead>
		<tbody>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%= rs.getString("id")%></td>
				<td><%= rs.getString("username")%></td>
				<td><%= rs.getString("password")%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>