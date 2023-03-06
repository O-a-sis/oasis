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

<meta charset="UTF-8">
<title>상품관리</title>
<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>
</head>
<body>
	<div class="wrap">
		<div id="adminpdeatil">
			<br>
			<h1>상품상세</h1>
			<div>
				<h1>
					<strong>${map.P_IDX}&nbsp;&nbsp;${map.P_NAME}</strong>
				</h1>
				<table>
					<tr>
						<td colspan=2><img height=200px
							src="<c:url value='/img/${map.P_IMG}'/>" /></td>
						<td><h3>가격:&nbsp;&nbsp;${map.P_PRICE }</h3> ${map.P_CONTENT }</td>
					</tr>
				</table>
			</div>
	<br>
	<br>
	<div>
		<button type="button" class="button"
			style="color: white; background: #fdac76"
			onclick="location.href='<c:url value="productUpdateForm.oa?P_IDX=${map.P_IDX}"/>'">수정</button>
		</td> &nbsp;&nbsp;
		<button type="button" class="button"
			style="color: white; background: #e57272" onclick="removeCheck();">삭제</button>
		&nbsp;&nbsp;
		<button type="button" class="button"
			style="color: #fdac76; background: #fff; border:1px solid #fdac76"
			onclick="location.href='<c:url value="productList.oa?page=${param.page}"/>'">목록으로</button>
		</td>
		</div>
		</div>
	</div>
</body>
<script>
	function removeCheck() {
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			location.href = "/Oasis/admin/productDelete.oa?P_IDX=${map.P_IDX}";
		} else { //취소
			return false;
		}
	}
</script>
</html>