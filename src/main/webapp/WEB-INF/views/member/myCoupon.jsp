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
				<li><span class="subtit">쿠폰</span>
			</ul>
		</div>
		<section id="coupon">
			<h4>오아시스 COUPON!</h4>
			<div class="clist">
			<ul>
				<c:choose>
						<c:when test="${fn:length(list)>0}">
				<c:forEach var="item" items="${list}">
						<li class="cli"><ul>
								<li>${item.COUPON}!</li>
								<li>${item.CU_PRICE}원</li>
								<li><fmt:formatDate value="${item.CU_LIMIT}"
									pattern="yyyy-MM-dd" /></li>
								<li>x1</li>
							</ul></li>
					</c:forEach>
					</c:when>
					<c:otherwise>
					<li class="cli"><ul><li>
					보유하고 있는 쿠폰이 없습니다.</li></ul>
					</li>
					</c:otherwise>
					</c:choose>
			</ul>
			</div>
			<div class="cinfo">
			<span>쿠폰 유효기간은은 발행일로부터 180일입니다.</br>
모바일주문 전용 쿠폰입니다.</span>
			</div>

		</section>
	</div>
</body>
</html>
