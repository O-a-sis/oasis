<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/main.css'/>" />
	<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/option.css'/>" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<script src=<c:url value='/js/jquery-1.12.4.min.js'/>></script>
<script src=<c:url value='/js/pslide.js'/>></script>
<title>Oasis</title>

</head>
<body id="main">

	<section class="maintop">
		<div class="wrap">
			<div class="logo">
				<a href=<c:url value='/member/main.oa' />><img
					src="../images/common/logo.png" alt="로고" /></a>
			</div>
			<div class="adtext">
				<p>2023년 흑묘년</p>
				<p class="ptwo">
					O! <span class="pointcolor">신메뉴</span>와 함께해요!
				</p>
			</div>
		</div>
	</section>
	<c:choose>
		<c:when test="${not empty sessionScope.B_NAME}">
			<section class="myinfo">
				<div class="infobox">

					<div class="inforight">
						<a href='/Oasis/member/myMenuBar.oa?B_PHONE=${B_PHONE}'> <strong>${sessionScope.B_NAME}</strong>님
						</a>
					</div>
					<div class="infoleft">
						<ul>
							<li>Ostamp</li>
							<li><strong>${map.STAMP}</strong> / 10★</li>
							<li class="stampbar"><progress id="progress"
									value="${map.STAMP}" min="0" max="10"></progress></li>
						</ul>
					</div>
					<div class="booklink">
						<ul>
							<li><a
								href='/Oasis/member/myCouponList.oa?B_PHONE=${map.B_PHONE }'>COUPON<i
									class="fa-solid fa-ticket"></i></a></li>
							<li>MyCart<i class="fa-solid fa-basket-shopping"></i></li>

						</ul>
					</div>
	

		</div>
		</section>
			</c:when>
		<c:otherwise>
			<section class="myinfo2" style="height:100px;"></section>
		</c:otherwise>
	</c:choose>
	<section class="mainslide">
		<div class="imgslide">
			<ul>
				<c:forEach var="img" items="${mainimg}">
					<li>
						<div class="pwrap">
							<div class="inner">
								<a
									href="<c:url value='/admin/noticeDetail.oa?N_IDX=${img.N_IDX}'/>">
									<img src="/Oasis/img/${img.N_IMAGE}" alt="이미지">
								</a>
							</div>
						</div>
					</li>
				</c:forEach>

			</ul>
		</div>
		<button class="prev">
			<img src="<c:url value='/images/contents/business_prev_m.png'/>"
				alt="이전배너보기" />
		</button>
		<button class="next">
			<img src="<c:url value='/images/contents/business_next_m.png'/>"
				alt="다음배너보기" />
		</button>
	</section>
	<section class="mainmenulist">
		<h3>추천메뉴</h3>
		<div class="menuslide">
			<ul>
				<c:forEach var="menulist" items="${plist}">

					<li><div class="scene">
							<div class="card">
								<div class="card__face card__face--front">
									<img
										src="<c:url value='/images/contents/${menulist.P_IMG}.png'/>"
										alt="" />
								</div>
								<div class="card__face card__face--back">
									<div class="inner2">오아시스 추천!</div>
									<div class="inner" style="font-weight: 700;">${menulist.P_NAME}</div>
									<div class="inner" style="font-size: 14px">${menulist.P_PRICE}원</div>
								</div>
							</div>
						</div></li>


				</c:forEach>
			</ul>

		</div>
	</section>


</body>
<script>
	$(".menuslide").on("click", "ul li div div", function() {
		$(this).toggleClass('is-flipped');
	});
</script>
</html>