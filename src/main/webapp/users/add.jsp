<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加用户</title>
</head>
<body>


<form action="/playground/users/add" method="post">
	用户名：<input type="text" name="username">
	<br/>
	密码：<input type="password" name="password1">
	<br/>
	再次密码：<input type="password" name="password2">
	<br/>
	<input type="submit" value="添加用户">
</form>

</body>
</html>