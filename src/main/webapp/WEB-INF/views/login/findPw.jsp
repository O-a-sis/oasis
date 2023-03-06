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
			<ul style="text-align: center;">
				<li></li>
				<li><span class="subtit">비밀번호 찾기</span></li>
			</ul>
		</div>
		<section id="findpw">
						<form id="findPwForm"
							action="<c:url value='/member/findPwResult.oa'/>" method="POST">

							<!-- 이름 -->
							<div class="tag">

								이름 </div> <input  type="text" check="0" id="B_NAME"
									name="B_NAME" placeholder="이름을 입력하세요" />


							<!-- 전화번호 -->
							<div class="tag">
								전화번호</div> <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" 
								id="B_PHONE" name="B_PHONE">

							
							<button type="submit" class="findbtn">비밀번호찾기</button>
							<button type="button" class="lbtn" onclick="javascript:location.href='/Oasis/member/loginForm.oa'">로그인 하기</button>
						</form>
</section>
</div>
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