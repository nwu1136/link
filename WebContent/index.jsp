<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.link.entity.User"%>
<%@ page import="com.link.entity.Contact"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> <!-- for HTML5 -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, 
                                     initial-scale=1.0, 
                                     maximum-scale=1.0, 
                                     user-scalable=no">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<title>联系人列表</title>
	<style>
		*{
			padding: 0;
			margin: 0;
		}
		body{
			background-color: #f9f9f9;
		}
		.header{
			width:100%;
			height: 100px;
			background-color: #fff;
		}
		.wrap{
			width: 68%;
			margin: 0 auto;
			position: relative;
		}
		.wrap-nav{
			height: 100px;
		}
		.top{
			width:100%;
			height: 50px;
			background-color: #333333;
			line-height: 50px;
			color: #fff;
		}
		.top > .wrap > a{
			color: #fff;
		}
		.logo{
			display: inline-block;
			position: absolute;
			height:50px;
			align-items:center;
			top:24px;
		}
		.nav{
			width:100%;
			height: 100px;
		}
		.nav > .wrap > .nav-item{
			float: right;
			height: 40px;
			position: absolute;
			top:30px;
			right: 0px;
			/*line-height: 100px;*/
		}
		.nav > .wrap > .nav-item > a{
			display: inline-block;
			text-decoration: none;
			width: 100px;
			height: 40px;
			line-height: 40px;
			text-align: center;
			color: #333333;
		}
		.nav > .wrap > .nav-item > a:hover{
			border:1px solid;
			border-radius: 100px;
    		border-left-color: #3287bd;
    		border-right-color: #4eb564;
    		border-top-color: #4eb564;
    		border-bottom-color: #3287bd;
		}
		.nav-current-item{
			border:1px solid;
			border-radius: 100px;
    		border-left-color: #3287bd;
    		border-right-color: #4eb564;
    		border-top-color: #4eb564;
    		border-bottom-color: #3287bd;
		}
		.main-container{
			width: 100%;
			
			margin-top:20px;
			margin-bottom: 20px;
		}
		.main-container > .wrap-main{
			background-color: #fff;
			
			padding-top: 40px;
			padding-left: 50px;
			padding-right: 50px;
			padding-bottom: 20px;
		}
		h1{
			font-size: 25px;
			font-weight: bold;
		}
		.inputError{
			color: red;
			display: none;
		}

		.footer {
  			background: #333333;
  			padding: 1em 0;
  			color: #fff;
		}
		.footer > .content {
  			justify-content: center;
  			align-items: center;
		}
		.footer > .content > p {
  			margin: 0 auto;
  			text-align: center;
		}
		.left{
            float:left;
		margin:0px 45px 0px 5%;
		padding-left: 25px;
		border:1px solid #edeef6;
		border-radius: 10px;
		width:10%;
		height:800px;
		list-style-type: none;
        background: white;
        }
	</style>
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
	
		@SuppressWarnings("unchecked")
		List<Contact> contactList = (List<Contact>) request.getAttribute("contactList");
		if (contactList == null) {
	%>
	<jsp:forward page="user?action=getAllContacts"></jsp:forward>
	<%
		}
	%>
	<!-- 包括顶部栏和导航栏的整体容器 -->
<div class="header">

	<!-- 导航栏 -->
	<nav class="nav">
		<div class="wrap wrap-nav">
			<!-- logo -->
			<img src="images/Logo.png" class="logo"/>
			<!-- 导航栏条目 -->
			
			<div class="nav-item">
				<a href="index.jsp" class="nav-current-item">联系人管理</a>
				<a href="logManagement.jsp">日志管理</a>
				<a href="userInfo.jsp">我的信息${user.userID}</a>
			</div>
			</div>
	</nav>
</div>
<div class="main-container">
	
	<div class="left">
		<li style="align:center;"><img alt="" src="images/ydf.JPG" width="85%" style="border:2px solid skyblue; border-radius:50%; margin-top:20px;"></li>
	    <li style="border:1px solid #edeef6; width:85%;"></li>
	    <li><span style="font-weight:bold; color:green; margin-right:5px; text-align:center;">&#43;</span><a href="userAddContact.jsp">添加联系人</a></li>
	    <li>
		<form action="superAdmin?action=getAdminsByAdminName" method="post">
			<input type="text" name="searchName" placeholder="查找联系人" style="width:80%; height:26px; border:1px solid; border-radius:5px; margin:5px 0px 5px 0px;">
			<input type="submit" value="查找" style="width:33%; height:30px; border:1px solid; border-radius:5px; margin-left:50%; background-color:skyblue;">
		</form>
	    </li>
	</div>

	<div class="wrap wrap-main">
		<div class="panel panel-primary">
    		<div class="panel-heading">
        		<h3 class="panel-title">联系人列表</h3>
    		</div>
    		<div class="panel-body">
        		 <table class="table">
					<!-- <caption>管理员可以在此进行联系人的编辑和查看</caption> -->
					<thead>
					    <tr>
					      <th>姓名</th>
					      <th>企业名称</th>
					      <th>手机号码</th>
					      <th>邮箱地址</th>
					      <th>备注信息</th>
					      <!-- <th>详细信息</th>
					      <th>操作</th> -->
					  	</tr>
					</thead>
					<tbody>
					    <c:forEach var="contact" items="${contactList}">
							<tr>
								<th>${contact.contactName}</th>
								<td>${contact.contactCompany}</td>
								<td>${contact.contactPhoneNum}</td>
								<td>${contact.contactEmail}</td>
								<td>${contact.contactDetails}</td>
								<td><a href="#">修改</a></td>
								<td><a href="#">删除</a></td>
								<!-- <td><button type="button" style="color:red;">删除</button></td> -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
    		</div>
		</div>
	</div>
</div>
<!--页脚-->
<div class="footer">
      <div class="content">
        <p>©网站版权归西北大学软件学院软件实训小组所有</p>
        <p>地址:陕西省长安区郭杜街道西北大学 &nbsp;&nbsp;&nbsp; 邮编:710119</p>
        <p>电子邮箱:1234567890@email.com</p>
      </div>
</div>
</body>
<script type="text/javascript">

</script>
</html>