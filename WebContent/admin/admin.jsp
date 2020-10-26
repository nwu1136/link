<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.link.entity.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理员</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">

</head>
<body>
	<%
		String adminName = (String) session.getAttribute("adminName");

		@SuppressWarnings("unchecked")
		List<User> userList = (List<User>) request.getAttribute("userList");
		if (userList == null) {
	%>
	<jsp:forward page="admin?action=getAllUsers"></jsp:forward>
	<%
		}
	%>


	<div class="container-fluid" style="padding: 0px;">
		<!-- 导航条 -->
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="admin.jsp"><span
						style="color: skyblue; font-size: 20px;">Link工作簿管理系统后台</span></a>
				</div>
				<div class="collapse navbar-collapse" id="admin-navbar-collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="#"><span
								style="font-weight: bold;">用户管理</span></a></li>
						<li><a href="#"><span style="font-weight: bold;">联系人管理</span></a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><p class="navbar-text">
								<span>当前用户：</span><a href="adminInfo.jsp">${adminName}</a>
							</p></li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="col-md-offset-1 col-md-2" style="width:250px;">
			<div class="panel panel-primary" style="height:800px;">
				<div class="panel-heading">
					<h3 class="panel-title text-center">用户操作</h3>
				</div>
				<div class="panel-body">
					<div class="text-center" style="font-size:18px;"><span style="font-weight:bold; color:green; margin-right:5px; text-align:center;">&#43;</span><a href="regist.jsp">创建新用户</a></div>
				</div>
			</div>
		</div>

		<div class="col-md-offset-0  col-md-8">
			<div class="panel panel-info">
				<div class="panel-heading">用户信息列表：</div>
				<table
					class="table table-striped table-bordered table-hover text-center">
					<thead>
						<tr>
							<th class="text-center">用户名</th>
							<th class="text-center">姓名</th>
							<th class="text-center">电话号码</th>
							<th class="text-center">电子邮箱</th>
							<th class="text-center">用户信息管理</th>
							<!-- <th class="text-center" style="color:red;">账号注销</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${userList}">
							<tr>
								<th class="text-center">${user.userName}</th>
								<td>${user.userRealName}</td>
								<td>${user.userPhoneNum}</td>
								<td>${user.userEmail}</td>
								<td><a href="#">信息管理</a></td>
								<!-- <td><button type="button" style="color:red;">删除</button></td> -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>