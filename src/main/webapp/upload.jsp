<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文件上传</title>
</head>
<body>

	<form action="/playground/upload" method="POST"
		enctype="multipart/form-data">

		<input type="file" name="uploadFile" /> <br /> <br /> <input
			type="submit" value="开始上传" />
	</form>

	<table>
		<tr>
			<th>上传文件路径</th>
		</tr>

		<%
		File uploadDir = new File("D:\\eclipse-workspace\\playground\\src\\main\\webapp\\upload\\");
		for (File file : uploadDir.listFiles()) {
		%>
		<tr>
			<td><%= file.getAbsolutePath() %></td>
		</tr>
		<%
		}
		%>


	</table>

</body>
</html>