<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章列表</title>
</head>
<body>
	<a href="/playground/article/create.jsp">创建新文章</a>

	<%
	Connection conn = DBUtils.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM articles ORDER BY modifiedAt DESC");
	%>

	<table>
		<tr>
			<th width="500px">标题</th>
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
			<td><%= rs.getString("createdAt") %></td>
			<td><%= rs.getString("modifiedAt") %></td>
			<td>
			<a href="/playground/article/edit.jsp?id=<%=rs.getString("id")%>">编辑</a> |
			<a href="/playground/article/delete?id=<%=rs.getString("id")%>">删除</a>
			</td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>