<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

<%

//如果用户未登录
if (!(boolean)request.getAttribute("isLogin")) {
	%>
	<span>用户未登录！</span>
	
	<%
} else {
%>
<span>当前登录用户：<%= request.getAttribute("loginUserName") %></span>
<% } %>

<a href="/playground/login.jsp">登录</a>
<a href="/playground/logout">登出</a>
<a href="/playground/users/add.jsp">注册</a>

<a href="/playground/users/list.jsp">查看所有用户</a>

<a href="/playground/article/list.jsp">查看用户文章</a>

<br/><br/>