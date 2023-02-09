<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>본사-지점관리</title>
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
</head>
<body>
	<h1>지점매출순위 - 전일기준</h1>
	<table class="board_list" border="1">
		<thead>
			<tr>
				<th scope="col">지점번호</th>
				<th scope="col">지점명</th>
				<th scope="col">지점장명</th>
				<th scope="col">주소</th>
				<th scope="col">전화번호</th>
				<th scope="col">매출액</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach var="item" items="${list}">

						<tr>
							<td>${item.R_IDX}</td>
							<td>${item.S_NAME}</td>


							<td>${item.S_MANAGER}</td>
							<td>${item.ADDRESS1}</td>
							<td>${item.S_PHONE}</td>
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

	<br>
	<br>
	<br>

	<button type='button' id="modal_btn">지점추가</button>
	<div class="black_bg"></div>


	<div class="modal_wrap">
		<h4>지점추가</h4>

		<form id="storeJoin" class="form-horizontal" method="POST"
			action="<c:url value='Oasis/admin/storeList.oa'/>" onSubmit="check()">



			<!-- 지점명 ID -->
			<div class="joinfom">
				<label class="jointit">지점ID</label><br />
				<input class="putfom" type="text" class="form-control" check="0" id="STORE" name="STORE"
					placeholder="ID 입력하세요" class="form-control"
					oninput="checkID()" required>
				<label id="STORELABEL"></label>
			</div>

			<!-- 비밀번호 -->
			<div class="joinfom">
				<label for="jointit">지점PW</label><br />
				<input class="putfom" type="password" class="form-control" id="S_PASSWORD" name="S_PASSWORD"
					placeholder="비밀번호 입력하세요" class="form-control" required />
				<label id="PASSWORDW"></label>
			</div>

			<!-- 지점 이름 -->
			<div class="joinfom">
				<label>지점명</label><br />
				<input class="putfom" type="text" class="form-control" check="0" id="S_NAME" name="S_NAME"
					minlength="2" maxlength="8" placeholder="지점명 입력하세요"
					class="form-control" oninput="checkName()" required>
				<label id="NAMEW"></label>
			</div>

			<!-- 지점장 이름 -->
			<div class="joinfom">
				<label>지점장</label><br />
				<input class="putfom" type="text" minlength="2" class="form-control"
					id="S_MANAGER" name="S_MANAGER" placeholder="이름을 입력하세요" required>
				<label id="MANAGERW"></label>
			</div>
			
			<!-- 휴대전화 -->
			<div class="joinfom">
				<label>지점번호</label><br />
				<input class="putfom" type="text" class="form-control"
					id="S_PHONE" name="S_PHONE" placeholder="'-' 없이 번호만 입력해주세요" required>
				<label id="PHONEW"></label>
			</div>
			

			<div class="joinfom">
				<label>주소</label><br />
				<input class="putfomnum" type="text" class="form-control"
					id="sample6_postcode" name="POSTCODE" placeholder="우편번호">
				<input type="button" class="postbtn"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
				<label	id="ADDRW1"></label>
			</div>

			<div class="joinfom">
				<input class="putfom" type="text" class="form-control"
						id="sample6_address" name="ADDRESS1" placeholder="주소">
			<p>
				<input class="putfom" type="text" class="form-control"
						id="ADDRESS2" name="ADDRESS2" placeholder="상세주소를 입력해주세요"><br>
			</div>

			
		<button type="button" id='modalRegisterBtn'
				class="btn btn-primary conmbtn">작성</button>
						<button type="button" id='modalModBtn'
							class="btn btn-warning conmbtn2">닫기</button>
						<button type="button" id='modalRemoveBtn'
							class="btn btn-danger conmbtn3">삭제</button>
							


		</form>


<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<c:url value='/js/post.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/joinForm.js'/>"></script>


	</div>



<script>
	
	
	
	function fsubmit(){
		var id = $("#STORE")[0].value;
		var pw = $("#S_PASSWORD")[0].value;
		if(id==null || id==''){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(pw==null || pw==''){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		JoinForm.submit();
	}

	function f_enterJoin(){
		 if (window.event.keyCode == 13){
			 fsubmit();
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
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
    document.querySelector('.modal_update').addEventListener('click', offClick);
 
};


/* 수정 */
modalModBtn.on("click", function(e) {
	var ccomment = {
		CCOM_IDX : $modalContainer.data("ccidx"),
		CCOM_CONTENT : modalInputContent.val()
	};

	ccommentService.update(ccomment, function(result) {
		$modalContainer.addClass('out');

		showList(1);
	});
});

/* 삭제 */
modalRemoveBtn.on("click", function(e) {
	var ccidx = $modalContainer.data("ccidx");

	ccommentService.remove(ccidx, function(result) {
		$modalContainer.addClass('out');

		showList(1);
	});
});

/* 닫기 버튼 */
$(".close-area").on('click', function() {
	$modalContainer.addClass('out');
});

</script>


	<br>
	<br>
	<br>
	<h1>지점 관리</h1>
	<table class="board_list" border="1">
		<thead>
			<tr>
				<th scope="col">지점번호</th>
				<th scope="col">지점명</th>
				<th scope="col">지점장명</th>
				<th scope="col">주소</th>
				<th scope="col">전화번호</th>
				<th scope="col">지점상태</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach var="item" items="${list }">

						<tr>
							<td>${item.R_IDX}</td>
							<td><a
								href='<c:url value="/admin/storeDetail.oa?R_IDX=${item.R_IDX}"/>'>${item.S_NAME}</a>
							</td>
							<td>${item.S_MANAGER}</td>
							<td>${item.ADDRESS1}</td>
							<td>${item.S_PHONE}</td>
							<td>${item.S_STATUS}</td>
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


</body>
</html>