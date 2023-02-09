<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>지점 상세</title>
</head>
<body>
<h3>${map.S_NAME }의 정보</h3>
<table class="board_list" border="1">
		<thead>
			<tr>
				<th scope="col">일자</th>
				<th scope="col">거래량</th>
				<th scope="col">매출</th>

			</tr>
		</thead>
		<tbody>			
			<c:forEach var="item" items="${list }">
				<c:if test="${STORE eq item.R_IDX}">
				<tr>
					<td>${item.R_DATE}</td>
					<td>${item.OR_COUNT}</td>
					<td>${item.R_SUM}</td>

				</tr>
				</c:if>
				 				
			</c:forEach> 
		</tbody>
</table>

</body>
</html>