<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>수강 신청하기</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
	<div class="homeContainer">

		<div class="homeHeader">
			<h1 class="homeTitle">학사 정보 시스템</h1>
		</div>
		<div class="homeMenu">
			<p>
				<a href="${pageContext.request.contextPath}">home</a>
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/offer/scoreBySemester">학기별
					이수 학점 조회</a>
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/offer/createForm">수강
					신청하기</a>
			</p>
			<p>
				<a href="${pageContext.request.contextPath}/offer/showAddedOffers">수강
					신청 조회</a>
			</p>
		</div>
		<sf:form method="post"
			action="${pageContext.request.contextPath}/offer/docreate"
			modelAttribute="offer">
			<h2 class="title">수강신청</h2>
			<table class="formtable">
				<tr>
					<td>수강년도</td>
					<td><sf:input type="text" path="year" /> <sf:errors
							path="year"  class="alert"/></td>

				</tr>
				<tr>
					<td>학기</td>
					<td><sf:input type="text" path="semester" /> <sf:errors
							path="semester"  class="alert"/></td>
				</tr>
				<tr>
					<td>교과목명</td>
					<td><sf:input type="text" path="name" /> <sf:errors
							path="name"  class="alert"/></td>
				</tr>
				<tr>
					<td>교과구분</td>
					<td><sf:input type="text" path="sort" /> <sf:errors
							path="sort"  class="alert"/></td>
				</tr>
				<tr>
					<td>담당교수</td>
					<td><sf:input type="text" path="professor" /> <sf:errors
							path="professor" class="alert"/></td>
				</tr>
				<tr>
					<td>학점</td>
					<td><sf:input type="text" path="score" /> <sf:errors
							path="score"  class="alert"/></td>
				</tr>
			</table>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<button type="submit" class="loginBtn">수강신청하기</button>
		</sf:form>
	</div>
</body>
</html>