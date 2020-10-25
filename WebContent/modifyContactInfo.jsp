<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改联系人信息</title>
</head>
<body>
当前联系人信息：
<ul>
<li>姓名：<span id="oldContactName">${Contact[1]}</span></li>
<li>联系电话：<span id="oldContactPhoneNum">${Contact[2]}</span></li>
<li>企业名称：<span id="oldContactConpany">${Contact[3]}</span></li>
<li>邮箱地址：<span id="oldContactEmail">${Contact[4]}</span></li>
<li>备注信息：<span id="oldContactDetails">${Contact[5]}</span></li>
</ul>

修改此联系人信息：
<form method="post" action="superContact?action=modifyContactInfo" onsubmit="return checkForm()">
	<input type="hidden" id="ContactID" name="ContactID" value="${Contact[0]}">
	姓名：<input type="text" id="ContactName" name="ContactName" onblur="checkContactName()" value="${Contact[1]}"><span id="checkContactNameInfo"></span><br>
	联系电话：<input type="text" id="ContactPhoneNum" name="ContactPhoneNum" onblur="checkContactPhoneNum()" value="${Contact[2]}"><span id="checkContactPhoneNumInfo"></span><br>
	企业名称：<input type="text" id="ContactConpany" name="ContactConpany" onblur="checkContactConpany()" value="${Contact[3]}"><span id="checkContactContactConpanyInfo"></span><br>
	邮箱地址：<input type="text" id="ContactEmail" name="ContactEmail" onblur="checkContactEmail()" value="${Contact[4]}"><span id="checkContactEmailInfo"></span><br>
	备注信息：<input type="text" id="ContactDetails" name="ContactDetails" onblur="checkContactDetails()" value="${Contact[5]}"><span id="checkContactDetailsInfo"></span><br>
	
	<input type="submit" value="提交">
</form>
</body>
</html>