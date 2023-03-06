<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/storedefault.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/storesub.css'/>" />
<title>공지사항</title>
<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>
</head>
<body>
	<div class="wrap">
		<div id="adminnd">
			<br>
			<br>
			<h1>공지사항</h1>
			<form method="post"
				action="/Oasis/admin/updateForm.oa?N_IDX=${map.N_IDX}">
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
				         <c:if test="${map.N_IMAGE ne 'NULL' }">
               <img src="/Oasis/img/${map.N_IMAGE}" alt="이미지"> <input
                  type="hidden" name="N_IMAGE">
         </c:if>
							<div>
					<p>${map.N_CONTENT}
						<input type="hidden" name="N_CONTENT">
					</p>
				</div>
				</div>

			</form>
		</div>
	</div>
</body>
</html>