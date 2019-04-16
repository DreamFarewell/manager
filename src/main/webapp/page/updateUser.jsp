<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/a_button_style.css"
	type="text/css" />
<title>用户信息修改</title>
<style type="text/css">
body {
	background-image:
		url("${pageContext.request.contextPath}/images/bg.png");
	background-position: center center;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
}

.table_style {
	background-color: #CCFEFC;
	border-right: 1px solid #ffffff;
	border-bottom: 1px solid #ffffff;
	text-align: center;
}

.tr_d_style {
	border-left: 1px solid #ffffff;
	border-top: 3px solid #ffffff;
	border-bottom: 3px;
	background-color: #DFF2FE;
	padding-top: 3px;
	padding-bottom: 3px;
}

.td_style {
	border-left: 1px solid #ffffff;
	border-top: 1px solid #ffffff;
}

form {
	background-color: #DFF2FE;
	height: auto;
	width: 350px;
}

.page_log {
	padding-left: 10%;
}

.a_index {
	text-decoration: none;
}

.page_b {
	font: bold 11px Arial;
	text-decoration: none;
	background-color: #EEEEEE;
	color: #333333;
	padding: 2px 6px 2px 6px;
	border-top: 1px solid #CCCCCC;
	border-right: 1px solid #333333;
	border-bottom: 1px solid #333333;
	border-left: 1px solid #CCCCCC;
}

.input_bg {
	background-color: transparent;
}

.td {
	text-align: right;
}

.tdd {
	padding-right: 35%;
}

.select_bg {
	background-color: transparent;
}
</style>
<script type="text/javascript">
function index() {
	document.myForm.action = "${pageContext.request.contextPath}/jsp/index.action"
	document.myForm.submit();
}
function home() {
	document.myForm.action = "${pageContext.request.contextPath}/jsp/home.action"
	document.myForm.submit();
}
</script>
</head>
<body>
	<c:if test="${userType=='super' }">
		<div>
			<img src="${pageContext.request.contextPath}/images/logo.png">
			<div class="page_log">
				<c:if test="${username==null }">
			登录后才能进行操作，请<a
						href="${pageContext.request.contextPath }/employee/employeeUpdate.action">登录</a>
				</c:if>
				<c:if test="${username!=null }">
					<table>
						<tr>
							<td><font color="#103f69">当前用户:</font></td>
							<td><font color="#0080c0"> ${username }</font></td>
						</tr>
					</table>
					<table>
						<tr>
							<td style="border-left: 2px; border-color: black;"><a
								class="log_o"
								href="${pageContext.request.contextPath }/logout.action"><font
									size="1">退出登录</font></a></td>
						</tr>
					</table>
				</c:if>
			</div>
		</div>
		<div align="center">
			<form name="myForm"
				action="${pageContext.request.contextPath }/super/updateUser.action"
				method="post">
				<input type="hidden" name="id" value="${userCustom.id }" />
				<div align="right" style="padding-bottom: 3px"><button class="page_b" onclick="home()">首页</button></div>
				<div align="center">
					<table class="table_style">
						<tr class="tr_d_style">
							<td class="td_style">用户名:</td>
							<td class="td"><input type="text" class="input_bg"
								name="user" value="${userCustom.user }" /></td>
						</tr>
						<tr class="tr_d_style">
							<td class="td_style">密 码:</td>
							<td class="td"><input class="input_bg" type="text"
								name="password" value="${userCustom.password }" /></td>
						</tr>
						<tr class="tr_d_style">
							<td class="td_style">用户类型:</td>
							<td class="tdd"><select class="select_bg" name="type"><option
										value="ordinary">管理员</option></select></td>
						</tr>
						<tr class="tr_d_style">
							<td align="center" colspan="2"><input type="submit"
								class="page_b" value="提交" /></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</c:if>
	<c:if test="${userType=='ordinary' }">
	权限不足
	<a class="a_index"
			href="${pageContext.request.contextPath }/jsp/index.action">返回首页</a>
	</c:if>
</body>
</html>