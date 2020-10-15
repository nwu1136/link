<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>超级管理密码修改</title>
</head>
<body>

<form action="superAdmin?action=modifySuperAdminPassword" method="post">
	超级管理员密码修改：<br/>
	输入新密码：<input type="password" id="password1" name="password1"><br/>
	确认新密码：<input type="password" id="password2" name="password2"><br/>
	<input type="reset" value="取消">
	<input type="submit" value="确认">
</form>
</body>
</html>