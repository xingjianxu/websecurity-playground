<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章创建</title>
</head>
<body>

<form action="/playground/article/create" method="post">
文章标题：
<br/>
<input type="text" name="title" value=""  style="width:400px"/>
<br/>
<br/>

文章内容：
<br/>
<textarea name="content" rows="10" style="width:400px"></textarea>
<br/>

<input type="submit" value="创建"/>

</form>

</body>
</html>