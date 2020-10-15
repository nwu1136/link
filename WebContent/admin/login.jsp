<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录</title>
</head>
<body>
	<form action="admin?action=login" method="post">
		管理员账号：<input type="text" name="username" /><br/>
		管理员密码：<input type="password" name="password" /><br/>
		验证码：<input type="text" name="validateCode">
		<img title="看不清？点击换一张呗" src="ValidateCode" onclick="this.src='ValidateCode?num='+Math.random()" />
		<br/>
		<input type="reset" value="重置" />
		<input type="submit" value="提交" />
	</form>
</body>
</html>