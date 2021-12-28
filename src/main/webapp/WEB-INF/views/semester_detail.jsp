<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>학기별 이수 학점 조회</title>
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
		<h2 class="title">학년/학기 별 이수학점 조회 상세보기</h2>
		<table border="1" style="text-align: center;">
			<th>년도</th>
			<th>학기</th>
			<th>교과목명</th>
			<th>교과구분</th>
			<th>담당교수</th>
			<th>학점</th>
			<c:forEach var="offer" items="${offers}">
				<tr>
					<td>${offer.year}</td>
					<td>${offer.semester}</td>
					<td>${offer.name}</td>
					<td>${offer.sort}</td>
					<td>${offer.professor}</td>
					<td>${offer.score}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>