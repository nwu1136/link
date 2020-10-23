<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8" />
    <title>登录</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
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
.top > .wrap > a {
  color: #fff;
}
.logo {
  display: inline-block;
			position: absolute;
			height:50px;
			align-items:center;
			top:12px;
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
      <!-- 顶部栏 -->
      <div class="top">
        <!-- 控制内容不超出安全区域的容器 -->
        <div class="wrap">
          
           问题反馈：15129056163
            <a href="#">登录</a>
        </div>
      </div>
      <!-- 导航栏 -->
      <nav class="nav">
        <div class="wrap wrap-nav">
          <!-- logo -->
			<img src="images/Logo.png" class="logo"/>
        </div>
      </nav>
    </div>
    <!-- 登录模块 -->
    <div class="container" style="margin: 3em auto;">
      <div class="row">
        <div class="col-md-3"></div>
        <div
          class="col-md-6"
          style="box-shadow: 0 0 4px rgb(0, 0, 0); background-color: #f7f7f7;"
        >
          <div class="row">
            <div class="col-md-12" style="text-align: center;">
              <h3>欢迎登录LINK工作簿管理系统</h3>
            </div>
            <div class="col-md-12">
              <form class="form-horizontal" style="margin: 3em;">
                <div class="form-group" style="margin: 2em 1em;">
                  <label for="userName" class="col-sm-2 control-label"
                    >用户名
					
					</label
                  >
                  <div class="col-sm-10">
				  
                    <input
                      type="email"
                      class="form-control"
                      id="userName"
                      placeholder="用户名"
                    />
                  </div>
                </div>
                <div class="alert alert-danger" role="alert" id="userNameInfo">
                  账号不存在
                </div>
                <div class="form-group" style="margin: 2em 1em;">
                  <label for="password" class="col-sm-2 control-label"
                    >密码</label
                  >
                  <div class="col-sm-10">
                    <input
                      type="password"
                      class="form-control"
                      id="password"
                      placeholder="密码"
                    />
                  </div>
                </div>
                <div class="alert alert-danger" role="alert" id="passwordInfo">
                  密码错误
                </div>
                <div class="form-group" style="margin: 2em 1em;">
                  <label for="captcha" class="col-sm-2 control-label"
                    >验证码</label
                  >
                  <div class="col-sm-4">
                    <input
                      type="text"
                      class="form-control"
                      id="captcha"
                      placeholder="验证码"
                    /><img
                      src="https://fuel.e-chnenergy.com/captcha.svl"
                      alt=""
                    />
                  </div>
                </div>
                <div class="alert alert-danger" role="alert" id="captchaInfo">
                  验证码错误
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                    <div class="row" style="text-align: center;">
                      <div class="col-md-4">
                        <button
                          type="button"
                          id="submit"
                          class="btn btn-default"
                        >
                          登录
                        </button>
                      </div>

                      
                      <div class="col-md-4">
                        <a href="#" style="line-height: 34px;">忘记密码?</a>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="col-md-3"></div>
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
    <script
      src="js/bootstrap.min.js"

    ></script>
	<script>
	let $submit = $("#submit");
let $userName = $("#userName");
let $password = $("#password");
let $captcha = $("#captcha");
let $userNameInfo = $("#userNameInfo");
let $passwordInfo = $("#passwordInfo");

let $captchaInfo = $("#captchaInfo");

$userNameInfo.hide();
$passwordInfo.hide();
$captchaInfo.hide();

let inputCheck = (input, inputInfo, info) => {
  input.bind("input propertychange", function (event) {
    if (input.val() === "") {
      inputInfo.show();
      inputInfo.text(info);
    } else {
      inputInfo.hide();
    }
  });
};

inputCheck($password, $passwordInfo, "密码不能为空");
inputCheck($captcha, $captchaInfo, "验证码不能为空");

$userName.bind("input propertychange", function (event) {
  if ($userName.val().length <= 4) {
    $userNameInfo.show();
    $userNameInfo.text("用户名错误,用户名为4-20位数子,字母,下划线");
  } else {
    $userNameInfo.hide();
  }
});


let userInfo = {};
$submit.on("click", function () {
  let inputCorrect = false;
  if ($userName.val() === "") {
    $userNameInfo.text("用户名不能为空");
    $userNameInfo.show();
  } else if ($password.val() === "") {
    $passwordInfo.text("密码不能为空");
    $passwordInfo.show();
  } else if ($captcha.val() === "") {
    $captchaInfo.text("请输入验证码");
    $captchaInfo.show();
  } else {
    $userNameInfo.hide();
    $passwordInfo.hide();
    userInfo.userName = $userName.val();
    userInfo.password = $password.val();
    inputCorrect = true;
  }
  if (inputCorrect) {
    console.log(JSON.stringify(userInfo));
    $.ajax({
      type: "post", //请求类型
      dataType: "json", //请求数据返回类型
      url: "https://aliyun.firehua.top/admin/json_data/sent_data", //请求地址
      data: userInfo,
      success: function (result) {
        //成功
        console.log(result);
        if (result.code === 200) {
          console.log(result);
          console.log("成功");
        } else {
          console.log(result);
          console.log("失败");
        }
      },
      error: function (result) {
        //失败
        console.log(result);
        console.log("异常");
      },
    });
  }
});

	</script>
  </body>
</html>
