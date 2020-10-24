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
			checkAdminNameInfo.style.fontSize="";
			checkAdminNameInfo.style.fontWeight="";
			
			checkAdminNameInfo.innerHTML="未修改";
			adminNameStatus=2;	// 未修改
			return;
		}
		
		// TODO: 验证用户名是否合法 （不能为空，应该是字母数组组合限制，长度限制）
		if(adminName==""||adminName==null) {
			checkAdminNameInfo.style.color="red";
			checkAdminNameInfo.style.fontSize="";
			checkAdminNameInfo.style.fontWeight="";
			
			checkAdminNameInfo.innerHTML="未填写";
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
					checkAdminNameInfo.style.fontSize="1.4em";
					checkAdminNameInfo.style.fontWeight="bold";
					
					checkAdminNameInfo.innerHTML="&#10003;";	// &#10004;
					
					adminNameStatus=1;	// 合法
				} else {
					checkAdminNameInfo.style.color="red";
					checkAdminNameInfo.style.fontSize="";
					checkAdminNameInfo.style.fontWeight="";
					
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
			checkAdminRealNameInfo.style.fontSize="";
			checkAdminRealNameInfo.style.fontWeight="";
			
			checkAdminRealNameInfo.innerHTML="未修改";
			return 2;
		}
		
		// TODO: 验证用户真实姓名是否合法 （不能为空，姓开头的汉字组合）
		if(adminRealName==""||adminRealName==null) {
			checkAdminRealNameInfo.style.color="red";
			checkAdminRealNameInfo.style.fontSize="";
			checkAdminRealNameInfo.style.fontWeight="";
			
			checkAdminRealNameInfo.innerHTML="未填写";
			return 0;
		}
		
		checkAdminRealNameInfo.style.color="green";
		checkAdminRealNameInfo.style.fontSize="1.2em";
		checkAdminRealNameInfo.style.fontWeight="bold";
		
		checkAdminRealNameInfo.innerHTML="&#10003;";
		
		return 1;
	}
	
	function checkAdminPhoneNum() {
		var oldAdminPhoneNum=document.getElementById("oldAdminPhoneNum").innerText;
		var adminPhoneNum=document.getElementById("adminPhoneNum").value;
		
		
		var checkAdminPhoneNumInfo=document.getElementById("checkAdminPhoneNumInfo");
		
		if(oldAdminPhoneNum==adminPhoneNum) {
			checkAdminPhoneNumInfo.style.color="blue";
			checkAdminPhoneNumInfo.style.fontSize="";
			checkAdminPhoneNumInfo.style.fontWeight="";
			
			checkAdminPhoneNumInfo.innerHTML="未修改";
			return 2;
		}
		
		// TODO: 验证手机号码是否合法
		if(adminPhoneNum==""||adminPhoneNum==null) {
			checkAdminPhoneNumInfo.style.color="red";
			checkAdminPhoneNumInfo.style.fontSize="";
			checkAdminPhoneNumInfo.style.fontWeight="";
			
			checkAdminPhoneNumInfo.innerHTML="未填写";
			return 0;
		}
		
		checkAdminPhoneNumInfo.style.color="green";
		checkAdminPhoneNumInfo.style.fontSize="1.2em";
		checkAdminPhoneNumInfo.style.fontWeight="bold";
		
		checkAdminPhoneNumInfo.innerHTML="&#10003;";
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
						name="adminName" onblur="checkAdminName()" value="${admin[1]}">
				</div>
				<span id="checkAdminNameInfo" class="help-block"></span>
			</div>
			<div class="form-group">
				<label for="adminRealName" class="col-md-2 control-label text-right" style="padding-right:0px;">姓名：</label>
				<div class="col-md-3">
					<input type="text" class="form-control" id="adminRealName"
						name="adminRealName" onblur="checkAdminRealName()"
						value="${admin[2]}">
				</div>
				<span id="checkAdminRealNameInfo" class="help-block"></span>
			</div>
			<div class="form-group">
				<label for="adminPhoneNum" class="col-md-2 control-label text-right" style="padding-right:0px;">电话号码：</label>
				<div class="col-md-3">
					<input type="text" class="form-control" id="adminPhoneNum"
						name="adminPhoneNum" onblur="checkAdminPhoneNum()"
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