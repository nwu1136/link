<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员密码修改</title>
<script type="text/javascript">
window.onload=function() {
	var adminID=document.getElementById("adminID").value;
	if(adminID==""||adminID=="null"||adminID==1){
		alert("无效操作！");
		location.href='superAdmin.jsp';
	}
}
</script>
</head>
<body>
<%
	String adminID=request.getParameter("adminID");
%>

修改此管理员密码：
<form method="post" action="superAdmin?action=modifyAdminPassword">
	<input type="hidden" id="adminID" name="adminID" value="<%=adminID%>">
	输入新密码：<input type="password" name="password1"><br>
	确认新密码：<input type="password" name="password2"><br>
	<input type="reset" value="取消">
	<input type="submit" value="提交">
</form>
</body>
</html>