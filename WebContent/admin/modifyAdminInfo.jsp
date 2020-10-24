 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员信息修改</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
	body {
		background-image: url("../images/sky02.jpg");
    	background-repeat: no-repeat;
    	background-attachment: fixed;
    	background-size: cover;
	}
</style>
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
	
	// 如果是拼参进来这个页面，而不是从superAdmin.jsp携带数据跳转过来的（页面是没数据的）
	// 就跳到superAdmin.jsp
	window.onload=function() {
		var adminID=document.getElementById("adminID").value;
		if(adminID==""||adminID==null){
			alert('无效操作！');
			location.href='superAdmin.jsp';
		}
	}

	var xmlHttp;
	var adminNameStatus;
	function createXMLHttpRequest() {
		if(window.ActiveXObject) {	// IE
			xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		} else if(window.XMLHttpRequest) {
			xmlHttp=new XMLHttpRequest();
		}
	}
	
	function checkAdminName() {
		var adminID=document.getElementById("adminID").value;
		var adminName=document.getElementById("adminName").value;
		// console.log(adminID);
		// console.log(adminName);
		
		var oldAdminName=document.getElementById("oldAdminName").innerText; // innerHTML
		// console.log(oldAdminName);
		
		var checkAdminNameInfo=document.getElementById("checkAdminNameInfo");
		
		if(adminName==oldAdminName) {
			checkAdminNameInfo.style.color="blue";
			checkAdminNameInfo.innerHTML="未修改";
			adminNameStatus=2;	// 未修改
			return;
		}
		
		// 验证用户名是否合法
		if(adminName=="") {
			checkAdminNameInfo.style.color="red";
			checkAdminNameInfo.innerHTML="未填写";
			adminNameStatus=0;
			return;
		}
		
		var reg = /^[a-z](?![a-z]+$)[a-z0-9]{5,11}$/i;
		if(!reg.test(adminName)) {
			checkAdminNameInfo.style.color = "red";
			checkAdminNameInfo.innerHTML = "格式错误";
			adminNameStatus=0;
			return;
		}
		
		createXMLHttpRequest();
		xmlHttp.onreadystatechange=processor;
		xmlHttp.open("GET","superAdmin?action=checkAdminNameForModify&adminID="+adminID+"&adminName="+adminName);
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
					
					adminNameStatus=1;	// 合法
				} else {
					checkAdminNameInfo.style.color="red";
					checkAdminNameInfo.innerHTML="用户名已被注册，请选择其他用户名";
					
					adminNameStatus=0;	// 不合法
				}
			}
		}
	}
	
	function checkAdminRealName() {
		var oldAdminRealName=document.getElementById("oldAdminRealName").innerText;
		var adminRealName=document.getElementById("adminRealName").value;
		
		var checkAdminRealNameInfo=document.getElementById("checkAdminRealNameInfo");
		
		if(oldAdminRealName==adminRealName) {
			checkAdminRealNameInfo.style.color="blue";
			checkAdminRealNameInfo.innerHTML="未修改";
			return 2;
		}
		
		// 验证用户真实姓名是否合法
		if(adminRealName=="") {
			checkAdminRealNameInfo.style.color="red";
			checkAdminRealNameInfo.innerHTML="未填写";
			return 0;
		}
		
		// 中文名（2-10位）或英文名(2-20位)
		var reg = /^([a-z.\s]{2,20}|[\u4e00-\u9fa5]{2,10})$/i;
		// .和空格是对于英文名
		var reg2 = /[.\s]{2}/;	// 两个连续的 .或空格
		var reg3 = /^[.\s]|[.\s]$/	// 开头或结尾为 .或空格
		if(!reg.test(adminRealName) || reg2.test(adminRealName) || reg3.test(adminRealName)) {
			checkAdminRealNameInfo.style.color="red";
			checkAdminRealNameInfo.innerHTML="格式错误";
			return 0;
		}
		
		checkAdminRealNameInfo.style.color="green";
		checkAdminRealNameInfo.innerHTML="&#10004;";
		return 1;
	}
	
	function checkAdminPhoneNum() {
		var oldAdminPhoneNum=document.getElementById("oldAdminPhoneNum").innerText;
		var adminPhoneNum=document.getElementById("adminPhoneNum").value;
		
		
		var checkAdminPhoneNumInfo=document.getElementById("checkAdminPhoneNumInfo");
		
		if(oldAdminPhoneNum==adminPhoneNum) {
			checkAdminPhoneNumInfo.style.color="blue";
			checkAdminPhoneNumInfo.innerHTML="未修改";
			return 2;
		}
		
		// 验证手机号码是否合法
		if(adminPhoneNum=="") {
			checkAdminPhoneNumInfo.style.color="red";
			checkAdminPhoneNumInfo.innerHTML="未填写";
			return 0;
		}
		
		var reg = /^((13[0-9])|(14[5,6,7,9])|(15[^4])|(16[5,6])|(17[0-9])|(18[0-9])|(19[1,8,9]))\d{8}$/;
		if(!reg.test(adminPhoneNum)) {
			checkAdminPhoneNumInfo.style.color="red";
			checkAdminPhoneNumInfo.innerHTML="格式错误";
			return 0;
		}
		
		checkAdminPhoneNumInfo.style.color="green";
		checkAdminPhoneNumInfo.innerHTML="&#10004;";
		return 1;
	}
	
	function checkForm() {
		checkAdminName();
		var adminRealName=checkAdminRealName();
		var adminPhoneNum=checkAdminPhoneNum();
		// console.log(adminNameStatus+" "+adminRealName+" "+adminPhoneNum);

		if(adminNameStatus==2&&adminRealName==2&&adminPhoneNum==2) // 全部未修改
			return false;
		if(adminNameStatus==0||adminRealName==0||adminPhoneNum==0)	// 有任何一个不合法
			return false;
		return true;
	}
</script>
</head>
<body>
<%
	String[] admin=request.getParameterValues("admin");
	pageContext.setAttribute("admin", admin);
%>
	<div class="container">
		<div style="font-size: 16px; margin: 100px 0px 50px 0px;">
			<div style="font-size: 24px; color: blue; margin:10px 0px;">当前管理员信息：</div>
			<dl class="dl-horizontal">
				<dt>用户名：</dt>
				<dd>
					<span id="oldAdminName">${admin[1]}</span>
				</dd>
				<dt>姓名：</dt>
				<dd>
					<span id="oldAdminRealName">${admin[2]}</span>
				</dd>
				<dt>电话号码：</dt>
				<dd>
					<span id="oldAdminPhoneNum">${admin[3]}</span>
				</dd>
			</dl>
		</div>

		<form class="form-horizontal" method="post"
			action="superAdmin?action=modifyAdminInfo"
			onsubmit="return checkForm()">
			<div class="form-group">
				<div class="text-left" style="font-size: 24px; color: blue;">修改此管理员信息：</div>
			</div>
			<input type="hidden" id="adminID" name="adminID" value="${admin[0]}">
			<div class="form-group">
				<label for="adminName" class="col-md-2 control-label text-right" style="padding-right:0px;">用户名：</label>
				<div class="col-md-3">
					<input type="text" class="form-control" id="adminName"
						name="adminName" onfocus="showAdminNameHelpInfo()" onblur="checkAdminName()" value="${admin[1]}">
				</div>
				<span id="checkAdminNameInfo" class="help-block"></span>
			</div>
			<div class="form-group">
				<label for="adminRealName" class="col-md-2 control-label text-right" style="padding-right:0px;">姓名：</label>
				<div class="col-md-3">
					<input type="text" class="form-control" id="adminRealName"
						name="adminRealName" onfocus="showAdminRealNameHelpInfo()" onblur="checkAdminRealName()"
						value="${admin[2]}">
				</div>
				<span id="checkAdminRealNameInfo" class="help-block"></span>
			</div>
			<div class="form-group">
				<label for="adminPhoneNum" class="col-md-2 control-label text-right" style="padding-right:0px;">电话号码：</label>
				<div class="col-md-3">
					<input type="text" class="form-control" id="adminPhoneNum"
						name="adminPhoneNum" onfocus="showAdminPhoneNumHelpInfo()" onblur="checkAdminPhoneNum()"
						value="${admin[3]}">
				</div>
				<span id="checkAdminPhoneNumInfo" class="help-block"></span>
			</div>
			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<button type="submit" class="btn btn-primary">确认修改</button>
				</div>
			</div>
		</form>
	</div>

	<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>