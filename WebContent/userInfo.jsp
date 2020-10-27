<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> <!-- for HTML5 -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, 
                                     initial-scale=1.0, 
                                     maximum-scale=1.0, 
                                     user-scalable=no">
    <link rel="stylesheet" href="css/bootstrap.min.css">  
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<title>用户信息</title>
	<style type="text/css">
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
			line-height: 60px;
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
		 #oDiv{
			width: 74px; 
			height: 74px;
			float:left; 
			border-radius: 50%; 
			border:3px solid #eee; 
			overflow: hidden;
            
        }
        .file {
            position: relative;
            display: inline-block;
            background:#166dbe;
            border: 1px solid #e6eaee;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: white;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }
        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }
        .file:hover {
            background: #227baf;
            border-color: #0a649c;
            color: #3f9acf;
            text-decoration: none;
        } 
	</style>
</head>
<body>
<!-- 包括顶部栏和导航栏的整体容器 -->
<div class="header">

	<!-- 导航栏 -->
	<nav class="nav">
		<div class="wrap wrap-nav">
			<!-- logo -->
			<img src="images/Logo.png" class="logo"/>
			<!-- 导航栏条目 -->
			<div class="nav-item">
				<a href="index.jsp">联系人管理</a>
				<a href="logManagement.jsp">日志管理</a>
				<a href="userInfo.jsp" class="nav-current-item">我的信息</a>
			</div>
			</div>
	</nav>
</div>
<div class="main-container">
	<div class="wrap wrap-main">
		<div class="panel panel-primary">
    		<div class="panel-heading">
        		<h3 class="panel-title">用户信息</h3>
    		</div>
    		<div class="panel-body">
				


        		 <table class="table">
					<!-- <div style="width:400px; height:90px; padding-left:10px; 
					            padding-top:10px; background-color:white;
					            border-radius:49px 0px 49px 0px ;">
						<div style="width: 74px; height: 74px; float:left; 
									border-radius: 50%; border:
									3px solid #eee; overflow: hidden;">
							<img src="img/ydf.jpg" width="80" height="80" />
						</div>
						<div style="float:left; margin-left:50px; color:rgb(10, 102, 177);">
							<br />
							<span>151****6163</span>
							<br />
							<span>姚登方</span>
						</div> -->
						<div class="col-md-2">
								<!--   <div id="oDiv"></div> -->
								  <img alt="" src="images/ydf.JPG" width="85%" style="border:2px solid skyblue; border-radius:50%; margin-top:20px;">
							<a href="javascript:;" class="file">更换头像
								<input type="file" name="" id="oInput">
							</a>
					</div>
					<tr><td>用户名</td><td>姚登方</td></tr>
					<tr><td>联系电话</td><td>15129056163</td></tr>
					<tr><td>企业名称</td><td>西北大学</td></tr>
        			<tr><td>邮箱地址</td><td>404268406@qq.com</td></tr>
        			<tr><td></td>
        				<td>
        					<button type="button" class="btn btn-primary" onclick="location.href='userInfoEdit.jsp'">编辑用户信息</button>
        				</td>
        			</tr>
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
        <p>电子邮箱:404268406@qq.com</p>
      </div>
</div>
</body>
<script type="text/javascript">
//头像回显
document.getElementById("oInput").addEventListener("change",function(e){
	
		var files = this.files;
		var img = new Image();
		var render  = new FileReader();
		render.readAsDataURL(files[0]);
		render.onloadstart = function(){
		};
		render.onload = function(){
			img.src = this.result;
			img.style.height = "100%";
			img.style.width = "100%";
			var oDiv = document.getElementById("oDiv");
			oDiv.innerHTML = "";
			oDiv.appendChild(img);
		};
		render.onloadend = function(){
		}
	});
	// 用户名校验
	$(function(){
		$(":input[name='username']").blur(function(){
			var username = $(this).val();
			if(username.length<3 || username.length>30){
				if($('.form-group:first').hasClass('has-success')){
    				$('.form-group:first').removeClass('has-success');
    			}
    			$('.form-group:first').addClass('has-error');
    			$('.inputError:first').css('display','inline-block');
    			$('#send-email').addClass('disabled');
			}else{
				if($('.form-group:first').hasClass('has-error')){
    				$('.form-group:first').removeClass('has-error');
    				$('.inputError:first').css('display','none');
    			}
    			$('#send-email').removeClass('disabled');
    			$('.form-group:first').addClass('has-success');
			}
		});
	});
	// 邮箱格式校验
	$(function(){
  		$(":input[name='email']").blur(function(){
   			var email = $(this).val();
   			var reg = /\w+[@]{1}\w+[.]\w+/;
   			if(reg.test(email)){
    			//$(":input[name='check']").val("email合法");
    			if($('.form-group:last').hasClass('has-error')){
    				$('.form-group:last').removeClass('has-error');
    				$('.inputError:last').css('display','none');
    			}
    			$('.form-group:last').addClass('has-success');
    			$('#send-email').removeClass('disabled');
   			}else{
    			//$(":input[name='check']").val("请输入正确的email地址");
    			if($('.form-group:last').hasClass('has-success')){
    				$('.form-group:last').removeClass('has-success');
    			}
    			$('.form-group:last').addClass('has-error');
    			$('.inputError:last').css('display','inline-block');
    			$('#send-email').addClass('disabled');
   			}
  		});
 	});

 	// 发送请求
 	// “发送邮箱验证码”按钮绑定事件
	$('#send-email').on('click',function(event){
		var username = $('#username').val();
		var email = $('#email').val();
		var data = {'username':username,'email':email};
		var json_data = JSON.stringify(data);
		console.log(json_data);

		// 后端接口实现后请删除下面两行代码
		$('.wrap-main').empty();
		$('.wrap-main').html("<div class='form-group'><h1>请登录邮箱查看验证码</h1><hr/><input type='text' class='form-control' placeholder='请输入验证码' style='width: 300px;' id='verify-code'></div><button class='btn btn-default' id='verify'>验证</button>");
		
		$.ajax({
			url:"send_email",
			type:"POST",
			async:true,
			dataType:"json",
			data:json_data,
			success:function(data){
				$('#form').empty();
				$('#form').html("<div class='form-group'><h1>请登录邮箱查看验证码</h1><hr/><input type='text' class='form-control' placeholder='请输入验证码' style='width: 300px;' id='verify-code'></div><button type='submit' class='btn btn-default' id='verify'>验证</button>");
			}
		});
	});

	// 校验验证码是否输入
	// $(function(){
 //  		$("#verify-code").blur(function(){
 //  			alert("111");
 //  			var verify_code = $(this).val();

 //   			if(verify_code.length==6){
 //   				// 6位
	// 			if($('.form-group:first').hasClass('has-success')){
 //    				$('.form-group:first').removeClass('has-success');
 //    			}
 //    			$('.form-group:first').addClass('has-error');
 //    			$('.inputError:first').css('display','inline-block');
 //    			$('#verify').addClass('disabled');
	// 		}else{
	// 			// 非6位
	// 			if($('.form-group:first').hasClass('has-error')){
 //    				$('.form-group:first').removeClass('has-error');
 //    				$('.inputError:first').css('display','none');
 //    			}
 //    			$('#verify').removeClass('disabled');
 //    			$('.form-group:first').addClass('has-success');
	// 		}
 //  		});
 // 	});

 	// 发送校验请求
	$(document).on('click','#verify',function(event){
		var verify_code = $('#verify-code').val();
		var data = {'verify_code':verify_code};
		var json_data = JSON.stringify(data);
		console.log(json_data);

		// 后端接口实现后请删除下面两行代码
		$('.wrap-main').empty();
		$('.wrap-main').html("<h1>密码重置成功，新密码已发送至您的邮箱，请登录查看！</h1>");
		
		$.ajax({
			url:"verify",
			type:"POST",
			async:true,
			dataType:"json",
			data:json_data,
			success:function(data){
				$('.wrap-main').empty();
				$('.wrap-main').html("<h1>密码重置成功，新密码已发送至您的邮箱，请登录查看！</h1>");
			}
		});
	});
</script>
</html>