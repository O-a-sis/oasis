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
		<div class="subhead">
			<ul>
				<li><a href="javascript:window.history.back();"><i class="fa-solid fa-chevron-left"></i></a></li>
				<li><span class="subtit">이용약관</span>
			</ul>
		</div>
		<section id="ect">
			<h3>오아시스 이용약관</h3>
			<div class="elist">
			개인정보수집 범위 : 이름, 연락처
개인정보수집 및 이용목적 : 온라인 문의 및 상담 자료와 결과 회신
* 매장과 관련된 CS의 경우, 해결 과정 안내 혹은 결과 회신을 위해 매장 관리자(슈퍼바이저,매장점주), 본사 유관부서가 연락을 드릴 수 있습니다.

개인정보수집 및 보유기간 : 개인정보 수집 및 이용에 대한 목적이 달성되면 지체없이 파기하며 최대 보유기간은 1년을 넘기지 아니한다.
			</div>
			<h3>개인정보 처리방침</h3>
			<div class="elist">
개인정보수집 범위 : 이름, 연락처
개인정보수집 및 이용목적 : 온라인 문의 및 상담 자료와 결과 회신
* 매장과 관련된 CS의 경우, 해결 과정 안내 혹은 결과 회신을 위해 매장 관리자(슈퍼바이저,매장점주), 본사 유관부서가 연락을 드릴 수 있습니다.

개인정보수집 및 보유기간 : 개인정보 수집 및 이용에 대한 목적이 달성되면 지체없이 파기하며 최대 보유기간은 1년을 넘기지 아니한다.
</div>
		</section>
	</div>
</body>
</html>
