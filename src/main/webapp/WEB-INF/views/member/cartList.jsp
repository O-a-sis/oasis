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
			<c:set var="sum" />

			<div class="list">
				<ul>
					<c:choose>
						<c:when test="${fn:length(list)>0}">
							<c:forEach var="cart" items="${list}">
								<li><ul>

										<li><img
											src="<c:url value='/images/contents/${cart.CP_IMG}.png'/>"></li>
										<li>${cart.CP_NAME}</li>

										<li><c:forEach var="i" items="${cart.C_OP}"
												varStatus="status">
								${i}<c:if test="${!status.last}">/</c:if>
											</c:forEach></li>
										<li>${cart.C_COUNT}</li>
										<li><span>${cart.C_PRICE}</span><input type="hidden"
											name="price" value="${cart.C_PRICE}"></li>
										<li><i class="fa-solid fa-xmark"></i><input type="hidden"
											name="C_IDX" value="${cart.C_IDX}"></li>
									</ul></li>
								<c:set var="sum" value="${sum+cart.C_PRICE}" />
							</c:forEach>
						</c:when>
						<c:otherwise>
						<li>텅</li>
						</c:otherwise>
					</c:choose>
				</ul>


			</div>
		</section>
		<div id="linecss">
			<div id="shadow"></div>
		</div>
		<section id="orderinfo">
			<div class="where">
				<h4>메뉴수령</h4>
				<ul>
					<li style="float: left;"><input type="radio" id="here"
						name="option1" value="1" checked /> <label for="here">매장</label></li>
					<li><input type="radio" name="option1" value="0" id="takeout" />
						<label for="takeout">포장</label></li>
				</ul>
			</div>
			<div class="coupon">
				<div class="line">
					<a href=#none id="show">쿠폰 <i id="chevorn"
						class="fa-solid fa-chevron-down"></i></a>
				</div>
				<div id="hide" class="off" style="display: none">


					<ul class="clist">

						<c:forEach var="item" items="${clist}">
							<li class="cli"><ul>
									<li>${item.COUPON}!</li>
									<li>${item.CU_PRICE}원</li>
									<li><fmt:formatDate value="${item.CU_LIMIT}"
											pattern="yyyy-MM-dd" /></li>

								</ul></li>
						</c:forEach>

					</ul>

				</div>
			</div>
			<div class="how">
				<h4>결제</h4>
				<div class="kakao">
					<button id="" class="kbtn">
						<img src="../images/common/kakao.png" alt="카카오페이">카카오페이로
						결제하기
					</button>
				</div>
			</div>
		</section>
		<div class="total">
			총합 : <span id="totalAmount">${sum}</span>원
		</div>
	</div>
</body>


<script src=<c:url value='/js/cart.js'/>></script>
<script src=<c:url value='/js/jquery-1.12.4.min.js'/>></script>
<script>
	$('#show').on("click", function() {
		if ($('#hide').attr('class') === 'off') {
			$('#hide').slideDown(800);
			$('#hide').removeClass().addClass('on');
			$('#show').find("i").css("transform", "rotate(180deg)");

		} else {
			$('#hide').slideUp(800);
			$('#hide').removeClass().addClass('off');
			$('#show').find("i").css("transform", "rotate(0deg)");
		}
	});

	//삭제 버튼
	$(".list").on(
			"click",
			"i",
			function() {
				let cidx = $(this).closest("li").find("input[name=C_IDX]")
						.val();
				let cartitem = $(this).closest("li").closest("ul")
						.closest("li");
				let cart = {
					C_IDX : cidx
				};
				cartService.remove(cart,
						function(result) {
							cartitem.remove();// li 삭제
							$("#totalAmount").html(
									$("#totalAmount").html()
											- cartitem
													.find("input[name=price]")
													.val()); // total에서 뺌
							console.log(result);
						});
			});
</script>
</html>