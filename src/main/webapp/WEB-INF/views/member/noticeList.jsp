
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
				<li><span class="subtit">공지사항</span>
			</ul>
		</div>
		<section id="mnotice">
			<h4>이벤트와 신메뉴를 놓치지 마세요!</h4>
			<div class="nlist">
				<ul>
					<c:forEach var="item" items="${list}">
						<li class="nli"><ul>
								<li>${item.N_IDX}</li>
								<li><c:if test="${item.N_TYPE eq 'B'}">
										<c:set var="type" value="공지" />
									</c:if> <c:if test="${item.N_TYPE eq 'E'}">
										<c:set var="type" value="이벤트" />
									</c:if> <a style=""
									href='<c:url value="/member/noticeDetail.oa?N_IDX=${item.N_IDX}"/>'>[${type}]${item.N_TITLE}</a></li>
								<li><fmt:formatDate value="${item.N_DATE}"
										pattern="yyyy-MM-dd" /></li>

							</ul></li>
					</c:forEach>
				</ul>
			</div>
			<div class="ninfo">
				<div class="search" align="center">
					<form id="searchForm"
						action="<c:url value='/member/noticeList.oa' />" method="get">
						<select class="searcht" name="type">
							<option value="">--</option>
							<option value="TWCNQ" name="type"
								<c:out value="${param.type eq 'TC' ? 'selected' : ''}"/>>전체</option>
							<option value="T" name="type"
								<c:out value="${param.type eq 'T' ? 'selected' : ''}"/>>제목</option>
							<option value="C" name="type"
								<c:out value="${param.type eq 'C' ? 'selected' : ''}"/>>내용</option>
						</select> <input class="searchtext" type="text" name="keyword"
							value="<c:out value='${param.keyword}'/>" />
						<button class="sbtn">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>
				<div class="paging" align="center">${paging.pageHtml}</div>
			</div>

		</section>
	</div>
</body>
</html>












