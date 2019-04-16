<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
form {
	background-color: #DFF2FE;
	height: auto;
	width: 350px;
	margin-top: 5%;
}

body {
	background-image: url("/pic/bg.png");
	background-position: center center;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<title>Login</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
	function valid() {
		var val = $("input[name=user]").val();
		var valp = $("input[name=password]").val();
		if (val == '' || $.trim(val) == '') {
			$("#errorMsg").html('账号不能为空');
			$("#errorMsg").show();
		} else if (valp == '' || $.trim(valp) == '') {
			$("#errorMsg").html('密码不能为空');
			$("#errorMsg").show();
		} else {
			$("#errorMsg").html('');
			myform.submit();
		}
	}
</script>
</head>
<body>
	<center>
		<h3>管理员登录</h3>
	</center>
	<center>
		<form name="myform"
			action="${pageContext.request.contextPath }/login.action"
			method="post">
			<div align="center" style="padding-top: 5px; padding-bottom: 0px">
				<font color="black"
					size="1px">(默认类型为管理员)</font><br /> <select style="margin-left: 1.5%" name="userType"><option
						value="ordinary">选择用户类型</option>
					<c:if test="${userType=='ordinary' }">
						<option value="ordinary" selected>管理员</option>
						<option value="super">超级管理员</option>
					</c:if>
					<c:if test="${userType=='super' }">
						<option value="ordinary">管理员</option>
						<option value="super" selected>超级管理员</option>
					</c:if>
					
					<c:if test="${userType==null }">
						<option value="ordinary">管理员</option>
						<option value="super">超级管理员</option>
					</c:if>
					</select>
			</div>
			<br /> 账号：<input type="text" style="width: 150px; height: 15px;"
				name="user" value="${user }"/><br /> <br /> 密码：<input type="password"
				style="width: 150px; height: 15px;" name="password" value="${password }"/><br /> <font
				color="red" size="2"> <c:if test="${lose!=null }">
						${lose }
					</c:if> <span id="errorMsg"></span>
			</font> <br /> <a onClick="valid()"><img width="auto" height="auto"
				alt="登录" src="/pic/log.gif"></a><br />
		</form>
	</center>
</body>
</html>