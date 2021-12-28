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
	<div class="homeContainer">
		<div class="homeHeader">
			<h1 class="homeTitle">학사 정보 시스템</h1>
		</div>
		<div class="homeMenu">
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
		<div class="homeInfo">
			<h2>소개</h2>
			<p>학사정보시스템은 대학 교육·학사 업무를 원활히 수행하기 위해 제공하는 서비스입니다.<br>
			학기별 이수 학점 조회, 수강 신청, 수강 신청 조회 기능으로 이루어져 있습니다. <br>
			로그인한 사용자만 이용가능합니다.</p>
		</div>
	</div>
</body>
</html>
