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
    <title>超级管理员密码修改</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
      crossorigin="anonymous"
    />

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
			height: 150px;
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
			top:12px;
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
			height: 450px;
			margin-top:20px;
			margin-bottom: 20px;
		}
		.main-container > .wrap-main{
			background-color: #fff;
			height: 450px;
			padding-top: 40px;
			padding-left: 50px;
			padding-right: 50px;
		}
		.main-container > .wrap-main > form > h1{
			font-size: 25px;
			font-weight: bold;
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
      
      <div class="top">
        <!-- 控制内容不超出安全区域的容器 -->
        <div class="wrap">
           问题反馈：15129056163 
          <!--   &emsp;&emsp;&emsp;&emsp;<a href="login.html">登录</a>/<a href="userForgotPassword.html">忘记密码</a> -->
        </div>
      </div>
      
      <!-- 导航栏 -->
	<nav class="nav">
		<div class="wrap wrap-nav">
			<!-- logo -->
			<img src="img/Logo.png" class="logo"/>
			<!-- 导航栏条目 -->
			<div class="nav-item">
				<a href="#">首页</a>
				<a href="#">联系人</a>
				<a href="logManagement.jsp">日志</a>
				<a href="#"  class="nav-current-item">管理</a>
				<a href="userInfo.jsp">用户信息</a>
			</div>
			</div>
	</nav>
    </div>
    <!-- 超级管理员密码修改模块 -->
    <div class="main-container">
      <div class="wrap wrap-main">
        <form role="form" id="form">
          <h1>超级管理员密码修改</h1>
          <hr/>
            <div class="form-group">
			  <label for="name">输入新密码</label>
              <input type="password" id="password1" name="password1" class="form-control" style="width: 300px;" >
            </div>
            <div class="form-group">
              <label for="name">确认新密码</label>
              <input type="password" id="password2" name="password2" class="form-control" style="width: 300px;" >
            </div>
			<button type="reset" class="btn btn-default" id="reset" value="取消">取消</button>
			<button type="submit" class="btn btn-default" id="submit" value="确认">确认</button>
         </form>
      </div>
  </div>

    <div class="footer">
      <div class="content">
        <p>©网站版权归西北大学软件学院软件实训小组所有</p>
        <p>地址:陕西省长安区郭杜街道西北大学 &nbsp;&nbsp;&nbsp; 邮编:710119</p>
        <p>电子邮箱:404268406@qq.com</p>
      </div>
    </div>

    <script src="js/jquery.min.js"></script>
    <script type="text/javascript">

    </script>
	
  </body>
</html>
