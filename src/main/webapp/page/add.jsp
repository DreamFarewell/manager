<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/a_button_style.css"
	type="text/css" />
<style>
form {
	background-color: #DFF2FE;
	height: auto;
	width: 350px;
}

body {
	background-image: url("../images/bg.png");
	background-position: center center;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
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
.input_bg{
	background-color: transparent;
}
.page_log {
	padding-left: 10%;
}
.a_index {
	text-decoration: none;
}
</style>
<script type="text/javascript">
function index(){
	document.myForm.action="${pageContext.request.contextPath}/jsp/index.action"
	document.myForm.submit();
}
</script>
<title>添加新员工</title>
</head>
<body>
	<!--<div align="right"><a href="index.jsp">首页</a>&nbsp;<a href="login.jsp">退出系统</a></div>-->
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
			<h3>添加员工基本信息</h3>
		</center>
		<div>
			<div align="right" style="padding-right: 38.5%; padding-bottom: 5px">
				<button class="page_b" onclick="index()">首页</button>
			</div>
			<center>
				<form name="myForm" action="${pageContext.request.contextPath }/employee/employeeInsertSubmit.action" method="post">
					<table>
						<tr>
							<td><center>姓名:</center></td>
							<td><input class="input_bg" type="text" name="name" maxlength="10"></td>
						</tr>
						<tr>
							<td><center>性别:</center></td>
							<td><select class="input_bg" name="sex"><option value="男">请选择</option><option value="男">男</option>
									<option value="女">女</option></select></td>
						</tr>
						<tr>
							<td><center>年龄:</center></td>
							<td><input type="text" class="input_bg"
								onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this)"
								onblur="this.v();" name="age" maxlength="3"></td>
						</tr>
						<tr></tr>
						<tr>
							<td><center>学历:</center></td>
							<td><input class="input_bg" type="text" name="degree" maxlength="10"></td>
						</tr>
						<tr></tr>
						<tr>
							<td><center>工资:</center></td>
							<td><input class="input_bg" type="text" name="wages" maxlength="11"></td>
						</tr>
						<tr></tr>
						<tr>
							<td><center>住址:</center></td>
							<td><input class="input_bg" type="text" name="address" maxlength="50"></td>
						</tr>
						<tr></tr>
						<!-- onblur="this.v();"失去焦点时也会对输入框的限制 -->
						<tr>
							<td><center>电话:</center></td>
							<td><input class="input_bg" type="text"
								onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)"
								onblur="this.v();" name="phone" maxlength="15"></td>
						</tr>
						<tr></tr>
					</table>
					<center>
						<font size="0.5px" color="red"><c:if
								test="${allErrors!=null}">
								<!-- 显示错误信息 -->
								<c:forEach items="${allErrors}" var="error">
									${error.defaultMessage }<br />
								</c:forEach>
							</c:if></font> <input type="submit" class="page_b"
							value="添加新员工">
					</center>
					<br>
						<!-- <br> <input type="submit" value="查找员工"
						onclick="form1.action='../page/query.jsp'">| <input
						type="submit" value="添加员工"
						onclick="form1.action='../page/add.jsp'">| <input
						type="submit" value="修改员工信息"
						onclick="form1.action='../page/alter.jsp'">| <input
						type="submit" value="删除员工"
						onclick="form1.action='../page/delete.jsp'"> <br>
					<br> -->
				</form>
			</center>
		</div>
	</div>
	</c:if>
	<c:if test="${userType=='super' }">
		页面找不到了 <a class="a_index"
				href="${pageContext.request.contextPath }/super/manageUser.action">返回首页</a>
	</c:if>
</body>
</html>