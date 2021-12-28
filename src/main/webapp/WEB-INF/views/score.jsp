<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>학기/년도 별 상세정보</title>
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




		<h2 class="title">학년/학기별 이수학점 조회</h2>
		<div class="tableBox">
			<table border="1" style="text-align: center;">
				<th>년도</th>
				<th>학기</th>
				<th>취득 학점</th>
				<th>상세보기</th>
				<c:forEach var="offer" items="${offers}">
					<tr>
						<td>${offer.year}</td>
						<td>${offer.semester}</td>
						<td>${offer.score}</td>
						<td><a
							href="${pageContext.request.contextPath}/offer/semesterDetail?year=${offer.year}&semester=${offer.semester}">상세보기</a></td>
					</tr>
				</c:forEach>
				<tr>
					<td>총계</td>
					<td></td>
					<td>${totalScore}</td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>

</body>
</html>