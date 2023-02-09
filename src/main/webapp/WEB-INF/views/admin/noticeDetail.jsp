<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
	<h2>공지사항 상세보기</h2>
	<table border="1" width=600>

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