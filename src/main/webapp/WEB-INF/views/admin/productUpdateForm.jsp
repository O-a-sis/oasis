<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/storedefault.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/storesub.css'/>" />
<style>
.button {
	border-radius: 7px;
	font-size: 16px;
	width: 100px;
}
</style>
<meta charset="UTF-8">
<title>상품관리</title>
<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>
</head>
<body>
	<div class="wrap">
		<div id="pupate">
			<form method="post" action="/Oasis/admin/productUpdate.oa"
				onSubmit="return submitCheck();">
				<input type=hidden name="P_IDX" value="${map.P_IDX}"> <input
					type=hidden name="P_IMG" value="${map.P_IMG}">
				<h1>
					<strong>${map.P_IDX}&nbsp;&nbsp;${map.P_NAME}</strong>
				</h1>

				<table>
					<tr>
						<td colspan=2><img height=200px
							src="<c:url value='/images/contents/${map.P_IMG}'/>" /></td>
						<td><h3>
								가격:&nbsp;&nbsp;<input type="text" name="P_PRICE"
									value="${map.P_PRICE}">
							</h3> <textarea style="width: 220px; height: 142px;" name="P_CONTENT">${map.P_CONTENT }</textarea>
						</td>
					</tr>
				</table>

				<button type="submit" class="button"
					style="color: white; background: orange">수정완료</button>
				</td> &nbsp;
				<button type="reset" class="button"
					style="color: white; background: #e25b5b">리셋</button>
				</td>
			</form>
		</div>
	</div>
</body>
</html>