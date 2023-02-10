<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="sub_visual">
		<div class="wrap">
			<strong>공지게시판</strong>
			<p>판매자</p>
		</div>
	</div>
	<div class="noticeboard" style="height: 800px;">
		<div class="wrap">
			<!-- 검색처리기능 -->
			<div class="search">
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
			<div class="write" style="text-align: left">
				<a class="write" href="<c:url value='/admin/noticeForm.oa' />"
					class="btn" id="write">글쓰기</a>

			</div>
			<table class="board_list">
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.N_IDX}</td>
							<c:if test="${item.N_TYPE eq 'B'}">
								<c:set var="type" value="구매자" />
							</c:if>
							<c:if test="${item.N_TYPE eq 'S'}">
								<c:set var="type" value="판매자" />
							</c:if>
							<c:if test="${item.N_TYPE eq 'E'}">
								<c:set var="type" value="이벤트" />
							</c:if>
							<td style="text-align: left; padding: 0 10px;">
<a style="color: #ff7f00" href='<c:url value="/admin/noticeDetail.oa?N_IDX=${item.N_IDX}"/>'>[${type}]${item.N_TITLE}</a></td>
							<td>${item.N_DATE}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="paging">${paging.pageHtml}</div>
	</div>
</body>
<script>
	
</script>
</html>



