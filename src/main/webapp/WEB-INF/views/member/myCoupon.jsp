<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쿠폰</title>
</head>
<body>

	<h2>쿠폰</h2>
	<p>오아시스!</p>
	<br/>
	<table class="board_list" border="1">
		<thead>

			<tr>
				<th scope="col">쿠폰번호</th>
				<th scope="col">쿠폰이름</th>
				<th scope="col">쿠폰가격</th>
				<th scope="col">구매자IDX</th>
				<th scope="col">발급일</th>
				<th scope="col">사용여부</th>

			</tr>
		</thead>

		<tbody>
			<c:forEach var="item" items="${list}">
				<tr> 
					<td>${item.CU_IDX }</td>
					<td>${item.COUPON}</td>
					<td>${item.CU_PRICE}</td>
					<td>${item.CUB_IDX}</td>
					<td>${item.CU_LIMIT}</td>
					<td>
					<c:if test="${item.CU_USE eq 'N'}">
								<c:out value="사용가능" />
							</c:if>
					<c:if test="${item.CU_USE eq 'Y'}">
								<c:out value="사용불가" />
							</c:if>
					</td>
				</tr>
			</c:forEach>
	</tbody>
</table>
</body>
</html>
