<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>



</head>
<body>
	<div class="layout">
		<section id="findform">
			<div class="sub_visual">
				<div class="wrap">
				</div>
			</div>
			<div class="wrap">
				<div class="findPw">
				<center>
					<h2>비밀번호 찾기</h2>
					<div class="f_line">
						<form id="findPwForm"
							action="<c:url value='/member/findPwResult.oa'/>" method="POST">

							<!-- 이름 -->
							<div class="find">

								이름 : <input  type="text" check="0" id="B_NAME"
									name="B_NAME" placeholder="이름을 입력하세요" />

							</div>

							<!-- 전화번호 -->
							<div class="find">
								전화번호 : <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" 
								id="B_PHONE" name="B_PHONE">

							</div>
							
							<button type="submit" class="findbtn">비밀번호찾기</button>

						</form>
					</div>
				</div>

				</center>

</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		let result = '${result}';

			if (result != '') {
				if (result == 'true') {
					let passwd = '${b_phone.B_PASSWORD}';
					if (passwd != '') {
						alert("찾으시는 비밀번호는 " + passwd + " 입니다");
					}
				} else {
					alert("가입되지 않은 회원 입니다");
				}
			}
			
	});
</script>