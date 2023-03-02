
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
			<ul>
				<li><i class="fa-solid fa-chevron-left"></i></li>
				<li><span class="subtit">주문내역</span>
			</ul>
		</div>
		<section id="myOrderlist">
		<h4><strong>${sessionScope.B_NAME}</strong>님께서<br>주문한 주문내역입니다.</h4>
		<span>클릭시 상세내역을 확인할 수 있습니다.</span>
			<div class="olist">
				<ul>
					<c:forEach var="item" items="${list}">
						<li class="oli"><a href = '/Oasis/member/myOrderDetail.oa?O_IDX=${item.O_IDX }&B_PHONE=${param.OB_IDX}&OCU_IDX=${item.OCU_IDX }'><ul>
								<li><c:if test="${item.O_PICK  eq '0' }">
					<c:out value="픽업" />
				</c:if>
				<c:if test="${item.O_PICK  eq '1' }">
					<c:out value="매장" />
				</c:if></li>
								<li>${item.OS_NAME}</li>
								<li><fmt:formatDate value="${item.O_DATE}"
										pattern="yyyy-MM-dd" /></li><li></li>

							</ul></a></li>
					</c:forEach>
				</ul>
			</div>
</section>
</div>

</body>
</html>