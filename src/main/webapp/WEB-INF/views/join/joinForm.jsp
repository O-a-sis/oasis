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
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<title>메뉴선택</title>

</head>
<body>
	<div class="wrap">
		<div class="subhead">
			<ul>
				<li><i class="fa-solid fa-chevron-left"></i></li>
				<li><span class="subtit">회원가입</span>
			</ul>
		</div>
		<section id="join">
			<form action="./joinSuccess.oa" method="post">
				<div class="tag">전화번호</div>
				<input type="text" name="B_PHONE" style="width:80%">
				<button type="button" id="checkbtn">인증</button>
				<div class="tag">인증 번호</div>
				<input type="text" name="checkkey" id="checkkey" readonly><input
					type="hidden" name="keycheck" id="keycheck"><label
					id="check"></label>
				<div class="tag">비밀번호</div>
				<input type="password" name="B_PASSWORD">
				<div class="tag">이름</div>
				<input type="text" name="B_NAME">
				<div class="tag">닉네임</div>
				<input type="text" name="B_NICKNAME">
				<div class="tag">생일</div>
				<input type="date" name="B_BIRTH" data-placeholder="생년월일을 입력해주세요"   required
  aria-required="true">
				<button class="jbtn" type="submit">가입</button>
			</form>
		</section>
	</div>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#checkbtn").on("click", function() {

				joinService.check({
					recipientPhoneNumber : $("input[name=B_PHONE]").val()
				}, function(result) {
					if (result.check == 1) {
						$("#keycheck").val(result.checkKey);
						$("#checkkey").removeAttr("readonly");
					} else {
						alert("가입된 전화번호 입니다.");
					}
				});
			});

			$('#checkkey').keyup(function() {
				if ($(this).val().length > 0) {
					if ($(this).val() == $("#keycheck").val()) {
						$('#check').text(" 인증 완료");
						$('#check').css("color", "green");
						$('#check').css("font-size", "9pt");
						$('#check').css("font-weight", "bold");
					} else {
						$('#check').text(" 인증 번호 불일치");
						$('#check').css("color", "red");
						$('#check').css("font-size", "9pt");
						$('#check').css("font-weight", "bold");
					}
				} else {
				}
			});

		});
	</script>
	<script src="<c:url value='/js/memberJoin.js'/>"></script>
</body>
</html>