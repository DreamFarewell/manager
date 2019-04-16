<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>批量修改</title>
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
}

.table_style {
	border-right: 1px solid #ffffff;
	border-bottom: 1px solid #ffffff;
	background-color: #CCFEFC;
	border-collapse: collapse;
	text-align: center;
	margin: auto;
	width: 70%;
}

.tr_h_style {
	background-color: #CCFEFC;
	padding-bottom: 0px;
	border-bottom: 1px;
}

.tr_d_style {
	border-left: 1px solid #ffffff;
	border-top: 1px solid #ffffff;
	background-color: #DFF2FE;
	border-bottom: 1px;
}

.td_start_style {
	border-top: 1px solid #ffffff;
}

.td_style {
	border-left: 1px solid #ffffff;
	border-top: 1px solid #ffffff;
}

.page_b {
	border-right: 1px solid #333333;
	border-bottom: 1px solid #333333;
	border-left: 1px solid #CCCCCC;
	border-top: 1px solid #CCCCCC;
	background-color: #EEEEEE;
	padding: 2px 6px 2px 6px;
	text-decoration: none;
	font: bold 11px Arial;
	color: #333333;
}

.input_text {
	background-color: transparent;
	border-color: transparent;
	text-align: center;
	border-bottom: 0px;
	border-right: 0px;
	border-left: 0px;
	border-top: 0px;
	outline: none;
}

.div {
	text-align: center;
}

.page_log {
	padding-left: 10%;
}

.select_bg {
	background-color: transparent;
}
.a_index {
	text-decoration: none;
}
</style>
<script type="text/javascript">
	function updateSubmit() {
		var msg = confirm("确认修改？");
		if (msg) {
			document.myForm.action = "${pageContext.request.contextPath }/employee/employeeBetchUpdateSubmit.action";
			document.myForm.submit();
		}
	}
	function index() {
		document.myForm.action = "${pageContext.request.contextPath}/jsp/index.action"
		document.myForm.submit();
	}
</script>
</head>
<body>
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
	<div align="right" style="padding-right: 15%; padding-bottom: 5px">
		<button class="page_b" onclick="index()">首页</button>
	</div>

	<form name="myForm"
		action="${pageContext.request.contextPath }/employee/employeeBetchUpdateSubmit.action"
		method="post">
		<table class="table_style">
			<tr class="tr_h_style">
				<th class="td_style">姓名</th>
				<th class="td_style">性别</th>
				<th class="td_style">年龄</th>
				<th class="td_style">学历</th>
				<th class="td_style">工资</th>
				<th class="td_style">住址</th>
				<th class="td_style">电话</th>
			</tr>
			<c:forEach items="${employeeList }" var="employee" varStatus="status">
				<input type="hidden" name="employeeList[${status.index }].id"
					value="${employee.id }" />
				<tr class="tr_d_style">
					<td align="center" class="td_start_style"><input
						class="input_text" name="employeeList[${status.index }].name"
						value="${employee.name}" /></td>
					<td align="center" class="td_style"><select class="select_bg"
						id="employeeList[${status.index }].sex" name="sex"><c:if
								test="${employee.sex=='男' }">
								<option value="男">男</option>
								<option value="女">女</option>
							</c:if>
							<c:if test="${employee.sex=='女' }">
								<option value="女">女</option>
								<option value="男">男</option>
							</c:if></select></td>
					<td align="center" class="td_style"><input class="input_text"
						name="employeeList[${status.index }].age" value="${employee.age}"
						onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this)"
						onblur="this.v();" name="age" maxlength="3" /></td>
					<td align="center" class="td_style"><input class="input_text"
						name="employeeList[${status.index }].degree"
						value="${employee.degree}" /></td>
					<td align="center" class="td_style"><input class="input_text"
						name="employeeList[${status.index }].wages"
						value="${employee.wages}" /></td>
					<td align="center" class="td_style"><input class="input_text"
						name="employeeList[${status.index }].address"
						value="${employee.address}" /></td>
					<td align="center" class="td_style"><input class="input_text"
						name="employeeList[${status.index }].phone"
						value="${employee.phone}" /></td>
				</tr>
			</c:forEach>
			<tr align="center" class="tr_d_style" style="padding-top: 10px">
				<td colspan="7" class="td_style"><input type="button"
					class="page_b" value="提交" onclick="updateSubmit()" /></td>
			</tr>
		</table>
	</form>
</c:if>
<c:if test="${userType=='super' }">
	页面找不到了<a class="a_index"
				href="${pageContext.request.contextPath }/super/manageUser.action">返回首页</a>
</c:if>
</body>
</html>