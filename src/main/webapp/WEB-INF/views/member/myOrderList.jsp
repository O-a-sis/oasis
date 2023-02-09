<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 주문내역</title>
</head>
<body>

	<h2>주문내역</h2>
	<p>오아시스!</p>
	<br />

	<div>
		<c:forEach var="item" items="${list}">
		<a href = '/Oasis/member/myOrderDetail.oa?O_IDX=${item.O_IDX }'>
			<div style="margin:10px;">
				<c:if test="${item.O_PICK  eq '0' }">
					<c:out value="픽업" />
				</c:if>
				<c:if test="${item.O_PICK  eq '1' }">
					<c:out value="매장" />
				</c:if>
				<div>${item.OS_NAME}</div>
				${item.O_LIST}
				${item.O_DATE}
			</div>
			</a>
		</c:forEach>
	</div>

</body>
</html>