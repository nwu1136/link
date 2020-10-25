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
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<title>日志管理</title>
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
				<a href="logManagement.jsp" class="nav-current-item">日志管理</a>
				<a href="userInfo.jsp">我的信息</a>
			</div>
			</div>
	</nav>
</div>
<div class="main-container">
	
	<div class="left">
	    <li style="border:1px solid #edeef6; width:85%;"></li>
	    <li><span style="font-weight:bold; color:green; margin-right:5px; text-align:center;">&#43;</span><a href="logDetail.jsp">新建日志</a></li>
	    <li>
		<form action="superAdmin?action=getAdminsByAdminName" method="post">
			<input type="text" name="searchName" placeholder="查找日志" style="width:80%; height:26px; border:1px solid; border-radius:5px; margin:5px 0px 5px 0px;">
			<input type="submit" value="查找" style="width:33%; height:30px; border:1px solid; border-radius:5px; margin-left:50%; background-color:skyblue;">
		</form>
	    </li>
	</div>

	<div class="wrap wrap-main">
		<div class="panel panel-primary">
    		<div class="panel-heading">
        		<h3 class="panel-title">日志列表</h3>
    		</div>
    		<div class="panel-body">
        		 <table class="table">

					<thead>
					    <tr>
					      <th>日志摘要</th>
					      <th>创建时间</th>
					      <th>最后修改时间</th>
					      
					  	</tr>
					</thead>
					<tbody>
					    
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
	// 前端期待后端接口返回的数据格式为
    var data = {'data':[
    						{'日志摘要':'今天做了两个前端页面，心情很复杂，明天','创建时间':'2020/10/10','最后修改时间':'2020/10/11'},
    						{'日志摘要':'前端期待后端接口返回的数据格式为','创建时间':'2020/10/15','最后修改时间':'2020/10/15'},
    						{'日志摘要':'学习后端的一天','创建时间':'2020/10/20','最后修改时间':'2020/10/21'},
    						{'日志摘要':'...','创建时间':'2020/10/21','最后修改时间':'2020/10/21'},
    						{'日志摘要':'...','创建时间':'2020/10/25','最后修改时间':'2020/10/25'},
    				   ]
    		    };


    // 发送请求，获取页面初始数据
	$(function(){
        $.ajax({
            url:"url",
            type:"get",
            success: function(data){
            	var tbody = $('tbody');
			    for(var i=0;i<data['data'].length;i++){
			        //console.log(tdArray[i].text());
			        var tr = $("<tr></tr>");
			        var td1 = $("<td>"+ data['data'][i]['日志摘要'] +"</td>");
			        var td2 = $("<td>"+ data['data'][i]['创建时间'] +"</td>");
			        var td3 = $("<td>"+ data['data'][i]['最后修改时间'] +"</td>");
			        var td4 = $("<td></td>");

			        var button = $("<button type='button' class='btn btn-success'>查看</button>");
			        td6.append(button);

			        tr.append(td1);
			        tr.append(td2);
			        tr.append(td3);
			        tr.append(td4);

			        tbody.append(tr);
			    }
            },
           // error: function(e){
           // 	alert("请求失败:"+e.status);
           // }
        });

    })

	// 后台接口实现后请删除以下代码
    var tbody = $('tbody');
    for(var i=0;i<data['data'].length;i++){
        //console.log(tdArray[i].text());
        var tr = $("<tr></tr>");
        var td1 = $("<td>"+ data['data'][i]['日志摘要'] +"</td>");
		var td2 = $("<td>"+ data['data'][i]['创建时间'] +"</td>");
		var td3 = $("<td>"+ data['data'][i]['最后修改时间'] +"</td>");
		var td4 = $("<td>"+ data['data'][i]['邮箱地址'] +"</td>");
		var td5 = $("<td>"+ data['data'][i]['详细信息'] +"</td>");
        var td6 = $("<td></td>");

        var button = $("<button type='button' class='btn btn-success'>查看</button>");
        var button2 = $("<button type='button' class='btn btn-primary'>编辑</button>");
        var button3 = $("<button type='button' class='btn btn-danger'>删除</button>");
        td6.append(button);
        td6.append(button2);
        td6.append(button3);
        
        tr.append(td1);
        tr.append(td2);
        tr.append(td3);
        tr.append(td4);
        tr.append(td5);
        tr.append(td6);
        tbody.append(tr);
    }
    // 后台接口实现后请删除以上代码
    
    // 为按钮绑定事件
    $('.btn').on('click',function(event){
    	var action = $(this).text();
    	var tds = $(this).parent().parent().children();

    	var data_array = new Array();
    	for(var i=1;i<tds.length;i++){
    		//console.log(tds[i]);
    		data_array[i] = tds[i].textContent;

    	}

    	
    	var data = {
    		'日志摘要':data_array[1],'创建时间':data_array[2],'最后修改时间':data_array[3],'邮箱地址':data_array[4],'详细信息':data_array[5],'action':action
    	}

    	console.log(data);
    	var json_data = JSON.stringify(data);

    	// 发送请求
    	$.ajax({
			url:"url",
			type:"POST",
			async:true,
			dataType:"json",
			data:json_data,
			success:function(data){
				
			},
            error: function(e){
            	console.log(data['action']);
            	if(data['action']=="编辑"){
            		window.location='modifyContactInfo.jsp?id='+data['id']+'';
            	}
            }
		});
    });
</script>
</html>