<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改员工信息</title>
<style>
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

.input_text {
	background-color: transparent;
	border-bottom: 0px;
	border-left: 0px;
	border-top: 0px;
	border-right: 0px;
	border-color: transparent;
	outline: none;
}

.page_log {
	padding-left: 10%;
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
</style>
<script type="text/javascript">
	function index() {
		document.myForm.action = "${pageContext.request.contextPath}/jsp/index.action"
		document.myForm.submit();
	}
</script>
</head>
<body>
	<!-- <div align="right"><a href="index.jsp">首页</a>&nbsp;<a href="login.jsp">退出系统</a></div> -->
	<c:if test="${userType=='ordinary' }">
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
	<div>
		<center>
			<h3>修改员工基本信息</h3>
		</center>
		<div>
			<div align="right" style="padding-right: 38.5%; padding-bottom: 5px">
				<button class="page_b" onclick="index()">首页</button>
			</div>
			<center>
				<form name="myForm"
					action="${pageContext.request.contextPath }/employee/employeeUpdateSubmit.action"
					method="post">
					<c:if test="${employee!=null }">
						<input type="hidden" name="id" value="${employee.id }" />
						<table class="table_style" border="1" width="70%" align="center"
							cellpadding="0" cellspacing="1">
							<tr class="tr_d_style">
								<td class="td_style">姓名:</td>
								<td class="td"><input class="input_text" type="text"
									name="name" value="${employee.name}" /></td>
							</tr>
							<tr class="tr_d_style">
								<td class="td_style">性别:</td>
								<td class="tdd"><select class="select_bg" name="sex"><c:if
											test="${employee.sex=='男' }">
											<option value="男">男</option>
											<option value="女">女</option>
										</c:if>
										<c:if test="${employee.sex=='女' }">
											<option value="女">女</option>
											<option value="男">男</option>
										</c:if></select>
							</tr>
							<tr class="tr_d_style">
								<td class="td_style">年龄:</td>
								<td class="td"><input class="input_text" type="text"
									name="age" value="${employee.age}" /></td>
							</tr>
							<tr class="tr_d_style">
								<td class="td_style">学历:</td>
								<td class="td"><input class="input_text" type="text"
									name="degree" value="${employee.degree}" /></td>
							</tr>
							<tr class="tr_d_style">
								<td class="td_style">工资:</td>
								<td class="td"><input class="input_text" type="text"
									name="wages" value="${employee.wages}" /></td>
							</tr>
							<tr class="tr_d_style">
								<td class="td_style">住址:</td>
								<td class="td"><input class="input_text" type="text"
									name="address" value="${employee.address}" /></td>
							</tr>
							<tr class="tr_d_style">
								<td class="td_style">电话:</td>
								<td class="td"><input class="input_text" type="text"
									name="phone" value="${employee.phone}" /></td>
							</tr>
							<tr class="tr_d_style" align="center">
								<td colspan="2" style="padding-top: 5px"><input
									type="submit" value="提交" /></td>
							</tr>
						</table>
					</c:if>
					<br>
				</form>
			</center>
		</div>
	</div>
</c:if>
<c:if test="${userType=='super' }">
页面找不到了<a class="a_index"
			href="${pageContext.request.contextPath }/super/manageUser.action">返回首页</a>
</c:if>
</body>
</html>