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
<<<<<<< HEAD
	<div>
		<h1 style="display: inline" onclick="location.href='<c:url value="storeList.oa"/>'">오아시스</h1>
		<h3 style="display: inline">관리자</h3>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h2 style="color: #ff6600; display: inline"
			onclick="location.href='<c:url value="storeList.oa"/>'">
			<strong>지점관리</strong>
		</h2>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h2 style="color: #ff6600; display: inline"
			onclick="location.href='<c:url value="productList.oa"/>'">
			<strong>상품관리</strong>
		</h2>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h2 style="color: #ff6600; display: inline"
			onclick="location.href='<c:url value="noticeList.oa"/>'">
			<strong>공지사항</strong>
		</h2>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h2 style="color: #ff6600; display: inline"
			onclick="location.href='<c:url value="memberList.oa"/>'">
			<strong>사이트관리</strong>
		</h2>

	</div>
	<br>
		<div
		style="height: 20px; width: 100%; background-color: #ff6600;">
	</div>
	<br><br>
	<div class="head">
		<h2>공지사항</h2>
		<hr>
	</div>
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
			<p>${map.N_CONTENT}
				<input type="hidden" name="N_CONTENT">
			</p>
			<p>
				<img src="/Oasis/img/${map.N_IMAGE}" alt="이미지"> <input
					type="hidden" name="N_IMAGE">
			</p>
		</div>
		</form>

=======
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
>>>>>>> 222400925999648af73ebaa6027980f6b93c9458
</body>
</html>