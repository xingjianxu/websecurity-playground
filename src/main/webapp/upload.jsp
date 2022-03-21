<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="playground.upload.UploadServlet"%>

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
			<th>文件大小</th>
			<th>操作</th>
		</tr>

		<%
		File uploadDir = new File(UploadServlet.UPLOAD_DIR_PATH);
		for (File file : uploadDir.listFiles()) {
		%>
		<tr>
			<td><%=file.getName()%></td>
			<td><%=file.length()%></td>
			<td>
				<a href="/playground/download?fileName=<%=file.getName()%>">下载</a> |
				<a href="/playground/deleteUpload?fileName=<%=file.getName()%>">刪除</a>
			</td>
		</tr>
		<%
		}
		%>


	</table>

</body>
</html>