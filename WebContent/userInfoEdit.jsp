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
    <title>个人信息维护</title>
    <link
      rel="stylesheet"
      href="css/bootstrap.min.css"
    />

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
				<a href="index.jsp">联系人管理</a>
				<a href="logManagement.jsp" class="nav-current-item">日志管理</a>
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
        		<h3 class="panel-title">修改个人信息</h3>
    		</div>
    		<div class="panel-body">
        		 <table class="table">
        			<tr><td>用户名</td><td id="1">--</td></tr>
        			
        			<tr><td></td>
        				<td>
        					<button type="button" class="btn btn-primary" id='submit'>确认</button>
        					<button type="button" class="btn btn-primary" id='reset' onclick="location.href='userInfo.jsp'">取消</button>
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

    <script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		//用户名校验
		$(function() {
			$(":input[name='username']").blur(function() {
				var username = $(this).val();
				if (username.length<3 || username.length>30) {
					if ($('.form-group:first').hasClass('has-success')) {
						$('.form-group:first').removeClass('has-success');
					}
					$('.form-group:first').addClass('has-error');
					$('.inputError:first').css('display', 'inline-block');
					$('#send-email').addClass('disabled');
				} else {
					if ($('.form-group:first').hasClass('has-error')) {
						$('.form-group:first').removeClass('has-error');
						$('.inputError:first').css('display', 'none');
					}
					$('#send-email').removeClass('disabled');
					$('.form-group:first').addClass('has-success');
				}
			});
		});
		// 邮箱格式校验
		$(function() {
			$(":input[name='email']").blur(function() {
				var email = $(this).val();
				var reg = /\w+[@]{1}\w+[.]\w+/;
				if (reg.test(email)) {
					//$(":input[name='check']").val("email合法");
					if ($('.form-group:last').hasClass('has-error')) {
						$('.form-group:last').removeClass('has-error');
						$('.inputError:last').css('display', 'none');
					}
					$('.form-group:last').addClass('has-success');
					$('#send-email').removeClass('disabled');
				} else {
					//$(":input[name='check']").val("请输入正确的email地址");
					if ($('.form-group:last').hasClass('has-success')) {
						$('.form-group:last').removeClass('has-success');
					}
					$('.form-group:last').addClass('has-error');
					$('.inputError:last').css('display', 'inline-block');
					$('#send-email').addClass('disabled');
				}
			});
			s
		});
	</script>

</body>
</html>
