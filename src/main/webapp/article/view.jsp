<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="playground.DBUtils"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章浏览</title>
</head>
<body>


	<%
	Connection conn = DBUtils.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM articles WHERE id=" + request.getParameter("id"));
	// 指定id的文章不存在
	if (!rs.next()) {
	%>
	<h2>文章不存在！</h2>
	<%
	} else {
	%>
	<h2><%=rs.getString("title")%></h2>
	<article>
		<%=rs.getString("content")%>
	</article>
	<%
	}
	%>

</body>
</html>