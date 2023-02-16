<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-storeheader.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 공지사항</title>
<STYLE TYPE="text/css">
table {font-size: 12pt;}
</STYLE>
</head>
<body>

<h1 id="clock"><strong></strong></h1>
	<table border=0 style="table-layout: fixed">
		<colgroup>
			<col width="15%" />
			<col width="*%" />
			<col width="30%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col" align=center>종류</th>
				<th scope="col" align=center>게시글 명</th>
				<th scope="col" align=center>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
					<td align=center>
					<c:if test="${item.N_TYPE eq 'S'}">본사 공지</c:if>
					<c:if test="${item.N_TYPE eq 'E'}">이벤트</c:if>
					</td>
					<td><a href='<c:url value="/store/noticeDetail.oa?N_IDX=${item.N_IDX}&page=${page}"/>'>${item.N_TITLE}</a></td>							
					<td align=center>${item.N_DATE}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="paging">${paging.pageHtml}</div>
</body>
</html>