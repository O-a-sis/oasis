<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.button {
	border-radius: 7px;
	font-size: 16px;
	width: 150px;
}
</style>
<meta charset="UTF-8">
<title>상품관리-관리자</title>
</head>
<body>
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

<br>
	<c:forEach items="${list}" var="item">
		<table class="status" border=0>
			<tr>
			<td rowspan=3><img height=200px src="<c:url value='/img/${item.P_IMG}'/>" /></td>
			
			<td><h3 onclick="location.href='<c:url value="productDetail.oa?P_IDX=${item.P_IDX}&page=${page}"/>'">${item.P_IDX}.&nbsp;<strong>${item.P_NAME }</strong></h3></td>
			
			</tr>
			<tr>
			<td><h3><strong>${item.P_PRICE }원</strong></h3></td>
			
			</tr>
		</table>

		<br>
	</c:forEach>
	
	<div class="paging">${paging.pageHtml}</div>
<br>
	<button type="submit" class="button" style="color: white; background: orange" onclick="location.href='<c:url value="productRegisterForm.oa"/>'">상품 등록하기</button></td>
</body>
</html>