<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MD5彩虹表</title>
</head>
<body>

	<%
	String raw = "";
	if (request.getMethod().equals("POST")) {
		String hashed = request.getParameter("hashed");

		Connection conn = DBUtils.getConnection();

		PreparedStatement ps = conn.prepareStatement("SELECT raw, hashed FROM rainbow WHERE hashed=?");

		ps.setString(1, hashed);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			raw = rs.getString("raw");
		}
	}
	%>


	<form action="/playground/rainbow.jsp" method="post">
		密文：<input type="text" name="hashed" /> <br /> <br /> 明文：<span><%=raw%></span>

		<br /> <br /> 
		<input type="submit" value="查询！" />

	</form>


</body>
</html>