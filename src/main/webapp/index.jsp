<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web安全课程靶场</title>
</head>
<body>
<a href="./login.jsp">登录</a>
<a href="./logout">登出</a>
<a href="./users/add.jsp">注册</a>

<h1>Hello: <%= request.getSession().getAttribute("username") %></h1>


</body>
</html>