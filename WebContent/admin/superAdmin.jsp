<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.link.entity.Admin"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>超级管理员</title>
<style type="text/css">
	ul {
		float:left;
		margin:0px 45px 0px 5%;
		padding-left: 25px;
		border:1px solid #edeef6;
		border-radius: 10px;
		width:10%;
		height:800px;
		list-style-type: none;
	}
	ul li {
		margin: 25px 0px;
	}
	table {
		margin-top:25px;
		border: 1px solid rgb(180,180,180);
		border-collapse: collapse;
		letter-spacing: 1px;
		font-size: 0.9em;
		width: 70%;
	}
	table th, td {
		border: 1px solid rgb(190,190,190);
		padding: 5px 10px;
	}
	table td {
		text-align: center;
	}
	table tr:nth-child(even) { background-color: #e4f0f5; }
	table th:first-child { width: 120px; }
	table td:nth-child(2) { width:100px; }
	table td:nth-child(3) { width:150px; }
	table td:nth-child(6) { width:100px; }
	table td:last-child { width:100px; }
	table thead, tfoot {
		background-color: #3f87a6;
		color: #fff;
	}
	table caption {
		padding-bottom: 10px;
		text-align: left;
		font-size: 1.2em;
		font-weight: bold;
	}
</style>
<script type="text/javascript">
	function modifyStatusByAdminID(id, status) {
		location.href="superAdmin?action=modifyStatus&id="+id+"&status="+status;
	}
	
	function submitToModifyAdminInfo(formNum) {
		document.getElementById("adminInfoForm"+formNum).submit();
	}
</script>
</head>
<body>
<%
	@SuppressWarnings("unchecked")
	List<Admin> adminList = (List<Admin>) request.getAttribute("adminList");
	if (adminList == null) {
%>
		<jsp:forward page="superAdmin?action=getAllAdmins"></jsp:forward>
<%
	}
%>

<div style="float:right; width:100%; margin-bottom: 5px;">
	<div style="float:right; margin-right:15px;"><a href="admin?action=logout">[退出]</a></div>
	<div style="float:right; margin-right:5px;"><a href="modifySuperAdminPassword.jsp">[修改密码]</a></div>
	<div style="float:right; margin-right:25px;">当前用户：<span style="color:red;">超级管理员</span></div>
</div>
<hr />

<div>
<ul>
	<li style="align:center;"><img alt="" src="../images/default.jpg" width="85%" style="border:2px solid skyblue; border-radius:50%; margin-top:20px;"></li>
	<li style="border:1px solid #edeef6; width:85%;"></li>
	<li><span style="font-weight:bold; color:green; margin-right:5px; text-align:center;">&#43;</span><a href="regist.jsp">创建新管理员</a></li>
	<li>
		<form action="superAdmin?action=getAdminsByAdminName" method="post">
			<input type="text" name="searchName" placeholder="输入用户名进行查找" style="width:80%; height:26px; border:1px solid; border-radius:5px; margin:5px 0px 5px 0px;">
			<input type="submit" value="查找" style="width:33%; height:30px; border:1px solid; border-radius:5px; margin-left:50%; background-color:skyblue;">
		</form>
	</li>
</ul>
<table>
<caption>管理员信息列表：<span style="color:blue; font-size:0.6em; float:right; text-align:center; margin-top:10px; margin-right:10px;">共${adminList.size()}条管理员信息</span></caption>
<thead>
	<tr>
		<th>用户名</th>
		<th>姓名</th>
		<th>电话号码</th>
		<th>信息管理</th>
		<th>权限管理</th>
		<th>密码管理</th>
		<th>当前状态</th>
		<th>状态管理</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="admin" items="${adminList}">
		<tr>
			<th>${admin.adminName}</th>
			<td>${admin.adminRealName}</td>
			<td>${admin.adminPhoneNum}</td>
			<td>
				<a href="javascript:submitToModifyAdminInfo(${admin.adminID})">修改信息</a>
				<form id="adminInfoForm${admin.adminID}" method="post" action="modifyAdminInfo.jsp">
					<input type="hidden" name="admin" value="${admin.adminID}">
					<input type="hidden" name="admin" value="${admin.adminName}">
					<input type="hidden" name="admin" value="${admin.adminRealName}">
					<input type="hidden" name="admin" value="${admin.adminPhoneNum}">
				</form>
			</td>
			<td><a href='javascript:alert("尚未实现！");'>修改权限</a></td>
			<td>
				<a href='javascript:document.getElementById("adminIDForm${admin.adminID}").submit();'>修改密码</a>
				<form id="adminIDForm${admin.adminID}" method="post" action="modifyAdminPassword.jsp">
					<input type="hidden" name="adminID" value="${admin.adminID}">
				</form>
			</td>
			<td>
				<c:if test="${admin.adminStatus==0}"><span style="color:red;">已禁用</span></c:if>
				<c:if test="${admin.adminStatus==1}"><span style="color:green;">正常状态</span></c:if>
			</td>
			<td>
				<c:if test="${admin.adminStatus==0}"><button onclick="modifyStatusByAdminID(${admin.adminID},1)">启用</button></c:if>
				<c:if test="${admin.adminStatus==1}"><button onclick="modifyStatusByAdminID(${admin.adminID},0)">禁用</button></c:if>
			</td>
		</tr>
	</c:forEach>
</tbody>
</table>
</div>
</body>
</html>