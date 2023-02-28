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
	<input type="hidden" name="CP_NAME" value="${map.P_NAME}">
	<input type="hidden" name="CP_IMG" value="${map.P_IMG}">
	<input type="hidden" name="C_STORE" value="${param.STORE}">
	<input type="hidden" name="CB_IDX" value="${sessionScope.B_PHONE}">
	<input type="hidden" name="CP_IDX" value="${map.P_IDX}">
	<input type="hidden" name='C_OP' id='test_list' value=''>
	<input type="hidden" name='C_PRICE' id='C_PRICE' value=''>
	<input type="hidden" name='C_COUNT' id='C_COUNT' value=''>
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
			<c:if test="${map.P_CATEGORY eq 'C'}"><%@ include
					file="/WEB-INF/include/include-drinkOption.jspf"%></c:if>
			<c:if test="${map.P_CATEGORY ne 'C'}"><%@ include
					file="/WEB-INF/include/include-dessertOption.jspf"%></c:if>
			<!-- 			<div class="menuop"> -->
			<!-- 				<a href=#none id="show" -->
			<!-- 					onclick="if(hide.style.display=='none') -->
			<!-- {hide.style.display='';show.innerText='∧'} -->
			<!-- else {hide.style.display='none';show.innerText='퍼스널 옵션&nbsp&nbsp&nbsp>'}">퍼스널옵션&nbsp&nbsp&nbsp -->
			<!-- 					></a> -->
			<!-- 				<div id="hide" style="display: none"> -->
			<!-- 					<ul> -->
			<!-- 						<li class="oplist"><ul> -->
			<!-- 								<li><strong> </strong></li> -->
			<!-- 								<li><input type="radio" name="option1" value="HOT" checked />HOT</li> -->
			<!-- 								<li><input type="radio" name="option1" value="ICE" />ICE</li> -->
			<!-- 							</ul></li> -->

			<!-- 						<li class="oplist"><ul> -->
			<!-- 								<li><strong>농도</strong></li> -->
			<!-- 								<li><input type="radio" name="option2" value="" -->
			<!-- 									onchange="handleChange1(this);" checked />선택안함</li> -->
			<!-- 								<li><input type="radio" name="option2" value="연하게" -->
			<!-- 									onchange="handleChange1(this);" />연하게</li> -->
			<!-- 								<li><input type="radio" name="option2" value="샷추가" -->
			<!-- 									onchange="handleChange1(this);" />샷 추가 +1000원</li> -->
			<!-- 							</ul></li> -->
			<!-- 						<li class="oplist"><ul> -->
			<!-- 								<li><strong>시럽추가</strong></li> -->
			<!-- 								<li><input type="radio" name="option3" value="" -->
			<!-- 									onchange="handleChange2(this);" checked />선택안함</li> -->
			<!-- 								<li><input type="radio" name="option3" value="헤이즐넛시럽추가" -->
			<!-- 									onchange="handleChange2(this);" />헤이즐넛시럽추가 +500원</li> -->
			<!-- 								<li><input type="radio" name="option3" value="바닐라시럽추가" -->
			<!-- 									onchange="handleChange2(this);" />바닐라시럽추가 +500원</li> -->
			<!-- 								<li><input type="radio" name="option3" value="라이트바닐라시럽추가" -->
			<!-- 									onchange="handleChange2(this);" />라이트바닐라시럽추가 +500원</li> -->

			<!-- 							</ul> -->
			<!-- 						<li class="oplist"><ul> -->
			<!-- 								<li><strong>우유 변경</strong></li> -->
			<!-- 								<li><input type="radio" name="option4" value="" -->
			<!-- 									onchange="handleChange3(this);" checked />선택안함</li> -->
			<!-- 								<li><input type="radio" name="option4" value="아몬드밀크변경" -->
			<!-- 									onchange="handleChange3(this);" />아몬드밀크변경</li> -->
			<!-- 								<li><input type="radio" name="option4" value="오트밀크변경" -->
			<!-- 									onchange="handleChange3(this);" />오트밀크변경 +500원</li> -->
			<!-- 							</ul> -->
			<!-- 				</div> -->
			<!-- 			</div> -->

			<br>
			<div id="checkflex">
				<div class="num">
					<ul>
						<li><h3>
								<strong>수량</strong>
							</h3></li>
						<li><span style="display: inline" class="count"> <a
								href="#" class="minus"><i class="fa-solid fa-minus"></i></a> <span
								id="result">1</span> <a href="#" class="plus"><i
									class="fa-regular fa-plus"></i></a></li>
						<li><h3>
								<strong><span style="display: none" class="cost"
									id="cost"> <fmt:formatNumber value="${map.P_PRICE}"
											pattern="#,###" />원
								</span> </strong>

							</h3></li>
					</ul>

					<div class="hidecount" style="display: none;">
						<span class="costhidden1">${map.P_PRICE }</span><span
							class="costhidden0">00</span> <span class="costhidden2">00</span>
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
					<button type="submit" data-oper='order' class="button"
						style="color: white"
						onclick="javascript:location.href='/Oasis/member/cartList.oa'">장바구니</button>
					<button type="submit" data-oper='cart' onclick='getlist()'
						style="color: white">메뉴담기</button>
				</div>
			</div>
		</section>
	</div>

</body>

<script src=<c:url value='/js/cart.js'/>></script>
<script src=<c:url value='/js/jquery-1.12.4.min.js'/>></script>
<script>

$('#show').on("click",function(){
	if($('#hide').attr('class')==='off'){
	$('#hide').slideDown(500);
	$('#hide').removeClass().addClass('on');
	$('#show').find("i").css("transform","rotate(-180deg)");

	}else{
		$('#hide').slideUp(500);
		$('#hide').removeClass().addClass('off');	
		$('#show').find("i").css("transform","rotate(0deg)");
	}
});

</script>
<script type="text/javascript">
    function getlist() {
    	
    	let bphone = '${sessionScope.B_PHONE}';
    	let cartstore = '';
    	cartService.get(bphone,function(result){
    		if(result.check){// 장바구니에 상품이 있는지 확인
    			cartstore = result.STORE; // 장바구니의 지점 번호 저장
    		}
    		if(cartstore!=''){
        		if('${param.STORE}'!=cartstore){ // 현재 지점과 같지 않다면
        			if(!confirm("장바구니에는 한 지점의 메뉴만 담을수 있습니다.\n (확인)을 누를경우 기존의 장바구니는 비워집니다.")){
        				
        			}else{
        				 let cart = {
        					B_PHONE:'${sessionScope.B_PHONE}'	 
        				 };
        				cartService.removeAll(cart, function(result){// 모두 삭제
        					console.log(result);
        					addCart();
        				});
        			}
        		}else{
        			addCart();
        		}
        	}else{
        		addCart();
        	}
    	});
    	
    	console.log(cartstore);
    }
    
    function addCart(){
    	 var list = new Array();
    	 list.push($("input[name=option0]:checked").val());
         list.push($("input[name=option1]:checked").val());
         list.push($("input[name=option2]:checked").val());
         list.push($("input[name=option3]:checked").val());
         list.push($("input[name=option4]:checked").val());
         
         let result=document.querySelector("#result").textContent;
         $("#C_COUNT").val(result);
         
         let costtotal=document.querySelector(".costhidden5").textContent;
         $("#C_PRICE").val(costtotal);
              												 <!-- input의 value들을 배열 list에 넣는다. -->
         $("#test_list").val(list);                            <!-- hidden type에 value값으로 넣어준다. -->
         
         let cart = {
         		CP_NAME:$("input[name=CP_NAME]").val(),
         		C_PRICE:$("input[name=C_PRICE]").val(),
         		C_OP:$("#test_list").val(),
         		C_STORE:$("input[name=C_STORE]").val(),
         		CB_IDX:$("input[name=CB_IDX]").val(),
         		CP_IDX:$("input[name=CP_IDX]").val(),
         		C_COUNT:$("input[name=C_COUNT]").val(),
         		CP_IMG:$("input[name=CP_IMG]").val(),
         		B_PHONE:'${sessionScope.B_PHONE}'
         };
         
         cartService.add(cart,function(result){
         	console.log(result);
         });
    }
</script>
<script type="text/javascript">
let plus = document.querySelector(".plus");
let minus = document.querySelector(".minus");
let result = document.querySelector("#result");
let cost = document.querySelector(".cost");
let costhidden0 = document.querySelector(".costhidden0");
let costhidden1 = document.querySelector(".costhidden1");
let costhidden2 = document.querySelector(".costhidden2");
let costhidden3 = document.querySelector(".costhidden3");
let costhidden4 = document.querySelector(".costhidden4");
let costhidden5 = document.querySelector(".costhidden5");
let costhiddentotal = document.querySelector(".costhiddentotal");
let price = ${map.P_PRICE};
let i = 1;
let totalcost = document.querySelector(".totalcost");
	
	
function handleChange0() {
		if($("input[name='option0']:checked").val() == 'S'){
		costhidden0.innerHTML = Number(-500);
	}if($("input[name='option0']:checked").val() == 'M') {
		costhidden0.innerHTML = 0;
	}if($("input[name='option0']:checked").val() == 'L') {
		costhidden0.innerHTML = Number(500);
	}
		console.log($("input[name='option0']:checked").val());
}
	
	
	function handleChange1() {
 		if($("input[name='option2']:checked").val() == '샷추가'){
			costhidden2.innerHTML = Number(1000);
		} else {
			costhidden2.innerHTML = 0;
		}
 		console.log($("input[name='option2']:checked").val());
	}
	
	function handleChange2() {
		if($("input[name='option3']:checked").val() == '') {
			costhidden3.innerHTML = 0;
		} 
		if($("input[name='option3']:checked").val() == '헤이즐넛시럽추가') {
			costhidden3.innerHTML = Number(500);
		} 
		if($("input[name='option3']:checked").val() == '바닐라시럽추가') {
			costhidden3.innerHTML = Number(500);
		} 
		if($("input[name='option3']:checked").val() == '라이트바닐라시럽추가') {
			costhidden3.innerHTML = Number(500);
		} 
		console.log($("input[name='option3']:checked").val());
	}
	
	function handleChange3() {
		if($("input[name='option4']:checked").val() == '') {
			costhidden4.innerHTML = 0;
		} 
		if($("input[name='option4']:checked").val() == '아몬드밀크변경') {
			costhidden4.innerHTML = 0;
		} 
		if($("input[name='option4']:checked").val() == '오트밀크변경') {
			costhidden4.innerHTML = Number(500);
		} 
		console.log($("input[name='option4']:checked").val());
	}
	
	
	$(".costhidden0").on('DOMSubtreeModified', function() {
		let sum0 = i*Number(costhidden0.innerHTML)+i*Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
		costhiddentotal.innerHTML = sum0.toLocaleString();
		costhidden5.innerHTML = sum0;
	});
	$(".costhidden1").on('DOMSubtreeModified', function() {
		let sum1 = i*Number(costhidden0.innerHTML)+i*Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
		costhiddentotal.innerHTML = sum1.toLocaleString();
		costhidden5.innerHTML = sum1;
	});
	$(".costhidden2").on('DOMSubtreeModified', function() {
		let sum2 = i*Number(costhidden0.innerHTML)+i*Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
		costhiddentotal.innerHTML = sum2.toLocaleString();
		costhidden5.innerHTML = sum2;
	});
	$(".costhidden3").on('DOMSubtreeModified', function() {
		let sum3 = i*Number(costhidden0.innerHTML)+i*Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
		costhiddentotal.innerHTML = sum3.toLocaleString();
		costhidden5.innerHTML = sum3;
	});
	$(".costhidden4").on('DOMSubtreeModified', function() {
		let sum4 = i*Number(costhidden0.innerHTML)+i*Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
		costhiddentotal.innerHTML= sum4.toLocaleString();
		costhidden5.innerHTML = sum4;
	});
 
	plus.addEventListener("click", () => {
	i++;
	result.textContent = i;
	let costNum = i*price;
	cost.textContent = costNum.toLocaleString()+"원";
	let sum = i*Number(costhidden0.innerHTML)+i*Number(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
	costhiddentotal.textContent=sum.toLocaleString();
	costhidden5.textContent=sum;
	
		
	});

	minus.addEventListener("click", () => {
		if(i>1) {
			i--;
			result.textContent = i;
			let costNum = i*price;
			cost.textContent = costNum.toLocaleString()+"원";
			let sum = i*Number(costhidden0.innerHTML)+i*(costhidden1.innerHTML)+i*Number(costhidden2.innerHTML)+i*Number(costhidden3.innerHTML)+i*Number(costhidden4.innerHTML);
			costhiddentotal.textContent=sum.toLocaleString();
			costhidden5.textContent=sum;
			
			
			
		} else {
			alert("상품은 1개이상 주문해야 합니다.")
			
		}
	});
</script>
</html>