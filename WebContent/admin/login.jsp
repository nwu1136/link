<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理员登录</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
	body {
		background-image: url("../images/nwu04.jpg");
    	background-repeat: no-repeat;
    	background-attachment: fixed;
    	background-size: cover;
	}
</style>
</head>
<body>
	<div class="container">
		<div style="margin-top: 200px;"></div>
		<div class="col-md-offset-4 col-md-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="text-center">管理员登录</h4>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" action="admin?action=login"
						method="post">
						<div class="form-group">
							<div class="col-md-offset-1 col-md-10 input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
								</div>
								<input type="text" class="form-control" id="username"
									name="username" placeholder="管理员账号" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-1 col-md-10 input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
								</div>
								<input type="password" class="form-control" id="password"
									name="password" placeholder="管理员密码" />
							</div>
						</div>
						<div class="form-group form-inline">
							<div class="col-md-offset-1 col-md-4 input-group">
								<input type="text" class="form-control" id="validatecode"
									name="validateCode" placeholder="验证码">
							</div>
							<span style="margin-left:10px;"><img title="看不清？点击换一张呗" src="ValidateCode"
								onclick="this.src='ValidateCode?num='+Math.random()" /></span>
						</div>
						<div class="form-group">
							<div class="col-md-offset-1 col-md-10 input-group">
								<button type="submit" class="btn btn-primary btn-block">登录</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>