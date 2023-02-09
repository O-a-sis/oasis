<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<style>
.button { 
	border-radius:7px;
	font-size:16px;
	width:100px;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/side.css'/>" />
<meta charset="UTF-8">
<title>관리자 - 재고관리</title>
</head>
<body>
<div>
<h1 style="display:inline" onclick="location.href='<c:url value="main.oa"/>'">오아시스</h1>
<h3 style="display:inline">${sessionScope.S_NAME} - 관리자</h3>
</div>
<div style="height: 100px; width: 100%; background-color: #ff6600; padding:10px">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1 style="color:white; display:inline" onclick="location.href='<c:url value="todaysOrders.oa"/>'"><strong>거래내역</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <h1 style="color:white; display:inline" onclick="location.href='<c:url value="stock.oa"/>'"><strong>재고관리</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <h1 style="color:white; display:inline" onclick="location.href='<c:url value="noticeList.oa"/>'"><strong>공지사항</strong></h1>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   
	   <c:if test="${status eq '1'}">
       <button type="button" onclick="closeStore();">매장 마감</button>
       </c:if>
       <c:if test="${status eq '0'}">
       <button type="button" onclick="openStore();">매장 오픈</button>
       </c:if>
       
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<<<<<<< HEAD
       <h1 style="color:white; display:inline" onclick="location.href='<c:url value="ordersAllList.oa"/>'"><strong>이전 거래내역</strong></h1>
</div>
<h1 id="clock"><strong></strong></h1>
	<c:forEach items="${list}" var="item">
		<table class="status" border=0>
			<tr>
			<td rowspan=3><a href="#this"><img src="https://img.79plus.co.kr/megahp/manager/upload/menu/20220630162318_1656573798017_43JQ0t0JCi.jpg" height="200px"/></a></td>
			<td><h2><strong>${item.P_NAME }</strong></t2>
			</tr>
			<tr>
			<td><h3 style="display:inline">품절여부: 
				<c:if test="${item.S_SO eq 'N'}">재고있음</c:if>
				<c:if test="${item.S_SO eq 'Y'}">품절</c:if>
				</h3>
				<button type="button" class="button" style="color:white; background:orange" id="uptBtn">변경하기</button>
				<input type="hidden" name="pname" value="${item.P_NAME}">
				<input type="hidden" name="ssidx" value="${item.SS_IDX}">
				<input type="hidden" name="spidx" value="${item.SP_IDX}">
		</table>

		<br>
	</c:forEach>
	
	<div id="modal" class="modal-overlay">
		<div class="modal-window" id="popupPrdCompare"
			data-popup-layer="popupPrdCompare">
			<div class="title">

				<div class="close-area" data-focus-next="popupPrdCompare">X</div>

				<div>
					<h3 style="text-align: center;">품절여부 변경</h3>

				</div>
			</div>

			<div class="content">
				<div class="contentin">
					<input type="hidden" name="SS_IDX">
					<input type="hidden" name="SP_IDX">
					<p>
						<strong><span class="p_name"></span>의 재고를</strong>
					</p>
					<select style="float: left" " name="selectStatus">
						<option value="Y">품절</option>
						<option value="N">재고있음</option>
					</select>
					<p>
						<strong>으로 변경합니다.</strong>
					</p>
					<button id="statusUpdateBtn" class="modalbtn" type="submit">변경</button>
				</div>
			</div>

		</div>
	</div>
</body>
<script src="<c:url value='/js/orders.js'/>"></script>
    <script>
        window.onload = function () {
            // 변수를 선언합니다.
            var clock = document.getElementById('clock');
            // 매 1초마다 함수를 실행합니다.
            setInterval(function () {
                var today = new Date();
                let day = ['일', '월', '화', '수', '목', '금', '토'];

                function dateFormat(today) {
                    let dateFormat=today.getFullYear() + '년 ' + (today.getMonth()+1) + '월 '
                    + today.getDate() + '일 ' + day[today.getDay()] + '요일 '
                    + today.getHours() + '시 ' + today.getMinutes() + '분 '
                    + today.getSeconds() + '초';
                    return dateFormat;
                }

                clock.innerHTML = dateFormat(today).toString();
            }, 1000);
        };
    </script>
<script type="text/javascript">
	$(document).ready(function() {
		
		/* 모달 관련 변수 선언 */
		let modal = $("#modal");
		let modalInputSsidx = modal.find("input[name='SS_IDX']");
		let modalInputSpidx = modal.find("input[name='SP_IDX']");
		
		$(".status").on("click","tr td button",function(){
	 		$(".p_name").html($(this).closest("td").find("input[name=pname]").val());
			modalInputSsidx.val($(this).closest("td").find("input[name=ssidx]").val());
			modalInputSpidx.val($(this).closest("td").find("input[name=spidx]").val());
			modalOn();
			
		});

 		let statusUpdateBtn = $("#statusUpdateBtn");

		/*모달확정*/
 		statusUpdateBtn.on("click", function(e) {
			var stock = {
					S_SO : $('select[name=selectStatus]').val(),
					SS_IDX : modalInputSsidx.val(),
					SP_IDX: modalInputSpidx.val()
			};
			
			orderService.updateStock(stock, function(result) {
				alert("품절여부가 변경되었습니다");
				
			});
			modalOff();
			location.reload();
		}); 

	});
</script>
<script>
	
	const modal = document.getElementById("modal");

	function modalOn() {
	    modal.style.display = "flex"
	}
	function isModalOn() {
	    return modal.style.display === "flex"
	}
	function modalOff() {
	    modal.style.display = "none"
	}
	
	const closeBtn = modal.querySelector(".close-area")
	closeBtn.addEventListener("click", e => {
	    modalOff()
	});
	modal.addEventListener("click", e => {
	    const evTarget = e.target
	    if(evTarget.classList.contains("modal-overlay")) {
	        modalOff()
	    }
	});
	window.addEventListener("keyup", e => {
	    if(isModalOn() && e.key === "Escape") {
	        modalOff()
	    }
	});
	const testScrPop = $('modal-window');
   testScrPop.scroll(function(){
   const $this = $(this);
});
</script>
</html>