<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="playground.login.LoginServlet" %>
<%@ include file="/header.jsp" %>
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

<a href="./users/list.jsp">查看所有用户</a>

<a href="./article/list.jsp">查看用户文章</a>

<h1>Hello: <%= request.getSession().getAttribute(LoginServlet.LOGIN_USER_ID) %></h1>


</body>
</html>