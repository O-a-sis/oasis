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
				<li><span class="subtit">스탬프</span>
			</ul>
		</div>
		<section id="stamp">
			<h4>오아시스 !</h4>
			<div class="slist">
			<div class="bom">
			<ul>
<c:if test="${map.STAMP > 0}">
												<c:forEach var="i" begin="1" end="${map.STAMP}">
										<li><img src="../images/common/stamp_on.png" /></li>
										</c:forEach>
												<c:forEach var="i" begin="1" end="${10-map.STAMP}">
										<li><img src="../images/common/stamp_none.png"/></li>
										</c:forEach>
											</c:if>
			</ul>
			</div>
			</div>
			<div class="sinfo">
			<span>스탬프는 메뉴당 1개씩 지급됩니다.</br>
10개가 채워지면 자동으로 쿠폰이 발급됩니다.</span>
			</div>

		</section>

		</div>
</body>
</html>