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

<jsp:include page="/navline.jsp"></jsp:include>

	<%
	Connection conn = DBUtils.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM articles JOIN users ON articles.author_id=users.id WHERE articles.id=" + request.getParameter("id"));
	rs.next();
	
	String loginUserId = (String) request.getSession().getAttribute(LoginServlet.LOGIN_USER_ID);

	// 判断当前登录用户与文章作者是否一致，只有一致的情况下，才显示修改文章的表单
	if (rs.getString("author_id").equals(loginUserId)) {
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
		<%
	} else {
		%>
		<h1>用户未登录或不允许编辑其他人的文章！</h1>
		<%
	}
	
	%>

	

</body>
</html>