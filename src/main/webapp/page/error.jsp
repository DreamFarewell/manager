<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>错误页面</title>
<style type="text/css">
.a_index {
	text-decoration: none;
}
</style>
</head>
<body>
	<c:if test="${message!=null }">
		<c:forEach items="${message }">
			${message }
		</c:forEach>
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
	</c:if>
</body>
</html>