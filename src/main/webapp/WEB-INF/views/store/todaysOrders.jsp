<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-storeHeader.jspf" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/side.css'/>" />
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
<title>관리자 - 오늘 거래내역</title>
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
       <h1 style="color:white; display:inline" onclick="location.href='<c:url value="ordersAllList.oa"/>'"><strong>이전 거래내역</strong></h1>
</div>
<h1 id="clock"><strong></strong></h1>
<br>
<h2 style="display:inline"><strong>거래내역</strong></h2>&nbsp;&nbsp;
<button type="button" class="button" style="color:white; background:orange" onclick="location.href='<c:url value="todaysOrders.oa?O_STATUS=1"/>'">접수대기</button>
<button type="button" class="button" style="color:white; background:blue" onclick="location.href='<c:url value="todaysOrders.oa?O_STATUS=2"/>'">제조중</button>
<button type="button" class="button" style="color:white; background:black" onclick="location.href='<c:url value="todaysOrders.oa?O_STATUS=3"/>'">제조완료</button>
<br><br>
	<c:if test="${empty list}">
	<center><h2><strong>내역이 없습니다.</strong></h2></center>
	</c:if>
	<c:forEach items="${list}" var="item">
			<table class="orders" border=0 width=900px align=center>
				<colgroup>
					<col width="*%" />
					<col width="13%" />
					<col width="20%" />
					<col width="15%" />
					<col width="20%" />
				</colgroup>
				<tr align=center>
				<td><span>${item.O_LIST}</span> <input type=hidden id="oidx"
						value="${item.O_IDX}"> <input type=hidden id="otime"
						value="${item.O_TIME}">
				</td>
				<td>${item.O_SUM}원</td>
				<td>${item.O_DATE}</td>
				<c:if test="${item.O_STATUS eq '1'}">
					<td><h3><strong>접수대기</strong></h3></td>
					<td><button type="button" class="button" style="color:white; background:orange" id="uptBtn">접수</button>
					<input type=hidden id="oidx" value="${item.O_IDX}">
					</td>
				</c:if>
				<c:if test="${item.O_STATUS eq '2'}">
					<td><h3><strong>제조중</strong></h3></td>
					<td><button type="button" class="button" style="color:white; background:blue" id="uptPcBtn">제조완료</button>
					<input type=hidden id="oidx" value="${item.O_IDX}">
					</td>
					
				</c:if>
				<c:if test="${item.O_STATUS eq '3'}">
					<td><h3><strong>제조완료</strong></h3></td>
					<td><button type="button" class="button" style="color:white; background:black">제조완료</button></td>
				</c:if>
	</c:forEach>
			</table>
	<div class="paging">${paging.pageHtml}</div>
	
	<div id="modal" class="modal-overlay">
		<div class="modal-window" id="popupPrdCompare"
			data-popup-layer="popupPrdCompare">
			<div class="title">

				<div class="close-area" data-focus-next="popupPrdCompare">X</div>

				<div>
					<h2 style="text-align: left; display: inline;">
						<strong>주문번호&nbsp;<span class="oidx"></span></strong>
					</h2>
					&nbsp;&nbsp;
					<button type="button" class="button"
						style="color: white; background: #5882FA" id="modalUptBtn">접수</button>
					</td>&nbsp;&nbsp;
					<button type="button" class="button"
						style="color: white; background: #5882FA" id="modalProcessingBtn">제조완료</button>
					</td>&nbsp;&nbsp;
					<button type="button" class="button"
						style="color: white; background: black" id="modalCompleteBtn">제조완료</button>
					</td>&nbsp;&nbsp;
					<button type="button" class="button"
						style="color: white; background: #5882FA" id="modalCancelBtn">취소</button>
					</td>
					<h3>
						상태-<span class="status"></span>
					</h3>
					<input type="hidden" name="oidx"> <input type="hidden"
						name="otime">
				</div>
			</div>

			<div class="content">
				<h2>주문내역</h2>
				<div class="contentin1">
					<span class="list"></span>
				</div>
				<div class="contentin2">
					<h4>
						주문자명-<span class="phone"></span>
					</h4>
					<h4 style="display: inline">
						판매 금액 <span class="sum"></span>원
					</h4>
					<h4 style="display: inline">
						할인 금액 <span class="cprice"></span>원
					</h4>
					<h4 style="display: inline">
						결제 금액 <span class="total"></span>원
					</h4>
				</div>
				<br>

				<h1 color=black align=right style="display: inline">
					<strong><div id="timer"></div></strong>
				</h1>
				<h1 color=black align=right>
					<strong><div id="timerComplete"></div></strong>
				</h1>
				<h1 color=black align=right>
					<strong>픽업시간:&nbsp;<span class="otime"></span></strong>
				</h1>
			</div>

		</div>
	</div>
		
</body>
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
<script>
    function openStore() {
    	if(confirm("매장을 오픈하시겠습니까?")) {
    		location.href="/Oasis/store/open?STORE=${sessionScope.STORE}";
    	} 
    }
    
    function closeStore() {
    	if(confirm("매장을 마감하시겠습니까?")) {
    		location.href="/Oasis/store/close?STORE=${sessionScope.STORE}";
    	} 
    }
</script>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<script src="<c:url value='/js/orders.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".orders").on("click", "tr td button", function(){
			if($(this).attr("id")== 'uptBtn') {
				let oidx = $(this).closest("td").find("input[id=oidx]").val();
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/store/orderUpdate.oa'/>");
				comSubmit.addParam("O_IDX", oidx);
				comSubmit.submit();
			} else if($(this).attr("id")== 'uptPcBtn') {
				let oidx = $(this).closest("td").find("input[id=oidx]").val();
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/store/processingOrderUpdate.oa'/>");
				comSubmit.addParam("O_IDX", oidx);
				comSubmit.submit();
			}
		});
	});
</script>
<script>
	$(document).ready(function() {
		
		/* 모달 관련 변수 선언 */
		let modal = $("#modal");
		var modalUptBtn=$("#modalUptBtn");
		var modalProcessingBtn=$("#modalProcessingBtn");
		var modalCompleteBtn=$("#modalCompleteBtn");
		var modalCancelBtn=$("#modalCancelBtn");
		let modalInputOidx=modal.find("input[name='oidx']");
		let modalInputOtime=modal.find("span[class='otime']");
		
		$(".orders").on("click","tr td span",function(){
			var otime=$(this).closest("td").find("input[id=otime]").val();
			modalInputOtime.val(otime);
			$(".otime").html(otime);
			var oidx=$(this).closest("td").find("input[id=oidx]").val();
			modalInputOidx.val(oidx);
			orderService.get(oidx, function(order) {
				$(".oidx").html(order.O_IDX);
				
				let o_list = order.O_LIST;
				let o_listSplit = o_list.split(',');
				let str="";
				for (var i in o_listSplit) {
					str+='<p>'+o_listSplit[i]+'</p>';
				}
				
				$(".list").html(str);
				$(".phone").html(order.OB_IDX);
				$(".cprice").html(order.CU_PRICE);
				$(".total").html(order.O_SUM);
				$(".sum").html(Number(order.CU_PRICE)+Number(order.O_SUM));
				let status = order.O_STATUS;
				if(status=='1') {
					$(".status").html("접수대기")
					modalProcessingBtn.hide();
					modalCompleteBtn.hide();
					CountDownTimer(modalInputOtime.val(), 'timer'); 
				} else if(status=='2') {
					$(".status").html("제조중")
					modalUptBtn.hide();
					modalProcessingBtn.show();
					modalCompleteBtn.hide();
					modalCancelBtn.hide();
					CountDownTimer(modalInputOtime.val(), 'timer'); 
				} else {
					$(".status").html("제조완료")
					modalCompleteBtn.show();
					modalUptBtn.hide();
					modalProcessingBtn.hide();
					modalCancelBtn.hide();
					$("#timer").hide;
					$("#timerComplete").html("제조가 완료되었습니다!");
				};

				modalOn();	
			});			
		});

 		modalUptBtn.on("click", function(e) {			
 			let oidx = modalInputOidx.val();
			var order = {
					O_IDX : oidx
				};		
			orderService.updateOrder(order, function(result) {			
			});		
			orderService.get(oidx, function(order) {
				$(".oidx").html(order.O_IDX);
				
				let o_list = order.O_LIST;
				let o_listSplit = o_list.split(',');
				let str="";
				for (var i in o_listSplit) {
					str+='<p>'+o_listSplit[i]+'</p>';
				}
				
				$(".list").html(str);
				$(".phone").html(order.OB_IDX);
				$(".cprice").html(order.CU_PRICE);
				$(".total").html(order.O_SUM);
				$(".sum").html(Number(order.CU_PRICE)+Number(order.O_SUM));
				let status = order.O_STATUS;
				/* if(status=='1') {
					$(".status").html("접수대기")
					modalProcessingBtn.hide();
					modalCompleteBtn.hide();
					CountDownTimer(modalInputOtime.val(), 'timer'); 
				} else  */
					/* if(status=='2') { */
					$(".status").html("제조중")
					modalUptBtn.hide();
					modalProcessingBtn.show();
					modalCompleteBtn.hide();
					modalCancelBtn.hide();
					CountDownTimer(modalInputOtime.val(), 'timer'); 
			/* 	} else {
					$(".status").html("제조완료")
					modalCompleteBtn.show();
					modalUptBtn.hide();
					modalProcessingBtn.hide();
					modalCancelBtn.hide();
					$("#timer").hide;
					$("#timerComplete").html("제조가 완료되었습니다!");
				/* }; */
			});		
 		});
 		
 		modalProcessingBtn.on("click", function(result) {
			let oidx = modalInputOidx.val();
			var order = {
					O_IDX : oidx
				};		
			orderService.updateProcessingOrder(order, function(result) {			
			});		
			orderService.get(oidx, function(order) {
				$(".oidx").html(order.O_IDX);
				
				let o_list = order.O_LIST;
				let o_listSplit = o_list.split(',');
				let str="";
				for (var i in o_listSplit) {
					str+='<p>'+o_listSplit[i]+'</p>';
				}
				
				$(".list").html(str);
				$(".phone").html(order.OB_IDX);
				$(".cprice").html(order.CU_PRICE);
				$(".total").html(order.O_SUM);
				$(".sum").html(Number(order.CU_PRICE)+Number(order.O_SUM));
				let status = order.O_STATUS;
				/* if(status=='1') {
					$(".status").html("접수대기")
					modalProcessingBtn.hide();
					modalCompleteBtn.hide();		
					CountDownTimer(modalInputOtime.val(), 'timer'); 
				} else if(status=='2') {
					$(".status").html("제조중")
					modalUptBtn.hide();
					modalProcessingBtn.show();
					modalCompleteBtn.hide();
					modalCancelBtn.hide();
					CountDownTimer(modalInputOtime.val(), 'timer'); 
				} else { */
					$(".status").html("제조완료")
					modalCompleteBtn.show();
					modalUptBtn.hide();
					modalProcessingBtn.hide();
					modalCancelBtn.hide();
					document.getElementById('timer').style.display='none';
					$("#timerComplete").html("제조가 완료되었습니다!");
				/* }; */
			});		
 			
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
	    location.reload();
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
             document.getElementById(id).innerHTML = '제조시간이 끝났습니다!';
             return;
         }
         var days = Math.floor(distance / _day);
         var hours = Math.floor((distance % _day) / _hour);
         var minutes = Math.floor((distance % _hour) / _minute);
         var seconds = Math.floor((distance % _minute) / _second);       
         document.getElementById(id).innerHTML = minutes + '분 ';
         document.getElementById(id).innerHTML += seconds + '초';
         document.getElementById(id).innerHTML += ' 남았습니다';
     }
     timer = setInterval(showRemaining, 1000);
 }
</script>
</html>