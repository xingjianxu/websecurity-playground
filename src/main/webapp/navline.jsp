<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

<%
String loginUserId = (String) request.getSession().getAttribute(LoginServlet.LOGIN_USER_ID);

//如果用户未登录
if (loginUserId == null || loginUserId.isBlank()) {
	%>
	<span>用户未登录！</span>
	
	<%
} else {
Connection conn = DBUtils.getConnection();
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM users WHERE id=" + loginUserId);

rs.next();
String username = rs.getString("username");
%>
<span>当前登录用户：<%= username %></span>
<% } %>

<a href="/playground/login.jsp">登录</a>
<a href="/playground/logout">登出</a>
<a href="/playground/users/add.jsp">注册</a>

<a href="/playground/users/list.jsp">查看所有用户</a>

<a href="/playground/article/list.jsp">查看用户文章</a>

<br/><br/>