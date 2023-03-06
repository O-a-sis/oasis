
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
				<li><a href="javascript:window.history.back();"><i
						class="fa-solid fa-chevron-left"></i></a></li>
				<li><span class="subtit">주문상세</span>
			</ul>
		</div>
		<section id="myOrderdetail">
			<div class="notice">
				<c:choose>
					<c:when test="${map.O_STATUS  eq '1' }">
						<div class="inner">주문 확인 중입니다.</div>
					</c:when>
					<c:when test="${map.O_STATUS  eq '2' }">
						<div class="inner">
							맛있게 만들고 있어요!<br>남은시간 <span id="timer"></span>분
						</div>
					</c:when>
					<c:otherwise>
						<div class="inner">
							제조가 완료되었습니다.<br>1시간 이내로 찾아가지 않으실 경우<br> 품질 및 보관 문제로 폐기
							될 수 있습니다.
						</div>
					</c:otherwise>

				</c:choose>


			</div>

			<div class="detail1">
				<ul>
					<li>${map.OS_NAME}</li>
					<li>
						<h4>주문번호 :${map.O_IDX}</h4>
					</li>
					<li>${map.O_DATE}</li>
				</ul>
			</div>
			<div class="ostatus">
				<progress style="margin-bottom: 10px" id="progress"
					value="${map.O_STATUS}" min="1" max="3"></progress>
				<ul>

					<c:choose>
						<c:when test="${map.O_STATUS  eq '1' }">
							<li style="color: orange;">주문접수</li>
							<li>제조중</li>
							<li>제조완료</li>
						</c:when>
						<c:when test="${map.O_STATUS  eq '2' }">
							<li>주문접수</li>
							<li style="color: orange;">제조중</li>
							<li>제조완료</li>
						</c:when>
						<c:otherwise>
							<li>주문접수</li>
							<li>제조중</li>
							<li style="color: orange;">제조완료</li>
						</c:otherwise>

					</c:choose>
				</ul>


			</div>
			<div id="linecss">
				<div id="shadow"></div>
			</div>
			<div class="olistd">
				<c:forEach var="item" items="${list}">
					<ul>
						<li><ul>
								<li><img
									src="<c:url value='/images/contents/${item.OM_IMG}'/>"></li>
								<li>${item.OM_NAME}</li>

								<li><c:forEach var="i" items="${item.OM_OP}"
										varStatus="status">
								${i}<c:if test="${!status.last}">/</c:if>
									</c:forEach></li>
								<li><span id="result">${item.OM_COUNT }</span></li>
								<li><span class="price">${item.OM_PRICE}</span></li>
							</ul></li>

					</ul>

				</c:forEach>
			</div>
			<div id="linecss">
				<div id="shadow"></div>
			</div>
			<div class="pabout">
				<ul>
					<li><strong>상품 금액</strong><span>${map.O_SUM+map.coupon.CU_PRICE}원</span></li>
					<li><strong>할인 금액</strong><span> <c:if
								test="${not empty map.coupon}">${map.coupon.CU_PRICE}</c:if>
							<c:if test="${empty map.coupon}">0</c:if>원
					</span></li>
					<li><strong>상품 금액</strong><span>${map.O_SUM}원</span></li>
				</ul>
			</div>
		</section>
	</div>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		let otime = '${map.O_TIME}';
		CountDownTimer(otime, 'timer');
	});
</script>
<script>
	function CountDownTimer(dt, id) {
		var end = new Date(dt);
		var _second = 1000;
		var _minute = _second * 60;
		var _hour = _minute * 60;
		var _day = _hour * 24;
		var timer;
		function showRemaining() {
			var now = new Date();
			var distance = end - now;
			if (distance < 0) {
				clearInterval(timer);
				document.getElementById(id).innerHTML = '0';
				return;
			}
			var minutes = Math.floor((distance % _hour) / _minute);
			document.getElementById(id).innerHTML = minutes;
		}
		timer = setInterval(showRemaining, 1000);
	}
</script>