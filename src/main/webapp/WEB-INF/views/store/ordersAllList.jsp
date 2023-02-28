<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/include-storeheader.jspf" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="<c:url value='/css/store/jquery-ui.css'/>">
  <script type="text/javascript" src="<c:url value='/js/jquery-3.6.0.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/js/jquery-ui.js'/>"></script>
<style>
.button { 
	border-radius:7px;
	font-size:16px;
	width:100px;
}
</style>
<meta charset="UTF-8">
<title>관리자 - 이전 거래내역</title>
</head>
<body>

<h1 id="clock"><strong></strong></h1>
<br>
<h2 style="display:inline"><strong>이전 거래내역</strong></h2>&nbsp;&nbsp;

<br><br>
<form action="<c:url value="ordersAllList.oa"/>">
<p>날짜 선택: <input type="text" name="DATE" id="datepicker" value=<c:out value="${param.DATE eq 'null' ? '' : param.DATE}"/>>

<input type="submit" value="선택하기"> </p>
</form>
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
				<td><span>${item.O_CONTENT}</span>
				<input type=hidden id="oidx" value="${item.O_IDX}">
				<input type=hidden id="otime" value="${item.O_TIME}">
				</td>
				<td>${item.O_SUM}원</td>
				<td>${item.O_DATE}</td>
				<c:if test="${item.O_STATUS eq '1'}">
					<td><h3><strong>접수대기</strong></h3></td>
					<td><button type="button" class="button" style="color:white; background:orange" id="uptBtn">접수대기</button>
					<input type=hidden id="oidx" value="${item.O_IDX}">
					</td>
				</c:if>
				<c:if test="${item.O_STATUS eq '2'}">
					<td><h3><strong>제조중</strong></h3></td>
					<td><button type="button" class="button" style="color:white; background:blue" id="uptPcBtn">제조중</button>
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

<script src="<c:url value='/js/orders.js'/>"></script>
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
				$(".oidx").html(order[0].O_IDX);
				
				let str="";
				for(var i=0, len=order.length||0; i<len; i++) {
					str+='<p>'+order[i].OM_NAME+' '+order[i].OM_OP+' '+order[i].OM_PRICE+'원</p>';
				}
				
				$(".list").html(str);
				$(".phone").html(order[0].OB_IDX);
				$(".cprice").html(order[0].CU_PRICE);
				$(".total").html(order[0].O_SUM);
				$(".sum").html(Number(order[0].CU_PRICE)+Number(order[0].O_SUM));

					$(".status").html("제조완료")
					modalCompleteBtn.show();
					modalUptBtn.hide();
					modalProcessingBtn.hide();
					modalCancelBtn.hide();
					$("#timer").hide;
					$("#timerComplete").html("제조가 완료되었습니다!");

				modalOn();	
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
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       //$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>
</html>