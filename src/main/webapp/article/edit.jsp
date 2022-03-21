<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章编辑</title>
</head>
<body>


	<%
	Connection conn = DBUtils.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM articles WHERE id=" + request.getParameter("id"));
	rs.next();
	%>

	<form action="/playground/article/create" method="post">
		<input type="hidden" name="id"
			value="<%=request.getParameter("id")%>" /> 文章标题： <br /> 
			
		<input type="text" name="title" value="<%= rs.getString("title") %>" style="width: 400px" /> 
		<br /> <br />

		文章内容： <br />
		<textarea name="content" rows="10" style="width: 400px"><%= rs.getString("content") %></textarea>
		<br /> 
		<input type="submit" value="保存" />

	</form>

</body>
</html>