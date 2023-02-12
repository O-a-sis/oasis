<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
	<div class="head">
		<h2>공지사항</h2>
		<hr>
	</div>
	<form method="post"
		action="/Oasis/member/noticeDetail.oa?N_IDX=${map.N_IDX}">
		<div class="title">
			<c:if test="${map.N_TYPE eq 'B'}">
				<c:set var="type" value="구매자" />
			</c:if>
			<c:if test="${map.N_TYPE eq 'E'}">
				<c:set var="type" value="이벤트" />
			</c:if>
			<h4>[${type}]${map.N_TITLE}</h4>
			<input type="hidden" name="N_TITLE">
			<p>${map.N_DATE}</p>
			<hr>
		</div>
		<div class="content">
			<p>${map.N_CONTENT}
				<input type="hidden" name="N_CONTENT">
			</p>
			<p>${map.N_IMAGE}
				<input type="hidden" name="N_IMAGE">
			</p>
		</div>
		<p>
		<hr>
		</p>
		<div>
		<button class="listbtn" type="button"
				onClick="location.href='noticeList.oa'">목록</button>
		</div>

	</form>
</body>
</html>