<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div>
		<h2 align="left">
			<strong>공지사항</strong>
		</h2>
	</div>
	<div>
		<button class="writebtn" type="button"
			onClick="location.href='noticeForm.oa'">글쓰기</button>
	</div>
	<p>
	<hr>
	</p>
	<div class="noticeboard">
		<div class="wrap">
			<!-- 검색처리기능 -->
			<div class="search" align="center">
				<form id="searchForm"
					action="<c:url value='/admin/noticeList.oa' />" method="get">
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
					<button class="btn btn-default sbtn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
			</div>

			<table class="board_list" width="800px" height="300px"
				cellpadding="5" align="center" border="0">
				<thead>
					<tr bgcolor="dcdcdc">
						<th>글번호</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach var="item" items="${list}">
						<tr>
							<td align="center">${item.N_IDX}</td>
							<c:if test="${item.N_TYPE eq 'B'}">
								<c:set var="type" value="구매자" />
							</c:if>
							<c:if test="${item.N_TYPE eq 'S'}">
								<c:set var="type" value="판매자" />
							</c:if>
							<c:if test="${item.N_TYPE eq 'E'}">
								<c:set var="type" value="이벤트" />
							</c:if>
							<td><a style="color: #ff7f00"
								href='<c:url value="/admin/noticeDetail.oa?N_IDX=${item.N_IDX}"/>'>[${type}]${item.N_TITLE}</a></td>
							<td>${item.N_DATE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="paging" align="center">${paging.pageHtml}</div>
	</div>
</body>
</html>



