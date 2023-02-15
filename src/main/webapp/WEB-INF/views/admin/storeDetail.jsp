<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>


<style>
.modal_wrap {
	display: none;
	width: 500px;
	height: 500px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background: #eee;
	z-index: 2;
}

.black_bg {
	display: none;
	position: absolute;
	content: "";
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	top: 0;
	left: 0;
	z-index: 1;
}

.modal_close {
	width: 26px;
	height: 26px;
	position: absolute;
	top: -30px;
	right: 0;
}

.modal_close>a {
	display: block;
	width: 100%;
	height: 100%;
	background: url(https://img.icons8.com/metro/26/000000/close-window.png);
	text-indent: -9999px;
}
</style>

<meta charset="UTF-8">

<title>지점 상세</title>
</head>
<body>
	<h1>${map.S_NAME }의정보</h1>
	<table class="board_list" border="1">
		<h4>연락처 : ${map.S_PHONE}</h4>
		<h4>주 소 : ${map.POSTCODE} ${map.ADDRESS1} ${map.ADDRESS2}</h4>
		<h4>지점장명 : ${map.S_MANAGER}</h4>
		<h4>로그인 정 보 : ${map.STORE} / ${map.S_PASSWORD}</h4>
		<br>
		<h3>전일 매출 / 월 평균 ;;;;</h3>

	</table>
	<br>
	<button type='button' id="modal_btn">지점수정</button>
	<br>
	<div class="black_bg"></div>
	<br>

	<!-- 검색처리기능 -->
	<div class="search" align="left">
		<form id="searchForm" action="<c:url value='/admin/storeDetail.oa' />"
			method="get">
			<select class="searcht" name="type">
				<option value="">--</option>
				<option value="O" name="type"
					<c:out value="${param.type eq 'O' ? 'selected' : ''}"/>>주문건수</option>
				<option value="D" name="type"
					<c:out value="${param.type eq 'D' ? 'selected' : ''}"/>>주문일자</option>
			</select> <input class="searchtext" type="text" name="keyword"
				value="<c:out value='${param.keyword}'/>" />
			<button class="btn btn-default sbtn">
				<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>
	</div>
	<br>
	<br>


	<table class="board_list" border="1">
		<thead>
			<tr>
				<th scope="col">매출일자</th>
				<th scope="col">거래건수</th>
				<th scope="col">매출합계</th>

			</tr>
		</thead>
		<tbody>

			<c:choose>
				<c:when test="${fn:length(listSum) > 0}">
					<c:forEach var="item" items="${listSum}">


						<tr>
							<td>${item.R_DATE}</td>
							<td>${item.OR_COUNT}</td>
							<td>${item.R_SUM}</td>
						</tr>

					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>

		</tbody>
	</table>
	<div class="paging" align="center">${paging.pageHtml}</div>





	<!-- 지점 수정 모달창 -->
	<div id="modal" class="modal_wrap">
		<div class="black_bg"></div>
		<div class="modal-window">
			<div class="jointit">

				<h4>지점 수정하기</h4>
				<form id="writeForm" class="form-horizontal" method="POST"
					action="<c:url value='/admin/openStoreUpdate.oa'/>"
					onSubmit="check()">

					<!-- 지점명 ID  수정불가-->
					<div class="joinfom">
						<label class="jointit">지점ID</label><br /> <input class="putfom"
							type="text" class="form-control" check="0" id="STORE"
							name="STORE" value="${map.STORE}" readonly="readonly"
							class="form-control" oninput="checkID()" required> <label
							id="STORELABEL"></label>
					</div>

					<!-- 비밀번호 수정불가 -->
					<div class="joinfom">
						<label for="jointit">비밀번호</label><br /> <input class="putfom"
							type="text" class="form-control" id="S_PASSWORD"
							value="${map.S_PASSWORD}" name="S_PASSWORD" readonly="readonly"
							required /> <label id="PASSWORDW"></label>

						<!-- 지점이름 수정불가-->
						<div class="joinfom">
							<label>지점명</label><br /> <input class="putfom" type="text"
								class="form-control" check="0" id="S_NAME" name="S_NAME"
								minlength="2" maxlength="8" value="${map.S_NAME}"
								readonly="readonly" class="form-control" oninput="checkName()"
								required> <label id="NAMEW"></label>
						</div>

						<!-- 지점장 이름 -->
						<div class="joinfom">
							<label>이름(수정가능)</label><br /> <input class="putfom" type="text"
								minlength="2" class="form-control" id="S_MANAGER"
								name="S_MANAGER" value="${map.S_MANAGER}" required> <label
								id="MANAGERW"></label>
						</div>

						<!-- 휴대전화 -->
						<div class="joinfom">
							<label for="PHONE">지점번호(수정가능)</label><br /> <input
								class="putfom" type="text" class="form-control" check="0"
								maxlength="13" id="S_PHONE" name="S_PHONE"
								value="${map.S_PHONE}" required> <label id="PHONEW"></label>
						</div>

						<!-- 주소 -->
						<div class="joinfom">
							<label>주소(수정가능)</label><br /> <input class="putfomnum"
								type="text" class="form-control" id="sample6_postcode"
								name="POSTCODE" value="${map.POSTCODE}"> <input
								type="button" class="postbtn"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기"> <label
								id="ADDRW1"></label>
						</div>

						<div class="joinfom">
							<input class="putfom" type="text" class="form-control"
								id="sample6_address" name="ADDRESS1" value="${map.ADDRESS1}">
							<input class="putfom" type="text" class="form-control"
								id="ADDRESS2" name="ADDRESS2" value="${map.ADDRESS2}"><br>
						</div>


						<div class="bbtn">
							<button type="button" id='modalDown'
								class="btn btn-primary conmbtn">폐쇄</button>
							<button type="button" id='modalUpdate'
								class="btn btn-warning conmbtn2">수정</button>
							<button type="button" class="close-area">닫기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="<c:url value='/js/post.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/joinForm.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/js/storeUpdate.js'/>"></script>



	<script>


	function submit_ck() {
		if ($('#S_MANAGER').val().length == 0) {
			$('#MANAGERW').text("변경 할 이름을 입력하세요.");
			$('#MANAGERW').css("color", "red");
			$('#MANAGERW').css("font-size", "9pt");
			$('#MANAGERW').css("font-weight", "bold");
			$('#MANAGERW').focus();
		} else if ($('#S_MANAGER').attr("check") == "0") {
			$('#MANAGERW').focus();
		} else if ($('#S_PHONE').val().length == 0) {
			$('#S_PHONE').text("변경 된 지점번호를 입력하세요.");
			$('#S_PHONE').css("color", "red");
			$('#S_PHONE').css("font-size", "9pt");
			$('#S_PHONE').css("font-weight", "bold");
			$('#S_PHONE').focus();
		} else if ($('#S_PHONE').val().length == 0) {
			$('#S_PHONE').text("변경 된 지점번호를 입력하세요.");
			$('#S_PHONE').css("color", "red");
			$('#S_PHONE').css("font-size", "9pt");
			$('#S_PHONE').css("font-weight", "bold");
			$('#S_PHONE').focus();
		} else {
			if ($('#PASSWORD').val().length == 0) {
				$('#PASSWORD').val('${myInfo.PASSWORD}');
			}
			$('#openStroeUpdate').submit();
		}
	}

    window.onload = function() {
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
       
    
    }
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick); //지점 정보 수정 모달 창 열기
    document.querySelector('.close-area').addEventListener('click', offClick); //지첨 정보 수정 모달 창 닫기
    
    }

    $(document)
    		.ready(
    				function() {    
    /* 수정 */
	$("#modalUpdate").on("click", function(e) {
		var storeUpdate = {
			STORE : $('#STORE').val(),
			S_MANAGER : $('#S_MANAGER').val(),
			ADDRESS1 : $('input[name=ADDRESS1]').val(),
			ADDRESS2 : $('input[name=ADDRESS2]').val(),
			POSTCODE : $('input[name=POSTCODE]').val(),
			S_PHONE : $('#S_PHONE').val()
			
		};

		adminStoreService.update(storeUpdate, function(result) {
		modal.style.display = "none";
		location.reload(); //새로고침
		
		});
	});
    				});

  //지점 정보 수정 모달 창 닫기
    document.querySelector('.close-area').addEventListener("click", e => {
        modal.style.display = "none"//닫기 버튼 눌럿을떄 닫아지기
    });




</script>

	<!-- <script>
	$("a[name=delete]").click(
			function() {
				let check = confirm("폐쇄 하시겠습니까?");
				if (check) {
					$(this).attr("href",
							"/Oasis/storeDown.oa?STORE=${getStore.STROE}");
				}
			});
</script> -->

</body>
</html>