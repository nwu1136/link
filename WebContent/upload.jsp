<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文件上传</title>
</head>
<body>
	<h3>文件上传：</h3>
	<form action="upload" method="post" enctype="multipart/form-data">
		<input type="file" name="file">
		<input type="submit" value="提交">
	</form>
</body>
</html>