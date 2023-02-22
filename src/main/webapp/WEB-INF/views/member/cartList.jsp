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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/modal.css'/>" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>

	<div class="wrap">
		<div class="subhead">
			<ul>
				<li><i class="fa-solid fa-chevron-left"></i></li>
				<li><span class="subtit">주문하기</span>
			</ul>
		</div>
		<section id="cartlist">
			<div class="st">
				<h3>${list[0].S_NAME}에서주문중!</h3>
			</div>
			<div class="list">
				<ul>
					<c:forEach var="cart" items="${list}">
						<li><ul>

								<li><img
									src="<c:url value='/images/contents/${cart.CP_IMG}.png'/>"></li>
								<li>${cart.CP_NAME}</li>

								<li>${cart.C_OP}</li>
								<li>${cart.C_COUNT}</li>
								<li>${cart.C_PRICE}<input type="hidden" id="price" value="${cart.C_PRICE}"></li>
							</ul></li>
					</c:forEach>
				</ul>
				<div class="cartcount">
					<ul>
						<li>상품금액</li>
						<li><span class="total"><strong> <fmt:formatNumber
												value="${map.P_PRICE}" pattern="#,###" /></strong></span>원</li>
					</ul>
				</div>
			</div>
		</section>
	</div>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17abac5a86d69afad0326b67e47cbd88">
	
</script>

<script src="<c:url value='/js/tab2.js'/>"></script>
<script>

</script>
</html>