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
	ResultSet rs = st.executeQuery("SELECT * FROM articles JOIN users ON articles.author_id=users.id WHERE articles.id=" + request.getParameter("id"));
	// 指定id的文章不存在
	if (!rs.next()) {
	%>
	<h2>文章不存在！</h2>
	<%
	} else if(!rs.getString("author_id").equals(request.getAttribute("loginUserId"))) {
		// 如果当前登录用户不是该文章的作者，则不允许查看该文章
		%>
			<h2>当前登录用户不是该文章的作者，不允许查看该文章！</h2>
		<%
	} else {
	%>
	<h2><%=rs.getString("title")%></h2>
	<br/> 
	作者：<%=rs.getString("username") %>
	<article>
		<%=rs.getString("content")%>
	</article>
	<%
	}
	%>

</body>
</html>