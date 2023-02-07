<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
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
<meta charset="UTF-8">
<title>관리자 메인페이지</title>

</head>
<body>
<div>
<h1 style="display:inline">오아시스</h1>
<h3 style="display:inline">${sessionScope.S_NAME} - 관리자</h3>
</div>
<div style="height: 100px; width: 100%; background-color: #ff6600; padding:10px">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1 style="color:white; display:inline"><strong>거래내역</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <h1 style="color:white; display:inline"><strong>재고관리</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <h1 style="color:white; display:inline"><strong>공지사항</strong></h1>
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
       <h1 style="color:white; display:inline"><strong>이전 거래내역</strong></h1>
</div>
<div style="padding:20px" align="center">
<c:if test="${empty list}">
<h1 style="display:inline"><strong>접수대기</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h1 style="color:#ff751a; display:inline"><strong>0건</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h1 style="display:inline"><strong>제조중</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h1 style="color:#ff751a; display:inline"><strong>0건</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h1 style="display:inline"><strong>제조완료</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h1 style="color:#ff751a; display:inline"><strong>0건</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:if>
<c:forEach items="${list}" var="item">
<h1 style="display:inline"><strong>
	<c:choose>
	<c:when test="${item.O_STATUS eq '1' or empty item.O_STATUS}">접수대기</c:when>
	<c:when test="${item.O_STATUS eq '2' or empty item.O_STATUS}">제조중</c:when>
	<c:otherwise>제조완료</c:otherwise>
	</c:choose>
</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h1 style="color:#ff751a; display:inline"><strong>${item.CNT}건</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:forEach>


</div>
<br>
<div style="height:200px; width:600px;">
<h1 id="clock"><strong></strong></h1>
<h1><strong>접수대기주문현황</strong></h1>

	<c:if test="${status eq '0'}">
	<h4>오픈 전입니다</h4>
	</c:if>
	<c:if test="${status eq '1'}">
		<c:forEach items="${list2}" var="item">
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
				<input type=hidden id="status" value="${item.O_STATUS}">
				<input type=hidden id="list" value="${item.O_LIST}">
				<input type=hidden id="b_idx" value="${item.OB_IDX}">
				<input type=hidden id="cprice" value="${item.CU_PRICE}">
				<input type=hidden id="sum" value="${item.O_SUM}">
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
	</c:if>

<button type="button" style="color:white; background:gray" onclick="location.href='<c:url value="logout.oa"/>'">지점 로그아웃</button>
</div>

	<div id="modal" class="modal-overlay" id="orders_modal">
		<div class="modal-window" id="popupPrdCompare"
			data-popup-layer="popupPrdCompare">
			<div class="title">

				<div class="close-area" data-focus-next="popupPrdCompare">X</div>

				<div>
					<h2 style="text-align: left; display:inline;"><strong>주문번호&nbsp;<span class="oidx"></span></strong></h2>
					&nbsp;&nbsp;&nbsp;
					<h3>상태-<span class="status"></span></h3>

				</div>
			</div>

			<div class="content">
				<h2>주문내역</h2>
				<div class="contentin1">
					<span class="list"></span>
				</div>
				<div class="contentin2">
					<h4>주문자명-<span class="phone"></span></h4>
					<h4 style="display:inline"> 판매 금액 <span class="sum"></span>원</h4>
					<h4 style="display:inline"> 할인 금액 <span class="cprice"></span>원</h4>
					<h4 style="display:inline"> 결제 금액 <span class="total"></span>원</h4>
				</div>
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
<%@ include file="/WEB-INF/include/include-body.jspf" %> 
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".orders").on("click", "tr td button", function(){
			if($(this).attr("id")== 'uptBtn') {
				let oidx = $(this).closest("td").find("input[id=oidx]").val();
				alert(oidx);
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/store/orderUpdate.oa'/>");
				comSubmit.addParam("O_IDX", oidx);
				comSubmit.submit();
			} else if($(this).attr("id")== 'uptPcBtn') {
				let oidx = $(this).closest("td").find("input[id=oidx]").val();
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/store/orderProcessingUpdate.oa'/>");
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
		/* let modalInputNickname = modal.find("input[name='M_NICKNAME']"); */
		
		$(".orders").on("click","tr td span",function(){
			let cprice = $(this).closest("td").find("input[id=cprice]").val();
			let total = $(this).closest("td").find("input[id=sum]").val();
	 		$(".oidx").html($(this).closest("td").find("input[id=oidx]").val());
	 		$(".list").html($(this).closest("td").find("input[id=list]").val());
	 		$(".phone").html($(this).closest("td").find("input[id=b_idx]").val());
	 		$(".cprice").html(cprice);
	 		$(".total").html(total);
	 		$(".sum").html(Number(total)+Number(cprice));
	 		let status = $(this).closest("td").find("input[id=status]").val();
		
			if(status=='1') {
				$(".status").html("접수대기")
			} else if(status=='2') {
				$(".status").html("제조중")
			} else {
				$(".status").html("제조완료")
			};
			/* modalInputNickname.val($(this).closest("td").find("input[name=nickname]").val()); */
			modalOn();
			
		});

 		/* let rankRegisterBtn = $("#rankRegisterBtn");

		/*모달확정*/
 		/* rankRegisterBtn.on("click", function(e) {
			var rank = {
					M_NICKNAME : modalInputNickname.val(),
					RANK : $('select[name=selectRank]').val()
			};
			
			rankService.update(rank, function(result) {
				alert("등급이 변경되었습니다.");
				
			});
			modalOff();
			location.reload();
		});  */
 
		 
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