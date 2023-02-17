<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 상세</title>
</head>
<body>
	<div style="text-align: center;">
		<h2>주문내역</h2>
		<div>
			<tr>
				<%--매장이름 --%>
				<td>${map.OS_NAME}</td>
			</tr>
		</div>
		<div>
			<tr>
				<%--주문번호 --%>
				<th width="170">주문번호</th>
				<td>${map.O_IDX}</td>
			</tr>
		</div>	
		<div>
			<tr>
				<%-- 주문날짜 --%>
				<td>${map.O_DATE}</td>
			</tr>
		</div>
		<div>
			<c:choose>
				<c:when test="${map.O_STATUS  eq '1' }">
					<span style="color: orange;">주문접수</span>
					<span>제조중</span>
					<span>제조완료</span>
				</c:when>
				<c:when test="${map.O_STATUS  eq '2' }">
					<span>주문접수</span>
					<span style="color: orange;">제조중</span>
					<span>제조완료</span>
				</c:when>
				<c:otherwise>
					<span>주문접수</span>
					<span>제조중</span>
					<span style="color: orange;">제조완료</span>
				</c:otherwise>

			</c:choose>
		</div>
		<tr>
			<%-- <th width="170">주문한 메뉴</th>--%>
			<td>${map.O_LIST}</td>
		</tr>
		<div>
			<tr>
				<th width="170">상품 금액</th>
				<td>${map.O_SUM }원</td>
			</tr>
		</div>
		<div>
			<th width="170">할인 금액</th>
				<td> <c:forEach var="item" items="${coupon}">
						<td>${item.CU_PRICE } 원</td> </br>
						
						
		
			<tr>
				<th width="170">결제 금액</th>
				<td>${map.O_SUM - item.CU_PRICE}원</td>
			</tr>
			</c:forEach>
		</div>
</body>
</html>