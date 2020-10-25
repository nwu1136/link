<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <title>添加联系人</title>
<link rel="stylesheet"
	href="css/bootstrap.min.css" />
<style>
		* {
	  margin: 0px;
	  padding: 0px;
	  box-sizing: border-box;
	}
	ul,
	ol {
	  list-style: none;
	}
	*::after,
	*::before {
	  display: block;
	  box-sizing: border-box;
	}
		* {
  padding: 0;
  margin: 0;
}
body {
  background-color: #f9f9f9;
}
.header {
  width: 100%;
  height: 100px;
  background-color: #fff;
}
.wrap {
  width: 68%;
  margin: 0 auto;
  position: relative;
}
.wrap-nav {
  height: 100px;
}
.top {
  width: 100%;
  height: 50px;
  background-color: #333333;
  line-height: 50px;
  color: #fff;
}
.top > .wrap > a {
  color: #fff;
}
.logo {
  display: inline-block;
			position: absolute;
			height:50px;
			align-items:center;
			top:24px;
}
.nav {
  width: 100%;
  height: 100px;
}
.nav > .wrap > .nav-item {
  float: right;
  height: 40px;
  position: absolute;
  top: 30px;
  right: 0px;
  /*line-height: 100px;*/
}
.nav > .wrap > .nav-item > a {
  display: inline-block;
  text-decoration: none;
  width: 100px;
  height: 40px;
  line-height: 40px;
  text-align: center;
  color: #333333;
}
.nav > .wrap > .nav-item > a:hover {
  border: 1px solid;
  border-radius: 100px;
  border-left-color: #3287bd;
  border-right-color: #4eb564;
  border-top-color: #4eb564;
  border-bottom-color: #3287bd;
}
.nav-current-item {
  border: 1px solid;
  border-radius: 100px;
  border-left-color: #3287bd;
  border-right-color: #4eb564;
  border-top-color: #4eb564;
  border-bottom-color: #3287bd;
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

	</style>
  </head>
  <body>
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
				<a href="userInfo.jsp">用户信息</a>
			</div>
			</div>
	</nav>
    </div>
    <!-- 编辑模块 -->
    <div class="main-container">
	<div class="wrap wrap-main">
		<div class="panel panel-primary">
    		<div class="panel-heading">
        		<h3 class="panel-title">添加联系人</h3>
    		</div>
    		<div class="panel-body">
        		 <table class="table">
                    <tr>
                    <td>用户名</td>
                    <td><input type="email" class="form-control" id="contactName" name="contactName" onfocus="showContactNameHelpInfo()" placeholder="用户名" style="width:200px;"/></td>
                    </tr>
                    
                    <tr>
                    <td>联系方式</td>
                    <td><input type="text" class="form-control" id="contactPhoneNum" placeholder="联系方式" style="width:200px;"/></td>
                    </tr>
                    
                    <tr>
                    <td>企业名称</td>
                    <td><input type="text" class="form-control" id="contactConpany" placeholder="企业名称" style="width:200px;"/></td>
                    </tr>
                    
                    <tr>
                    <td>邮箱地址</td>
                    <td><input type="text" class="form-control" id="contactEmai" placeholder="邮箱地址" style="width:200px;"/></td>
                    </tr>
                    
                    <tr>
                    <td>备注信息</td>
                    <td><input type="text" class="form-control" id="contactDetails" placeholder="备注信息" style="width:200px;"/></td>
                    </tr>
        			
        			<tr><td></td>
        				<td>
        				    <button type="button" class="btn btn-primary" id='submit'>添加</button>
        					<a href="index.jsp">
        					<button type="button" class="btn btn-primary" id='reset' >取消</button>
        					</a>
        					
        				</td>
        			</tr>
    			</table>
    		</div>
		</div>
	</div>
</div>

    <div class="footer">
      <div class="content">
        <p>©网站版权归西北大学软件学院软件实训小组所有</p>
        <p>地址:陕西省长安区郭杜街道西北大学 &nbsp;&nbsp;&nbsp; 邮编:710119</p>
        <p>电子邮箱:404268406@qq.com</p>
      </div>
    </div>

    <!-- <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	    function showContactNameHelpInfo() {
	    checkContactNameInfo.style.color="blue";
		checkContactNameInfo.innerHTML="6-12位字母和数字的组合，并且以字母开头";
	}
	    
	    var xmlHttp;
		var contactNameStatus;
		function createXMLHttpRequest() {
			if (window.ActiveXObject) { // IE
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} else if (window.XMLHttpRequest) {
				xmlHttp = new XMLHttpRequest();
			}
		}
		
		function checkContactName() {
			var contactName=document.getElementById("contactName").value;
			var checkContactNameInfo=document.getElementById("checkContactNameInfo");
			
			if(contactName=="") {
				checkContactNameInfo.style.color="red";
				checkContactNameInfo.innerHTML="用户名不可以为空";
				contactNameStatus=false;
				return;
			}
			}
		
	</script>
</body>
</html>
