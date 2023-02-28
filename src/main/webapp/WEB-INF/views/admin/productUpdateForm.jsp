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
	width: 100px;
}
</style>
<meta charset="UTF-8">
<title>상품관리</title>
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
	
	<div>
	<form method="post" action="/Oasis/admin/productUpdate.oa" onSubmit="return submitCheck();">
	<input type=hidden name="P_IDX" value="${map.P_IDX}">
	<input type=hidden name="P_IMG" value="${map.P_IMG}">
	<h1><strong>${map.P_IDX}&nbsp;&nbsp;${map.P_NAME}</strong></h1>
	
	<table>
	  <tr>
	    <td colspan=2><img height=200px src="<c:url value='/images/contents/${map.P_IMG}.png'/>" /></td>
	    <td><h3>가격:&nbsp;&nbsp;<input type="text" name="P_PRICE" value="${map.P_PRICE}"></h3>
	    	<textarea style="width: 220px; height: 142px;" name="P_CONTENT">${map.P_CONTENT }</textarea>
	    </td>
	  </tr>
	</table>

	</div>
	
	<div>
	<button type="submit" class="button" style="color: white; background: orange">수정완료</button></td>
	&nbsp;
	<button type="reset" class="button" style="color: white; background: blue">리셋</button></td>
	</form>
	</div>
</body>
</html>