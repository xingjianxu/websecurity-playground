<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改密码</title>
</head>
<body>

<form action="/playground/users/changePassword" method="post">
	<input type="hidden" name="id" value="<%= request.getParameter("userId")%>">
	密码：<input type="password" name="password1">
	<br/>
	再次密码：<input type="password" name="password2">
	<br/>
	<input type="submit" value="修改密码">
</form>

</body>
</html>
