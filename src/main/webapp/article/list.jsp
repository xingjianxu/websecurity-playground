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
	
	<a href="/playground/article/create.jsp">创建新文章</a>

	<%
	Connection conn = DBUtils.getConnection();
	Statement st = conn.createStatement();
	// 为了显示用户名，在SQL中用了JOIN语句
	ResultSet rs = st.executeQuery("SELECT * FROM articles JOIN users ON articles.author_id=users.id ORDER BY modifiedAt DESC");
	%>

	<table>
		<tr>
			<th width="500px">标题</th>
			<th width="200px">作者</th>
			<th width="200px">发布时间</th>
			<th width="200px">修改时间</th>
			<th width="200px">操作</th>
		</tr>
		<!-- 展示文章列表 -->
		<%
		while (rs.next()) {
		%>
		<tr>
			<td><a href="/playground/article/view.jsp?id=<%=rs.getString("id")%>"><%= rs.getString("title") %></a></td>
			<td><%= rs.getString("username") %></td>
			<td><%= rs.getString("createdAt") %></td>
			<td><%= rs.getString("modifiedAt") %></td>
			<td>
			<%
			// 如果该文章的作者不是当前登录用户，则不显示编辑和删除按钮
			// 这里只是隐藏了前端页面的按钮，但是用户仍然可以通过直接访问URL的方式进入编辑和删除页面。为了解决这一问题，需要修改编辑和删除的后端代码。
			String loginUserId = (String) request.getSession().getAttribute(LoginServlet.LOGIN_USER_ID);
			if (loginUserId.equals(rs.getString("author_id"))) {
				%>
				<a href="/playground/article/edit.jsp?id=<%=rs.getString("id")%>">编辑</a> |
				<a href="/playground/article/delete?id=<%=rs.getString("id")%>">删除</a>
				<%
			}
			%>
			
			</td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>