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


<h1>Hello: <%= request.getSession().getAttribute("username") %></h1>


</body>
</html>