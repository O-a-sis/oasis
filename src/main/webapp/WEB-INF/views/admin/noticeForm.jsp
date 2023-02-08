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
		<form method="post" action="/Oasis/admin/noticeWrite.oa">
		<thead>
			<tr>
				<th>구분</th>
				<th>제목</th>
				<th>내용</th>
				<th>이미지</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<input type="hidden" name="N_IDX">
				<td><select name="N_TYPE">
						<option value="B">구매자</option>
						<option value="S">판매자</option>
						<option value="E">이벤트</option>
				</select></td>
				<td><input type="text" name="N_TITLE"></td>
				<td><input type="text" name="N_CONTENT"></td>
				<td><input type="text" name="N_IMAGE"></td>
			</tr>
		</tbody>
		<button class="updatebtn" type="submit">수정</button>
		</form>
	</table>
</body>
</html>