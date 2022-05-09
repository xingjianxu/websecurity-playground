<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="playground.login.LoginServlet" %>
	
<%@ include file="/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章列表</title>
</head>
<body>
	<jsp:include page="/navline.jsp"></jsp:include>
	
	<%
	String id = request.getParameter("id");
	Connection conn = DBUtils.getConnection();
	Statement st = conn.createStatement();

	ResultSet rs = st.executeQuery("SELECT id, title FROM articles WHERE id="+id);
	%>

	<table>
		<tr>
			<th width="500px">ID</th>
			<th width="200px">Title</th>

		</tr>
		<!-- 展示文章列表 -->
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><%= rs.getString("id") %></td>
			<td><%= rs.getString("title") %></td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>