<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
</head>
<body>

<form action="/playground/login" method="post">
	用户名：<input type="text" name="username">
	<br/>
	密码：<input type="password" name="password">
	
	<br/>
	<input type="submit" value="登录">
</form>

</body>
</html>