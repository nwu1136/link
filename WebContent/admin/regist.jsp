<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>创建管理员</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
	body {
		background-image: url("../images/nwu05.jpg");
    	background-repeat: no-repeat;
    	background-attachment: fixed;
    	background-size: cover;
	}
</style>
</head>
<body>
	<div class="container">
		<div style="margin-top: 150px;"></div>
		<form class="form-horizontal" method="post"
			action="superAdmin?action=regist" onsubmit="return checkForm()">
			<div class="form-group">
				<div class="col-md-offset-4 col-md-3">
					<h3 class="text-center">创建新管理员</h3>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-4 col-md-3">
					<input type="text" class="form-control" id="adminName"
						name="adminName" onfocus="showAdminNameHelpInfo()"
						onblur="checkAdminName()" placeholder="用户名">
				</div>
				<span id="checkAdminNameInfo" class="help-block"></span>
			</div>
			<div class="form-group">
				<div class="col-md-offset-4 col-md-3">
					<input type="text" class="form-control" id="adminRealName"
						name="adminRealName" onfocus="showAdminRealNameHelpInfo()"
						onblur="checkAdminRealName()" placeholder="姓名">
				</div>
				<span id="checkAdminRealNameInfo" class="help-block"></span>
			</div>
			<div class="form-group">
				<div class="col-md-offset-4 col-md-3">
					<input type="text" class="form-control" id="adminPhoneNum"
						name="adminPhoneNum" onfocus="showAdminPhoneNumHelpInfo()"
						onblur="checkAdminPhoneNum()" placeholder="电话号码">
				</div>
				<span id="checkAdminPhoneNumInfo" class="help-block"></span>
			</div>
			<div class="form-group">
				<div class="col-md-offset-4 col-md-3">
					<input type="password" class="form-control" id="password1"
						name="password1" onfocus="showAdminPassword1HelpInfo()"
						onblur="checkAdminPassword()" placeholder="密码">
				</div>
				<span id="checkAdminPassword1Info" class="help-block"></span>
			</div>
			<div class="form-group">
				<div class="col-md-offset-4 col-md-3">
					<input type="password" class="form-control" id="password2"
						name="password2" onfocus="showAdminPassword2HelpInfo()"
						onblur="checkAdminPassword()" placeholder="确认密码">
				</div>
				<span id="checkAdminPassword2Info" class="help-block"></span>
			</div>
			<div class="form-group">
				<div class="col-md-offset-4 col-md-3">
					<button type="submit" class="btn btn-primary btn-block">注册</button>
				</div>
			</div>

		</form>
	</div>

<script type="text/javascript">

	function showAdminNameHelpInfo() {
		checkAdminNameInfo.style.color="blue";
		checkAdminNameInfo.innerHTML="6-12位字母和数字的组合，并且以字母开头";
	}
	
	function showAdminRealNameHelpInfo() {
		checkAdminRealNameInfo.style.color="blue";
		checkAdminRealNameInfo.innerHTML="用户真实姓名，中文名最长10位，英文名最长20位";
	}
	
	function showAdminPhoneNumHelpInfo() {
		checkAdminPhoneNumInfo.style.color="blue";
		checkAdminPhoneNumInfo.innerHTML="11位手机号码";
	}
	
	function showAdminPassword1HelpInfo() {
		checkAdminPassword1Info.style.color="blue";
		checkAdminPassword1Info.innerHTML="8-16位，包含字母、数字、符号中至少两种";
	}
	
	function showAdminPassword2HelpInfo() {
		checkAdminPassword2Info.style.color="blue";
		checkAdminPassword2Info.innerHTML="再次输入密码以确认";
	}

	var xmlHttp;
	var adminNameStatus;
	function createXMLHttpRequest() {
		if (window.ActiveXObject) { // IE
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}
	
	function checkAdminName() {
		var adminName=document.getElementById("adminName").value;
		var checkAdminNameInfo=document.getElementById("checkAdminNameInfo");
		
		if(adminName=="") {
			checkAdminNameInfo.style.color="red";
			checkAdminNameInfo.innerHTML="用户名不可以为空";
			adminNameStatus=false;
			return;
		}
		
		// 数字字母组合，字母开头，不区分大小写，6-12位
		var reg = /^[a-z](?![a-z]+$)[a-z0-9]{5,11}$/i;
		if(!reg.test(adminName)) {
			checkAdminNameInfo.style.color = "red";
			checkAdminNameInfo.innerHTML = "用户名格式错误";
			adminNameStatus=false;
			return;
		}
		
		createXMLHttpRequest();
		xmlHttp.onreadystatechange=processor;
		xmlHttp.open("GET","superAdmin?action=checkAdminName&adminName="+adminName);
		xmlHttp.send(null);
	}
	
	function processor() {
		var result;
		// var checkAdminNameInfo=document.getElementById("checkAdminNameInfo");
		if(xmlHttp.readyState==4) {
			if(xmlHttp.status==200) {
				result=xmlHttp.responseText;
				if(result==1) {
					checkAdminNameInfo.style.color="green";
					checkAdminNameInfo.innerHTML="&#10004;";
					adminNameStatus=true;
				} else {
					checkAdminNameInfo.style.color="red";
					checkAdminNameInfo.innerHTML="用户名已被注册，请选择其他用户名";
					adminNameStatus=false;
				}
			}
		}
	}
	
	function checkAdminRealName() {
		var adminRealName=document.getElementById("adminRealName").value;
		var checkAdminRealNameInfo=document.getElementById("checkAdminRealNameInfo");
		
		if(adminRealName=="") {
			checkAdminRealNameInfo.style.color="red";
			checkAdminRealNameInfo.innerHTML="姓名不可以为空";
			return false;
		}
		
		// 中文名（2-10位）或英文名(2-20位)
		var reg = /^([a-z.\s]{2,20}|[\u4e00-\u9fa5]{2,10})$/i;
		// .和空格是对于英文名
		var reg2 = /[.\s]{2}/;	// 两个连续的 .或空格
		var reg3 = /^[.\s]|[.\s]$/	// 开头或结尾为 .或空格
		if(!reg.test(adminRealName) || reg2.test(adminRealName) || reg3.test(adminRealName)) {
			checkAdminRealNameInfo.style.color = "red";
			checkAdminRealNameInfo.innerHTML = "姓名格式错误";
			return false;
		}
		
		checkAdminRealNameInfo.style.color="green";
		checkAdminRealNameInfo.innerHTML="&#10004;";
		return true;
	}
	
	function checkAdminPhoneNum() {
		var adminPhoneNum=document.getElementById("adminPhoneNum").value;
		var checkAdminPhoneNumInfo=document.getElementById("checkAdminPhoneNumInfo");
		
		if(adminPhoneNum=="") {
			checkAdminPhoneNumInfo.style.color="red";
			checkAdminPhoneNumInfo.innerHTML="手机号码不可以为空";
			return false;
		}
		
		var reg = /^((13[0-9])|(14[5,6,7,9])|(15[^4])|(16[5,6])|(17[0-9])|(18[0-9])|(19[1,8,9]))\d{8}$/;
		if(!reg.test(adminPhoneNum)) {
			checkAdminPhoneNumInfo.style.color = "red";
			checkAdminPhoneNumInfo.innerHTML = "电话号码格式错误";
			return false;
		}
		
		checkAdminPhoneNumInfo.style.color="green";
		checkAdminPhoneNumInfo.innerHTML="&#10004;";
		return true;
	}
	
	function checkAdminPassword() {
		var password1=document.getElementById("password1").value;
		var password2=document.getElementById("password2").value;
		var checkAdminPassword1Info=document.getElementById("checkAdminPassword1Info");
		var checkAdminPassword2Info=document.getElementById("checkAdminPassword2Info");
		
		if(password1==""&&password2=="") {
			checkAdminPassword1Info.style.color="red";
			checkAdminPassword1Info.innerHTML="密码不可以为空";
			checkAdminPassword2Info.style.color="red";
			checkAdminPassword2Info.innerHTML="确认密码不可以为空";
			return false;
		}
		
		if(password1=="") {
			checkAdminPassword1Info.style.color="red";
			checkAdminPassword1Info.innerHTML="密码不可以为空";
			return false;
		}
		
		// 字母、数字、字符（键盘上1-8对应的字符）至少两种（多于一种）的组合
		var reg = /^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]{8,16}$/;
		if(!reg.test(password1)) {
			checkAdminPassword1Info.style.color = "red";
			checkAdminPassword1Info.innerHTML = "密码格式错误";
			return false;
		}
		
		checkAdminPassword1Info.style.color="green";
		checkAdminPassword1Info.innerHTML="&#10004;";
		
		if(password2=="") {
			checkAdminPassword2Info.style.color="red";
			checkAdminPassword2Info.innerHTML="请再次输入密码以确认";
			return false;
		}
		
		if(password1!=password2) {
			checkAdminPassword2Info.style.color="red";
			checkAdminPassword2Info.innerHTML="二次输入密码不一致";
			return false;
		}
		
		checkAdminPassword2Info.style.color="green";
		checkAdminPassword2Info.innerHTML="&#10004;";
		return true;
	}
	
	function checkForm() {
		checkAdminName();
		var AdminRealName=checkAdminRealName();
		var AdminPhoneNum=checkAdminPhoneNum();
		var AdminPassword=checkAdminPassword();
		/* console.log(adminNameStatus);
		console.log(AdminRealName);
		console.log(AdminPhoneNum);
		console.log(AdminPassword); */

		if(adminNameStatus&&AdminRealName&&AdminPhoneNum&&AdminPassword) return true;
		else return false;
	}
</script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>