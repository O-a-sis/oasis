<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>상품관리-관리자</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/storedefault.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/storesub.css'/>" />
<title>본사-지점관리</title>
<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>
</head>
<body>
<div class="wrap">
<div id="adminplist">
<h1 style="float:left">메뉴 관리</h1> <button type="submit" class="button" style="color: white; background: orange" onclick="location.href='<c:url value="productRegisterForm.oa"/>'">상품 등록하기</button>
<br>
<div class="">
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
	</div>
	</div>
<br>
	</div>
	
</body>
</html>