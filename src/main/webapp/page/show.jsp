<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/table_style.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/a_button_style.css"
	type="text/css" />
<style>
body {
	background-image:
		url("${pageContext.request.contextPath}/images/bg.png");
	background-position: center center;
	background-attachment: fixed;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
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

.tb {
	position: absolute;
	top: 390px;
	left: 500px;
}

.a_index {
	text-decoration: none;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/show.js"></script>
<script type="text/javascript">
	function jump() {
		var val = $("input[name=jump]").val();
		if (val != null) {
			$('#ct').attr('href','${pageContext.request.contextPath }/employee/employeeAllSubmit.action?pageNumber='+ val);
		}
		if (val == '') {
			$('#ct').attr('href', '#');
		}
	}
	function deleteEmployee() {
		var msg = confirm("确定删除这些员工的信息吗？");
		if (msg) {
			document.employeeForm.action = "${pageContext.request.contextPath }/employee/employeeBatchDeleteSubmit.action";
			document.employeeForm.submit();
		}
	}
	function deleteEmployeeOne() {
		var msg = confirm("确定删除？")
		if (msg) {
			return true;
		}
		return false;
	}
	function updateEmployee() {
		var msg = confirm("确定修改这些员工的信息吗？");
		if (msg) {
			document.employeeForm.action = "${pageContext.request.contextPath }/employee/employeeBetchUpdatePage.action";
			document.employeeForm.submit();
		}
	}
	function insertEmployee() {
		document.employeeForm.action = "${pageContext.request.contextPath}/jsp/insertPage.action"
		document.empmloyeeForm.submit();
	}
	function selectEmployee() {
		document.employeeForm.action = "${pageContext.request.contextPath}/jsp/queryPage.action"
		document.empmloyeeForm.submit();
	}
</script>
<title>员工基本信息管理系统</title>
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
			<form
				action="${pageContext.request.contextPath }/employee/employeeAllSubmit.action"
				method="post" name="employeeForm">
				<c:if test="${not empty list }">
					<div align="center">
						<div align="right" style="padding-right: 15%; padding-bottom: 5px">
							<button class="page_b" onclick="selectEmployee()">查询员工</button>
							<button class="page_b" onclick="insertEmployee()">添加新员工</button>
							<!-- 批量修改只能对当前页的数据进行修改 -->
							<button class="page_b" onclick="updateEmployee()">批量修改</button>
							<button class="page_b" onclick="deleteEmployee()">批量删除</button>
						</div>
						<table class="table_style" width="70%" cellspacing="1"
							cellpadding="0">
							<tr class="tr_h_style">
								<th class="td_start_style"><input id="all" type="checkbox"
									onclick="chk()" /></th>
								<th class="td_style">姓名</th>
								<th class="td_style">性别</th>
								<th class="td_style">年龄</th>
								<th class="td_style">学历</th>
								<th class="td_style">工资</th>
								<th class="td_style">住址</th>
								<th class="td_style">电话</th>
								<th class="td_style" colspan="2">操作</th>
							</tr>
							<c:forEach items="${list }" var="employee">
								<tr class="tr_h_style">
									<td align="center" class="td_start_style"><input
										type="checkbox" name="employee_id" value="${employee.id }" /></td>
									<td align="center" class="td_start_style">${employee.name}</td>
									<td align="center" class="td_style">${employee.sex}</td>
									<td align="center" class="td_style">${employee.age}</td>
									<td align="center" class="td_style">${employee.degree}</td>
									<td align="center" class="td_style">${employee.wages}</td>
									<td align="center" class="td_style">${employee.address}</td>
									<td align="center" class="td_style">${employee.phone}</td>
									<td align="center" class="td_style"><a
										class="a_button_update"
										href="${pageContext.request.contextPath }/employee/employeeUpdate.action?id=${employee.id}">修改</a></td>
									<td align="center" class="td_style_delete"><a
										class="a_button_delete" onclick="return deleteEmployeeOne()"
										href="${pageContext.request.contextPath }/employee/employeeDeleteSubmit.action?id=${employee.id}">删除</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tb">
						<table>
							<tr>
								<td align="left" class="page_font" rowspan="1"><font
									style="font: lighter 12px Arial;">共</font></td>
								<td>${page.totalRecord }</td>
								<td class="page_font" align="left"><font
									style="font: lighter 12px Arial; padding-right: 50px">条记录</font></td>
								<td align="left" class="page_font" rowspan="4"><font
									style="font: lighter 12px Arial;">第</font></td>
								<td>${page.pageNumber }</td>
								<td class="page_font" align="left"><font
									style="font: lighter 12px Arial;">页</font></td>
								<td>/</td>
								<td class="page_font" align="left"><font
									style="font: lighter 12px Arial;">共</font></td>
								<td>${page.totalPage }</td>
								<td class="page_td_style_left" align="left"><font
									style="font: lighter 12px Arial;">页</font></td>
								<td align="right"><a class="page_b"
									href="${pageContext.request.contextPath }/employee/employeeAllSubmit.action?pageNumber=1">首页</a></td>
								<td align="right"><c:if test="${page.pageNumber - 1 > 0 }">
										<a
											href="${pageContext.request.contextPath }/employee/employeeAllSubmit.action?pageNumber=${page.pageNumber-1}"
											class="page_b">上一页</a>
									</c:if> <c:if test="${page.pageNumber-1 <= 0 }">
										<a
											href="${pageContext.request.contextPath }/employee/employeeAllSubmit.action?pageNumber=1"
											class="page_b">上一页</a>
									</c:if></td>
								<td align="right"><c:if test="${page.totalPage == 0 }">
										<a
											href="${pageContext.request.contextPath }/employee/employeeAllSubmit.action?pageNumber=${page.pageNumber}"
											class="page_b">下一页</a>
									</c:if> <c:if test="${page.pageNumber + 1 < page.totalPage }">
										<a
											href="${pageContext.request.contextPath }/employee/employeeAllSubmit.action?pageNumber=${page.pageNumber + 1}"
											class="page_b">下一页</a>
									</c:if> <c:if test="${page.pageNumber + 1 >= page.totalPage }">
										<a
											href="${pageContext.request.contextPath }/employee/employeeAllSubmit.action?pageNumber=${page.totalPage}"
											class="page_b">下一页</a>
									</c:if></td>
								<td align="right"><c:if test="${page.totalPage == 0 }">
										<a
											href="${pageContext.request.contextPath }/employee/employeeAllSubmit.action?pageNumber=${page.pageNumber}"
											class="page_b">尾页</a>
									</c:if> <c:if test="${page.totalPage != 0 }">
										<a
											href="${pageContext.request.contextPath }/employee/employeeAllSubmit.action?pageNumber=${page.totalPage}"
											class="page_b">尾页</a>
									</c:if></td>
								<td align="right"><font style="font: lighter 12px Arial;">转到</font><input
									type="text" size="4" name="jump"
									onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9]+/,'');}).call(this)"
									onblur="this.v();"
									style="height: 12px; width: 20px; border: 1px solid #999999"><font
									style="font: lighter 12px Arial;">页</font><a id="ct" href=""
									class="page_b" onclick="jump()">跳转</a></td>
						</table>
					</div>
				</c:if>
			</form>
		</div>
	</c:if>
	<c:if test="${userType=='super' }">
		页面找不到了<a class="a_index"
			href="${pageContext.request.contextPath }/super/manageUser.action">返回首页</a>
	</c:if>
</body>
</html>