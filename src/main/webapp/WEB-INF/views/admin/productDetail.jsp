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
		<h1 style="display: inline" onclick="location.href='<c:url value="main.oa"/>'">오아시스</h1>
		<h3 style="display: inline">관리자</h3>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h2 style="color: #ff6600; display: inline"
			onclick="location.href='<c:url value="todaysOrders.oa"/>'">
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
			onclick="location.href='<c:url value="ordersAllList.oa"/>'">
			<strong>사이트관리</strong>
		</h2>

	</div>
	<br>
	<div
		style="height: 20px; width: 100%; background-color: #ff6600;">
	</div>
	
	<div>

	<h1><strong>${map.P_IDX}&nbsp;&nbsp;${map.P_NAME}</strong></h1>
	
	<table>
	  <tr>
	    <td colspan=2><img height=200px src="<c:url value='/images/contents/${map.P_IMG}.png'/>" /></td>
	    <td><h3>가격:&nbsp;&nbsp;${map.P_PRICE }</h3>
	    	${map.P_CONTENT }</td>
	  </tr>
	</table>

	</div>
	
	<div>
	<button type="button" class="button" style="color: white; background: orange" onclick="location.href='<c:url value="productUpdateForm.oa?P_IDX=${map.P_IDX}"/>'">수정</button></td>
	&nbsp;
	<button type="button" class="button" style="color: white; background: black" onclick="removeCheck();">삭제</button></td>
	</div>
</body>
<script>
function removeCheck() {
 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	 location.href="/Oasis/admin/productDelete.oa?P_IDX=${map.P_IDX}";
 }else{   //취소
     return false;
 }
}
</script>
</html>