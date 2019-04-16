<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>成功提示</title>
<style type="text/css">
.a_index {
	text-decoration: none;
}
</style>
</head>
<body>
	操作成功！
	<div>
		<c:if test="${userType=='ordinary' }">
		<a class="a_index"
			href="${pageContext.request.contextPath }/jsp/index.action">返回首页</a>
		</c:if>
		<c:if test="${userType=='super' }">
		<a class="a_index"
			href="${pageContext.request.contextPath }/super/manageUser.action">返回首页</a>
		</c:if>
	</div>
</body>
</html>