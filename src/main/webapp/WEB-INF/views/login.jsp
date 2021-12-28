<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>


	<div class="loginForm">
		<h2>Login</h2>

		<c:if test="${not empty errorMsg}">
			<div style="color: #ff0000">
				<h4>${errorMsg}</h4>
			</div>
		</c:if>
		<form method="post" action="<c:url value="login"/>">
			<input type="text" class="inputBox" name="username"> <input
				type="password" class="inputBox" name="password"> <input
				type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<button type="submit" class="loginBtn">로그인</button>
		</form>
	</div>

</body>
</html>