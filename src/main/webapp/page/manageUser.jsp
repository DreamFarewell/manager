<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/table_style.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/a_button_style.css"
	type="text/css" />
<style type="text/css">
body {
	background-image:
		url("${pageContext.request.contextPath}/images/bg.png");
	background-position: center center;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
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
.page_log {
	padding-left: 10%;
}
</style>
<script type="text/javascript">
function deleteEmployeeOne() {
	var msg = confirm("确定删除？")
	if (msg) {
		return true;
	}
	return false;
}
function insertUser() {
	document.userForm.action = "${pageContext.request.contextPath}/super/insertUserPage.action"
	document.userForm.submit();
}
</script>
<title>管理用户</title>
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
						<td><font color="#103f69">超级管理员用户:</font></td>
						<td><font color="#0080c0"> ${username }</font><font
							color="#103f69">已登录</font></td>
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
	<form name="userForm"
		action="${pageContext.request.contextPath }/super/manageUser.action"
		method="post">
		<c:if test="${not empty userList }">
			<div align="right" style="padding-right: 30.1%;padding-bottom: 3px;">
			<button class="page_b" onclick="insertUser()">添加新用户</button>
			</div>
			<div align="center">
			<table  class="table_style" width="40%" cellspacing="1"
						cellpadding="0">
				<tr class="tr_h_style">
					<td class="td_style">用户</td>
					<td class="td_style">类型</td>
					<td class="td_style" colspan="2">操作</td>
				</tr>
				<c:forEach items="${userList }" var="list">
					<tr class="tr_h_style" >
						<td align="center" class="td_style">${list.user }</td>
						<td align="center" class="td_style">${list.userType }</td>
						<td align="center" class="td_style"><a
									class="a_button_update"
									href="${pageContext.request.contextPath }/super/updateUserPage.action?id=${list.id}">修改</a></td>
								<td align="center" class="td_style_delete"><a
									class="a_button_delete" onclick="return deleteEmployeeOne()"
									href="${pageContext.request.contextPath }/super/deleteUser.action?username=${list.user}&type=${list.userType}">删除</a></td>
					</tr>
				</c:forEach>
			</table>
			</div>
		</c:if>
	</form>
</c:if>
<c:if test="${userType=='ordinary' }">
	权限不足
	<a class="a_index"
				href="${pageContext.request.contextPath }/jsp/index.action">返回首页</a>
</c:if>
</body>
</html>