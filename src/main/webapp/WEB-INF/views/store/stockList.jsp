<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-storeheader.jspf"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/storedefault.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/storesub.css'/>" />

<meta charset="UTF-8">
<title>관리자 - 재고관리</title>
</head>
<body><div class="wrap">

	<div id="adminplist">
		
			<h1 id="clock">
				<strong></strong>
			</h1>
			<c:forEach items="${list}" var="item">
				<table class="status" border=0>
					<tr>
						<td rowspan=3><a href="#this"><img
								src="https://img.79plus.co.kr/megahp/manager/upload/menu/20220630162318_1656573798017_43JQ0t0JCi.jpg"
								height="200px" /></a></td>
						<td><h2>
								<strong>${item.P_NAME }</strong>
								</t2>
					</tr>
					<tr>
						<td><h3 style="display: inline">
								품절여부:
								<c:if test="${item.S_SO eq 'N'}">재고있음</c:if>
								<c:if test="${item.S_SO eq 'Y'}">품절</c:if>
							</h3>
							<button type="button" class="button"
								style="color: white; background: orange" id="uptBtn">변경하기</button>
							<input type="hidden" name="pname" value="${item.P_NAME}">
							<input type="hidden" name="ssidx" value="${item.SS_IDX}">
							<input type="hidden" name="spidx" value="${item.SP_IDX}">
				</table>

				<br>
			</c:forEach>
			<div class="paging">${paging.pageHtml}</div>

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
							<input type="hidden" name="SS_IDX"> <input type="hidden"
								name="SP_IDX">
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
		</div>
	</div>
	
</body>
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