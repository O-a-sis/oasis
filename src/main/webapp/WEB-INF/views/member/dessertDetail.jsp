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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/member/sub.css'/>" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<title>{map.P_NAME}</title>
</head>
<body>
	<form role="form" action='<c:url value="insertCart.oa"/>' method="post">
		<input type="hidden" name="CP_NAME" value="${map.P_NAME}"> <input
			type="hidden" name="CP_IMG" value="${map.P_IMG}"> <input
			type="hidden" name="C_STORE" value="${param.STORE}"> <input
			type="hidden" name="CB_IDX" value="${sessionScope.B_PHONE}">
		<input type="hidden" name="CP_IDX" value="${map.P_IDX}"> <input
			type="hidden" name='C_OP' id='test_list' value=''> <input
			type="hidden" name='C_PRICE' id='C_PRICE' value=''> <input
			type="hidden" name='C_COUNT' id='C_COUNT' value=''>
		<div class="wrap">
			<div class="subhead">
				<ul>
					<li><i class="fa-solid fa-chevron-left"></i></li>
					<li><span class="subtit">메뉴선택</span>
				</ul>
			</div>
			<section class="menudetail">
				<div class="menuimg">
					<img src="<c:url value='/images/contents/${map.P_IMG}.png'/>" />
					<h2>${map.P_NAME}</h2>
					${map.P_CONTENT} <br>
				</div>
				<div class="menuop">
					<a href=#none id="show"
						onclick="if(hide.style.display=='none')
{hide.style.display='';show.innerText='∧'}
else {hide.style.display='none';show.innerText='퍼스널 옵션&nbsp&nbsp&nbsp>'}">퍼스널옵션&nbsp&nbsp&nbsp
						></a>
					<div id="hide" style="display: none">
						<ul>
											
								<li class="oplist"><ul>
									<li><strong>꿀 추가 선태</strong></li>
									<li><input type="radio" name="option1" value=""
										onchange="handleChange1(this);" checked />선택안함</li>
									<li><input type="radio" name="option1" value="꿀추가"
										onchange="handleChange1(this);" checked />꿀 추가 +700원</li>
								</ul>

							<li class="oplist"><ul>
									<li><strong>박스추가</strong></li>
									<li><input type="radio" name="option2" value=""
										onchange="handleChange2(this);" checked />추가안함</li>
									<li><input type="radio" name="option2" value="박스추가"
										onchange="handleChange2(this);" checked />박스 추가 +500원</li>
								</ul>
						</div>
				</div>

				<br>
				<div id="checkflex">
					<div class="num">
						<ul>
							<li><span style="display: inline" class="count"> <a
									href="#" class="minus"><i class="fa-solid fa-minus"></i></a> <span
									id="result">1</span> <a href="#" class="plus"><i
										class="fa-regular fa-plus"></i></a></li>
							<li><h3>
									<strong><span style="display: inline" class="cost"
										id="cost"> <fmt:formatNumber value="${map.P_PRICE}"
												pattern="#,###" />원
									</span></strong>
								</h3></li>
						</ul>

						<div class="hidecount" style="display: none;">
							<span class="costhidden1">${map.P_PRICE}</span> <span class="costhidden2">00</span>
							<span class="costhidden3">00</span> <span class="costhidden4">00</span>
							<span class="costhidden5">${map.P_PRICE}</span>
						</div>
					</div>
					<div class="pprice">
						<ul>
							<li><h3>
									<strong>상품금액</strong>
								</h3></li>
							<li>
								<h3 style="color: #ff751a; display: inline">
									<span class="costhiddentotal"><strong> <fmt:formatNumber
												value="${map.P_PRICE}" pattern="#,###" /></span>원</strong>
								</h3>
							</li>
						</ul>

					</div>
					<div class="mbtn">
						<button type="submit" data-oper='order' onclick='getlist()'
							class="button" style="color: white">바로주문</button>
						<button type="submit" data-oper='cart' onclick='getlist()'
							style="color: white">장바구니 담기</button>
					</div>
				</div>
			</section>
		</div>
	</form>

</body>
<script src=<c:url value='/js/jquery-1.12.4.min.js'/>></script>
<script type="text/javascript">
    function getlist() {
        var list = new Array();
         
        list.push($("input[name=option1]").val());
        list.push($("input[name=option2]").val());

        let result=document.querySelector("#result").textContent;
        $("#C_COUNT").val(result);
        
        let costtotal=document.querySelector(".costhidden5").textContent;
        $("#C_PRICE").val(costtotal);
             												 <!-- input의 value들을 배열 list에 넣는다. -->
        $("#test_list").val(list);                            <!-- hidden type에 value값으로 넣어준다. -->
    };
</script>
<script type="text/javascript">
let plus = document.querySelector(".plus");
let minus = document.querySelector(".minus");
let result = document.querySelector("#result");
let cost = document.querySelector(".cost");
let costhidden1 = document.querySelector(".costhidden1");
let costhidden2 = document.querySelector(".costhidden2");
let costhidden3 = document.querySelector(".costhidden3");
let costhidden4 = document.querySelector(".costhidden4");
let costhidden5 = document.querySelector(".costhidden5");
let costhiddentotal = document.querySelector(".costhiddentotal");
let price = ${map.P_PRICE};
let i = 1;
let totalcost = document.querySelector(".totalcost");
	
	function handleChange1() {
 		if($("input[name='option1']:checked").val() == '꿀추가'){
			costhidden2.innerHTML = Number(700);
		} else {
			costhidden2.innerHTML = 0;
		}
	}
	
	function handleChange2() {
		if($("input[name='option2']:checked").val() == '') {
			costhidden3.innerHTML = 0;
		} 
		if($("input[name='option2']:checked").val() == '박스추가') {
			costhidden3.innerHTML = Number(500);
		} 
		
	}
	
	
	
	$(".costhidden1").on('DOMSubtreeModified', function() {
		let sum1 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
		costhiddentotal.innerHTML = sum1.toLocaleString();
		costhidden5.innerHTML = sum1;
	})
	$(".costhidden2").on('DOMSubtreeModified', function() {
		let sum2 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
		costhiddentotal.innerHTML = sum2.toLocaleString();
		costhidden5.innerHTML = sum2;
	})
	$(".costhidden3").on('DOMSubtreeModified', function() {
		let sum3 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
		costhiddentotal.innerHTML = sum3.toLocaleString();
		costhidden5.innerHTML = sum3;
	})
	$(".costhidden4").on('DOMSubtreeModified', function() {
		let sum4 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
		costhiddentotal.innerHTML = sum4.toLocaleString();
		costhidden5.innerHTML = sum4;
	})
 
	plus.addEventListener("click", () => {
	i++;
	result.textContent = i;
	let costNum = i*price;
	cost.textContent = costNum.toLocaleString()+"원";
	costhidden1.textContent=costNum;
	let sum = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
	costhiddentotal.textContent=sum.toLocaleString();
	costhidden5.textContent=sum;
	
		$(".costhidden1").on('DOMSubtreeModified', function() {
			let sum1 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
			costhiddentotal.innerHTML = sum1.toLocaleString();
			costhidden5.innerHTML = sum1;
		})
		$(".costhidden2").on('DOMSubtreeModified', function() {
			let sum2 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
			costhiddentotal.innerHTML = sum2.toLocaleString();
			costhidden5.innerHTML = sum2;
		})
		$(".costhidden3").on('DOMSubtreeModified', function() {
			let sum3 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
			costhiddentotal.innerHTML = sum3.toLocaleString();
			costhidden5.innerHTML = sum3;
		})
		$(".costhidden4").on('DOMSubtreeModified', function() {
			let sum4 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
			costhiddentotal.innerHTML = sum4.toLocaleString();
			costhidden5.innerHTML = sum4;
		})
		
	})

	minus.addEventListener("click", () => {
		if(i>0) {
			i--;
			result.textContent = i;
			let costNum = i*price;
			cost.textContent = costNum.toLocaleString()+"원";
			costhidden1.textContent=costNum;
			let sum = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
			costhiddentotal.textContent=sum.toLocaleString();
			costhidden5.textContent=sum;
			
				$(".costhidden1").on('DOMSubtreeModified', function() {
					let sum1 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
					costhiddentotal.innerHTML = sum1.toLocaleString();
					costhidden5.innerHTML = sum1;
				})
				$(".costhidden2").on('DOMSubtreeModified', function() {
					let sum2 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
					costhiddentotal.innerHTML = sum2.toLocaleString();
					costhidden5.innerHTML = sum2;
				})
				$(".costhidden3").on('DOMSubtreeModified', function() {
					let sum3 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
					costhiddentotal.innerHTML = sum3.toLocaleString();
					costhidden5.innerHTML = sum3;
				})
				$(".costhidden4").on('DOMSubtreeModified', function() {
					let sum4 = Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
					costhiddentotal.innerHTML = sum4.toLocaleString();
					costhidden5.innerHTML = sum4;
				})
			
			
		} else {
			cost.textContent = 0 + "원";
			costhidden1.textContent=0;
			costhiddentotal.textContent=0;
			costhidden5.innerHTML = 0;
		}
	})
		
</script>
</html>