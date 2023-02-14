<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-storeheader.jspf" %>
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
<meta charset="UTF-8">
<title>관리자 - 재고관리</title>
</head>
<body>
<h1 id="clock"><strong></strong></h1>
<br>
<h2 style="display:inline"><strong>거래내역</strong></h2>&nbsp;&nbsp;
<button type="button" class="button" style="color:white; background:orange" onclick="location.href='<c:url value="todaysOrders.oa?O_STATUS=1"/>'">접수대기</button>
<button type="button" class="button" style="color:white; background:orange" onclick="location.href='<c:url value="todaysOrders.oa?O_STATUS=2"/>'">제조중</button>
<button type="button" class="button" style="color:white; background:orange" onclick="location.href='<c:url value="todaysOrders.oa?O_STATUS=3"/>'">제조완료</button>
<br><br>
	<c:forEach items="${list}" var="item">
			<table class="orders" border=0 width=900px align=center>
				<colgroup>
					<col width="*%" />
					<col width="13%" />
					<col width="20%" />
					<col width="15%" />
					<col width="20%" />
				</colgroup>
				<tr>
				<td><span>${item.O_LIST}</span>
				<input type=hidden id="oidx" value="${item.O_IDX}">
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
				
			</table>
		</c:forEach>
</body>

<%@ include file="/WEB-INF/include/include-body.jspf"%>
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