<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>회원가입</h2>

	<form action="./joinSuccess.oa" method="post">
		전화번호:<input type="text" name="B_PHONE">
		<button type="button" id="checkbtn">인증하기</button>
		<br /> 인증 번호:<input type="text" name="checkkey" id="checkkey"
			readonly><input type="hidden" name="keycheck" id="keycheck"><label
			id="check"></label><br /> 비밀번호:<input type="password"
			name="B_PASSWORD"><br /> 이름:<input type="text" name="B_NAME"><br />
		닉네임:<input type="text" name="B_NICKNAME"><br /> 생일:<input
			type="text" name="B_BIRTH"><br /> <br /> <input
			type="submit" value="가입">

	</form>
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