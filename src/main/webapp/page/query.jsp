<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/table_style.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/a_button_style.css"
	type="text/css" />
<title>查询</title>
<style type="text/css">
body {
	background-image:
		url("${pageContext.request.contextPath}/images/bg.png");
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
	margin-left: 3px;
}

.page_log {
	padding-left: 10%;
}
.a_index {
	text-decoration: none;
}
</style>
<script type="text/javascript">
	function select(){
		var val = document.ElementByName("value").val;
		if(val!=null){
			document.myForm.submit();
		}
	}
	function index(){
		document.myForm.action="${pageContext.request.contextPath}/employee/employeeAllSubmit.action"
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
<div>
	<form name="myForm" action="${pageContext.request.contextPath }/employee/employeeQueryDisplay.action" method="post">
		<div style="padding-bottom: 3px;padding-left: 40%"><font size="2px">查询条件<input type="radio" checked
			name="findType" value="id">员工号<input type="radio"
			name="findType" value="name">员工姓名
		</font><br /> <input type="text" name="value" />
		<button class="page_b" onclick="select()">查找</button></div>
		<hr width="70%">
		<div align="right" style="padding-right: 15%;padding-bottom: 3px"><button class="page_b" onclick="index()">首页</button></div>
		<c:if test="${not empty employeeList }"><table class="table_style" align="center" width="70%">
			<tr class="tr_h_style">
				<th class="td_style">姓名</th>
				<th class="td_style">性别</th>
				<th class="td_style">年龄</th>
				<th class="td_style">学历</th>
				<th class="td_style">工资</th>
				<th class="td_style">住址</th>
				<th class="td_style">电话</th>
				<th class="td_style" colspan="2">操作</th>
			</tr>
			<c:forEach items="${employeeList }" var="employee">
				<input type="hidden" name="employee_id" value="${employee.id }" />
				<tr class="tr_h_style">
					<td align="center" class="td_start_style">${employee.name}</td>
					<td align="center" class="td_style">${employee.sex}</td>
					<td align="center" class="td_style">${employee.age}</td>
					<td align="center" class="td_style">${employee.degree}</td>
					<td align="center" class="td_style">${employee.wages}</td>
					<td align="center" class="td_style">${employee.address}</td>
					<td align="center" class="td_style">${employee.phone}</td>
					<td align="center" class="td_style"><a class="a_button_update"
						href="${pageContext.request.contextPath }/employee/employeeUpdate.action?id=${employee.id}">修改</a></td>
					<td align="center" class="td_style_delete"><a
						class="a_button_delete" onclick="return deleteEmployeeOne()"
						href="${pageContext.request.contextPath }/employee/employeeDeleteSubmit.action?id=${employee.id}">删除</a></td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
		<c:if test="${employee!=null }">
			<table class="table_style"  align="center" width="70%">
			<tr class="tr_h_style">
				<th class="td_style">姓名</th>
				<th class="td_style">性别</th>
				<th class="td_style">年龄</th>
				<th class="td_style">学历</th>
				<th class="td_style">工资</th>
				<th class="td_style">住址</th>
				<th class="td_style">电话</th>
				<th class="td_style" colspan="2">操作</th>
			</tr>
			<tr class="tr_h_style">
				<td align="center" class="td_start_style">${employee.name}</td>
					<td align="center" class="td_style">${employee.sex}</td>
					<td align="center" class="td_style">${employee.age}</td>
					<td align="center" class="td_style">${employee.degree}</td>
					<td align="center" class="td_style">${employee.wages}</td>
					<td align="center" class="td_style">${employee.address}</td>
					<td align="center" class="td_style">${employee.phone}</td>
					<td align="center" class="td_style"><a class="a_button_update"
						href="${pageContext.request.contextPath }/employee/employeeUpdate.action?id=${employee.id}">修改</a></td>
					<td align="center" class="td_style_delete"><a
						class="a_button_delete" onclick="return deleteEmployeeOne()"
						href="${pageContext.request.contextPath }/employee/employeeDeleteSubmit.action?id=${employee.id}">删除</a></td>
			</tr>
			</table>
		</c:if>
		<c:if test="${inexistence!=null }"><div style="margin-left: 15%">${inexistence }</div></c:if>
	</form>
</div>
</c:if>
<c:if test="${userType=='super' }">
	页面找不到了<a class="a_index"
				href="${pageContext.request.contextPath }/super/manageUser.action">返回首页</a>
</c:if>
</body>
</html>