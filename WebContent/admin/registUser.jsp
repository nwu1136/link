<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>创建新用户</title>
</head>
<body>
创建新用户：
<form action="admin?action=registUser" method="post">
用户名：<input type="text" name="userName"><br>
密码：<input type="password" name="password"><br>
姓名：<input type="text" name="userRealName"><br>
电话号码：<input type="text" name="userPhoneNum"><br>
电子邮箱：<input type="text" name="userEmail"><br>
<input type="submit" value="确认注册">
</form>
</body>
</html>