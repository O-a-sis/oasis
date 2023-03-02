
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
				<li><i class="fa-solid fa-chevron-left"></i></li>
				<li><span class="subtit">공지사항</span>
			</ul>
		</div>
		<section id="mnoticedetail">
		<div class="detail">
	<form method="post"
		action="/Oasis/member/noticeDetail.oa?N_IDX=${map.N_IDX}">
		<div class="title">
		<ul>
		<li><c:if test="${map.N_TYPE eq 'B'}">
				<c:set var="type" value="구매자" />
			</c:if>
			<c:if test="${map.N_TYPE eq 'E'}">
				<c:set var="type" value="이벤트" />
			</c:if>[${type}]${map.N_TITLE}<input type="hidden" name="N_TITLE"></li>
				<li><fmt:formatDate value="${map.N_DATE}"
									pattern="yyyy-MM-dd" /></li>
				
		</ul>
		</div>
		<div class="content">
			<div class="contimg">
					<img src="<c:url value='/img/${map.N_IMAGE}'/>" alt="" /><input type="hidden" name="N_IMAGE">
			</div>
			<div class="conttext">
				${map.N_CONTENT}<input type="hidden" name="N_CONTENT">
			</div>
		</div>

		<div class="btncenter">
		<button class="listbtn" type="button"
				onClick="location.href='noticeList.oa'">목록</button>
		</div>

	</form>
	</div>
	</section>
	</div>
</body>
</html>