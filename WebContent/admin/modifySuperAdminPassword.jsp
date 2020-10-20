<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>超级管理密码修改</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
	body {
		background-image: url("../images/nwu03.jpg");
    	background-repeat: no-repeat;
    	background-attachment: fixed;
    	background-size: cover;
	}
</style>
</head>
<body>

	<div class="container">
		<div style="margin-top: 200px;"></div>
		<div class="col-md-offset-4 col-md-4">
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h3 class="text-center">超级管理员密码修改</h3>
				</div>
				<div class="panel-body">
					<form action="superAdmin?action=modifySuperAdminPassword"
						method="post" onsubmit="return checkNewPassword()">
						<div id="p1" class="form-group">
							<label>输入新密码</label> <input type="password" class="form-control"
								id="password1" name="password1"
								onfocus="showPassword1HelpInfo()" onblur="checkNewPassword()">
							<span id="p1s" class="" aria-hidden="true"></span> <span
								id="password1HelpInfo" class="help-block" style="color: red;"></span>

						</div>
						<div id="p2" class="form-group">
							<label>确认新密码</label> <input type="password" class="form-control"
								id="password2" name="password2"
								onfocus="showPassword2HelpInfo()" onblur="checkNewPassword()">
							<span id="p2s" class="" aria-hidden="true"></span> <span
								id="password2HelpInfo" class="help-block" style="color: red;"></span>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-danger btn-block">确认修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
	
	function showPassword1HelpInfo() {
		document.getElementById("p1").className="";
		document.getElementById("p1s").className="";
		password1HelpInfo.style.color = "blue";
		password1HelpInfo.innerHTML = "8-16位，包含字母、数字、符号中至少两种";
	}

	function showPassword2HelpInfo() {
		document.getElementById("p2").className="";
		document.getElementById("p2s").className="";
		password2HelpInfo.style.color = "blue";
		password2HelpInfo.innerHTML = "再次输入密码以确认";
	}
	
	function checkNewPassword() {
		var password1=document.getElementById("password1").value;
		var password2=document.getElementById("password2").value;
		var password1HelpInfo=document.getElementById("password1HelpInfo");
		var password2HelpInfo=document.getElementById("password2HelpInfo");
		
		var p1=document.getElementById("p1");
		var p2=document.getElementById("p2");
		var p1s=document.getElementById("p1s");
		var p2s=document.getElementById("p2s");
		
		if(password1==""&&password2=="") {
			password1HelpInfo.style.color="red";
			password1HelpInfo.innerHTML="密码不可以为空";
			password2HelpInfo.style.color="red";
			password2HelpInfo.innerHTML="确认密码不可以为空";
			return false;
		}
		
		if(password1=="") {
			password1HelpInfo.style.color="red";
			password1HelpInfo.innerHTML="密码不可以为空";
			return false;
		}
		
		// 字母、数字、字符（键盘上1-8对应的字符）至少两种（多于一种）的组合
		var reg = /^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]{8,16}$/;
		if(!reg.test(password1)) {
			password1HelpInfo.style.color = "red";
			password1HelpInfo.innerHTML = "密码格式错误";
			return false;
		}
		
		password1HelpInfo.innerHTML = "";
		p1.className="form-group has-success has-feedback";
		p1s.className="glyphicon glyphicon-ok form-control-feedback";
		
		if(password2=="") {
			password2HelpInfo.style.color="red";
			password2HelpInfo.innerHTML="请再次输入密码以确认";
			return false;
		}
		
		if(password1!=password2) {
			password2HelpInfo.style.color="red";
			password2HelpInfo.innerHTML="二次输入密码不一致";
			return false;
		}
		
		password2HelpInfo.innerHTML="";
		p2.className="form-group has-success has-feedback";
		p2s.className="glyphicon glyphicon-ok form-control-feedback";
		return true;
	}
</script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>