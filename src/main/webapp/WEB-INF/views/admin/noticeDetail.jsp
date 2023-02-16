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
		action="/Oasis/admin/UpdateForm.oa?N_IDX=${map.N_IDX}">
		<div class="title">
			<c:if test="${map.N_TYPE eq 'B'}">
				<c:set var="type" value="구매자" />
				<c:set var="type" value="고객" />
			</c:if>
			<c:if test="${map.N_TYPE eq 'S'}">
				<c:set var="type" value="판매자" />
				<c:set var="type" value="매장" />
			</c:if>
			<c:if test="${map.N_TYPE eq 'E'}">
				<c:set var="type" value="이벤트" />
			</c:if>
			<h4>[${type}]${map.N_TITLE}</h4>
			<input type="hidden" name="N_TITLE">
			<p>${map.N_DATE}</p>
			<button class="updatebtn" type="submit">수정</button>
			<button class="listbtn" type="button"
				onClick="location.href='noticeList.oa'">목록</button>
			<hr>
		</div>
		<div class="content">
			<p>${map.N_CONTENT}
				<input type="hidden" name="N_CONTENT">
			</p>
			<p>${map.N_IMAGE}
			<p>
				<img src="/Oasis/img/${map.N_IMAGE}" alt="이미지"> 

				<input type="hidden" name="N_IMAGE">
			</p>
		</div>

	</form>
</body>
</html>