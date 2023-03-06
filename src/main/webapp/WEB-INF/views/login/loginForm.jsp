<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/member/main.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/member/sub.css'/>" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<title>메뉴선택</title>

</head>
<body>
	<div class="wrap">
		<div class="subhead"style="text-align: center;margin-bottom:50px;height:100px;">
			<a href=<c:url value='/member/main.oa' />><img src="../images/common/logo.png"
					alt="로고" /></a>
			<ul style="text-align: center;">
				<li></li>
				<li style="margin-right:32%"><span class="subtit">로그인</span></li>
			</ul>
		</div>
		<section id="login">
			<form action="<c:url value='login.oa'/>" method="POST">
				<h3>
					<div class="tag">전화번호</div>
					<input type="text" name="B_PHONE" placeholder="전화 번호를 입력하세요">
				</h3>
				<h3>
					<div class="tag">비밀번호</div>
					<input type="password" name="B_PASSWORD" placeholder="비밀번호를 입력하세요">
				</h3>
				<button type="submit">로그인</button>
				<div class="link">
					<a href='/Oasis/member/joinForm.oa'>회원가입</a> / <a
						href='/Oasis/member/findPw.oa'>비밀번호 찾기</a>
				</div>

			</form>
		</section>
	</div>
</body>
</html>