<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>日志管理</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />

<style>
* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

ul, ol {
	list-style: none;
}

*::after, *::before {
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
	height: 150px;
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

.top>.wrap>a {
	color: #fff;
}

.logo {
	display: inline-block;
	position: absolute;
	height: 50px;
	align-items: center;
	top: 12px;
}

.nav {
	width: 100%;
	height: 100px;
}

.nav>.wrap>.nav-item {
	float: right;
	height: 40px;
	position: absolute;
	top: 30px;
	right: 0px;
	/*line-height: 100px;*/
}

.nav>.wrap>.nav-item>a {
	display: inline-block;
	text-decoration: none;
	width: 100px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	color: #333333;
}

.nav>.wrap>.nav-item>a:hover {
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

.footer>.content {
	justify-content: center;
	align-items: center;
}

.footer>.content>p {
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
           问题反馈：
          15129056163   <!-- <a href="#"> </a> --> 
        </div>
      </div>
      
      <!-- 导航栏 -->
	<nav class="nav">
		<div class="wrap wrap-nav">
			<!-- logo -->
			<img src="images/Logo.png" class="logo"/>
			<!-- 导航栏条目 -->
			<div class="nav-item">
				<a href="#">首页</a>
				<a href="#">联系人</a>
				<a href="#" class="nav-current-item">日志</a>
				<a href="#">管理</a>
				<a href="userInfo.jsp">用户信息</a>
			</div>
			</div>
	</nav>
    </div>
    <!-- 日志模块 -->
    <div class="main-container">
	<div class="wrap wrap-main">
		<div class="panel panel-primary">
    		<div class="panel-heading">
        		<h3 class="panel-title">日志</h3>
    		</div>
    		<div class="panel-body">
        		 <table class="table">
        			<tr><td>日志编号</td><td id="1">2020100901</td></tr>
        			<tr><td>日志类型</td>
        				<td id="">
	    					<label class="radio-inline">
	        					<input type="radio" name="optionsRadiosinline" id="optionsRadios1" value="1" checked>项目日志
	    					</label>
	   						<label class="radio-inline">
	        					<input type="radio" name="optionsRadiosinline" id="optionsRadios2"  value="2">工作日常
	    					</label>
	    					<label class="radio-inline">
	        					<input type="radio" name="optionsRadiosinline" id="optionsRadios3" value="3">其他
	    					</label>
	    					
    					</td>
        			</tr>
        			<tr><td>日志内容</td>
        				<td>
   							<textarea class="form-control" rows="6" id='2'></textarea>
        				</td>
        			</tr>
        			<tr><td></td>
        				<td id="3">
        					<button type="button" class="btn btn-primary" id='submit'>提交日志</button>

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
  </body>
</html>
