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
										<li><a href="#" class="minus"><i id="minus"
												class="fa-solid fa-minus"></i></a> <span id="result">${cart.C_COUNT }</span>
											<a href="#" class="plus"><i id="plus"
												class="fa-regular fa-plus"></i></a></li>
										<li><span class="price">${cart.C_PRICE}</span><input
											type="hidden" name="C_PRICE" value="${cart.C_PRICE}"
											class="menuInfo"><input type="hidden" name="CP_NAME"
											value="${cart.CP_NAME}"><input type="hidden"
											name="CP_IMG" value="${cart.CP_IMG}"><input
											type="hidden" name="C_OP" value="${cart.C_OP}"><input
											type="hidden" name="C_STORE" value="${cart.C_STORE}"><input
											type="hidden" name="CB_IDX" value="${cart.CB_IDX}"><input
											type="hidden" name="CP_IDX" value="${cart.CP_IDX}"><input
											type="hidden" name="C_COUNT" value="${cart.C_COUNT}"></li>
										<li><i id="delete" class="fa-solid fa-xmark"></i><input
											type="hidden" name="C_IDX" value="${cart.C_IDX}"></li>
									</ul></li>
								<c:set var="sum" value="${sum+cart.C_PRICE}" />
							</c:forEach>
						</c:when>
						<c:otherwise>
							<li>텅</li>
						</c:otherwise>
					</c:choose>

				</ul>

				<span id="menuAmount">${sum}</span>원
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
			<div id="linecss">
				<div id="shadow"></div>
			</div>
			<div class="coupon">
				<div class="line">
					<a href=#none id="show">쿠폰 <i id="chevorn"
						class="fa-solid fa-chevron-down"></i></a>
				</div>
				<div id="hide" class="off" style="display: none">


					<ul class="clist">

						<c:forEach var="item" items="${clist}">
							<li class="cli"><input type="radio" name="option2"
								onClick="discount($(this))" value="${item.CU_IDX}" id="cu" /> <label
								for="cu" class="culabel"><ul>
										<li>${item.COUPON}!</li>
										<li class="cuprice">${item.CU_PRICE}</li>
										<li><fmt:formatDate value="${item.CU_LIMIT}"
												pattern="yyyy-MM-dd" /></li>

									</ul></label></li>
						</c:forEach>

					</ul>

				</div>
			</div>
			<div id="linecss">
				<div id="shadow"></div>
			</div>
			<div class="how">
				<h4>결제</h4>
				<div class="kakao">
					<button id="" class="kbtn" onClick="getmenuList()">
						<img src="../images/common/kakao.png" alt="카카오페이">카카오페이로
						결제하기
					</button>
				</div>
			</div>
		</section>

		<section id="pay">

			<div id="checkflex">
				<div class="num">
					<ul>
						<li><h3>
								<strong>할인적용</strong>
							</h3></li>
						<li><span class="discount">0</span>원</li>
					</ul>

					<div class="pprice">
						<ul>
							<li><h3>
									<strong>총 결제금액</strong>
								</h3></li>
							<li>
								<h3 style="color: #ff751a; display: inline">
									<div class="total">
										<span id="totalAmount">${sum}</span>원
									</div>
								</h3>
							</li>
						</ul>

					</div>

				</div>
		</section>

	</div>
</body>

<script src=<c:url value='/js/memberOrder.js'/>></script>
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

	//리스트에서 버튼 클릭 시 
	$(".list").on(
			"click",
			"i",
			function() {
				let id = $(this).attr("id"); // 해당 id 값
				let cartitem = $(this).closest("li").closest("ul")
						.closest("li"); // 해당 li
				if (id === 'delete') {// 삭제버튼
					let cidx = $(this).closest("li").find("input[name=C_IDX]")
							.val();
					let cart = {
						C_IDX : cidx
					};
					cartService.remove(cart, function(result) {
						cartitem.remove();// li 삭제
						$("#menuAmount").html(
								$("#menuAmount").html()
										- cartitem.find("input[name=C_PRICE]")
												.val()); // total에서 뺌
						console.log(result);
						$("#totalAmount").html(
								Number($("#menuAmount").html())
										- Number($(".discount").html()));
					});
				}
				if (id === 'minus') { // 빼기 버튼
					let i = cartitem.find("#result").html();
					let price = cartitem.find("input[name=C_PRICE]").val();
					let ogprice = price / i;
					if (i > 1) {
						cartitem.find("#result").html(i - 1);
						cartitem.find(".price").html(ogprice * (i - 1));
						cartitem.find("input[name=C_PRICE]").val(
								ogprice * (i - 1));
						cartitem.find("input[name=C_COUNT]").val(i - 1);
						$("#menuAmount").html(
								Number($("#menuAmount").html())
										- Number(ogprice));
						$("#totalAmount").html(
								Number($("#menuAmount").html())
										- Number($(".discount").html()));
					} else {
						alert("상품은 1개이상 주문해야합니다.");
					}

				}
				if (id === 'plus') { // 더하기 버튼
					let i = cartitem.find("#result").html();
					let price = cartitem.find("input[name=C_PRICE]").val();
					let ogprice = price / i;
					cartitem.find("#result").html(Number(i) + 1);
					cartitem.find(".price").html(ogprice * (Number(i) + 1));
					cartitem.find("input[name=C_PRICE]").val(
							ogprice * (Number(i) + 1));
					cartitem.find("input[name=C_COUNT]").val(Number(i) + 1);
					$("#menuAmount").html(
							Number($("#menuAmount").html()) + Number(ogprice));
					$("#totalAmount").html(
							Number($("#menuAmount").html())
									- Number($(".discount").html()));
				}
			});
	// 쿠폰적용
	function discount(obj) {
		let cuprice = obj.closest("li").find("ul li.cuprice").html();
		$(".discount").html(cuprice);
		console.log(cuprice);
		$("#totalAmount").html(
				Number($("#menuAmount").html()) - Number(cuprice));
	}
</script>
<script>
	function getmenuList() {// 필요한 정보 모아서 서버단 전송
		var menuArray = [];
		var menuInfo = $(".menuInfo");
		let ocontent = '';
		let totalCount = 0;
		for (let i = 0; i < menuInfo.length; i++) {
			menuArray.push({
				'OM_NAME' : $("input[name=CP_NAME]").eq(i).val(),
				'OM_IMG' : $("input[name=CP_IMG]").eq(i).val(),
				'OM_PRICE' : $("input[name=C_PRICE]").eq(i).val(),
				'OM_OP' : $("input[name=C_OP]").eq(i).val(),
				'OM_STORE' : $("input[name=C_STORE]").eq(i).val(),
				'OMB_IDX' : $("input[name=CB_IDX]").eq(i).val(),
				'OMP_IDX' : $("input[name=CP_IDX]").eq(i).val(),
				'OM_COUNT' : $("input[name=C_COUNT]").eq(i).val()
			});
			totalCount += Number($("input[name=C_COUNT]").eq(i).val());
		}
		if (totalCount > 1) {
			ocontent = $("input[name=CP_NAME]").eq(0).val() + " 외 "+(totalCount-1)+" 건";
		} else {
			ocontent = $("input[name=CP_NAME]").eq(0).val();
		}
		let order = {

			'O_STORE' : '${list[0].STORE}',
			'OS_NAME' : '${list[0].S_NAME}',
			'O_CONTENT' : ocontent,
			'O_COUNT' : totalCount,
			'O_SUM' : $("#totalAmount").html(),
			'O_STATUS' : 1,
			'O_PICK' : $("input[name=option1]:checked").val(),
			'OB_IDX' : '${sessionScope.B_PHONE}',
			'OCU_IDX' : $("input[name=option2]:checked").val(),
			'menuList' : menuArray
		};
		console.log(order);
				orderService.add(order,function(result){
					console.log(result);
					location.replace(result);
				});
	}
</script>
</html>