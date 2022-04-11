<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文件上传</title>
<script type="text/javascript">
// 通过将此函数绑定到表单的onsubmit属性中
// 如果此函数返回true，则允许表单继续提交；否则，不允许表达提交
function checkUploadFile() {
	// 得到上传input控件的元素
	var fu = document.getElementById("fileUpload");
	
	// 得到用户选择的上传文件
	var selectedFile = fu.value;
	
	if (!(selectedFile.endsWith(".jpeg") || selectedFile.endsWith(".jpg") || selectedFile.endsWith(".png"))) {
		alert("非图片文件不允许上传！");
		return false;
	} else {
		return true;
	}
}
</script>
</head>
<body>
	<!-- 此表单在每次提交之前，都会执行onsubmit中的js代码，只有当该代码返回true，才会继续提交 -->
	<form action="/playground/upload" method="POST" enctype="multipart/form-data" onsubmit="return checkUploadFile();">

		<input type="file" name="uploadFile" accept=".jpg,.jpeg,.png" id="fileUpload"/>
		<br /> <br />
		<input type="submit" value="开始上传" />
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
				<a href="/playground/deleteUpload?fileName=<%=file.getName()%>">刪除</a> |
				<a href="#">重命名</a>
			</td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>