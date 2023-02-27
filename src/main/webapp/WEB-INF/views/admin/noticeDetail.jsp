<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
<<<<<<< HEAD
	<div class="head">
		<h2>공지사항</h2>
		<hr>
	</div>
	<form method="post"
		action="/Oasis/admin/UpdateForm.oa?N_IDX=${map.N_IDX}">
		<div class="title">
			<c:if test="${map.N_TYPE eq 'B'}">
				<c:set var="type" value="고객" />
			</c:if>
			<c:if test="${map.N_TYPE eq 'S'}">
				<c:set var="type" value="매장" />
			</c:if>
			<c:if test="${map.N_TYPE eq 'E'}">
				<c:set var="type" value="이벤트" />
			</c:if>
			<h4>[${type}]${map.N_TITLE}</h4>
			<input type="hidden" name="N_TITLE">
			<p>
				<fmt:formatDate value="${map.N_DATE}" pattern="yyyy-MM-dd" />
			</p>
			<button class="updatebtn" type="submit">수정</button>
			<button class="listbtn" type="button"
				onClick="location.href='noticeList.oa'">목록</button>
			<hr>
		</div>
		<div class="content">
			<p>${map.N_CONTENT}
				<input type="hidden" name="N_CONTENT">
			</p>
			<p>
				<img src="/Oasis/img/${map.N_IMAGE}" alt="이미지"> <input
					type="hidden" name="N_IMAGE">
			</p>
		</div>
=======
	<h2>공지사항 상세보기</h2>
	<table border="1" width=600>
>>>>>>> 1c86325 (Revert "Feature/min j")

		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>날짜</th>
				<th>내용</th>
				<th>이미지</th>
			</tr>
		</thead>
		<tbody>
			<form method="post"
				action="/Oasis/admin/UpdateForm.oa?N_IDX=${map.N_IDX}">
			<tr>
				<td>${map.N_IDX}</td>
				<td><c:if test="${map.N_TYPE eq 'B'}">
						<c:set var="type" value="구매자" />
					</c:if> <c:if test="${map.N_TYPE eq 'S'}">
						<c:set var="type" value="판매자" />
					</c:if> <c:if test="${map.N_TYPE eq 'E'}">
						<c:set var="type" value="이벤트" />
					</c:if> [${type}]${map.N_TITLE}</td>
				<input type="hidden" name="N_TITLE">
				<td>${map.N_DATE}</td>
				<td>${map.N_CONTENT}</td>
				<input type="hidden" name="N_CONTENT">
				<td>${map.N_IMAGE}</td>
				<input type="hidden" name="N_IMAGE">
			</tr>
		</tbody>
		<button class="updatebtn" type="submit">수정</button>
		</form>
	</table>
</body>
</html>