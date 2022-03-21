<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文件上传</title>
</head>
<body>

<form action="/upload" method="POST" >
	<input type="file" name="uploadFile"/>
	<br/>
	<br/>
	<input type="submit" value="开始上传" />
</form>

</body>
</html>