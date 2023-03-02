<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.thumbnail {
	background-color: orange;
	margin: 10px;
	width: 300px;
	height: 300px;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
}

.thumbnail {
	transition: all 0.3s ease-in-out;
	transform: scale(1);
}

.thumbnail:hover {
	transform: scale(1.1);
}

.notice_view_more {
	height: 55px;
	margin-bottom: 70px;
	width: 100%;
}

.notice_view_more p {
	height: 55px;
	margin: 0 auto;
	width: 55px;
}

.notice_view_more p a {
	background: url("");
	background-size: 100% auto;
	display: block;
	height: 100%;
	overflow: hidden;
	text-indent: -20000px;
	width: 100%;
}

table {
	border-collapse: collapse;
}

td {
	width: 300px;
	height: 300px;
	padding: 10px;
	vertical-align: top;
}

</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
	<br><br>
	<div>
		<h2 align="left">
			<strong><a href="/Oasis/admin/noticeList.oa">공지사항</a></strong>
		</h2>
	</div>
	<div>
		<button class="writebtn" type="button"
			onClick="location.href='noticeForm.oa'">글쓰기</button>
	</div>
	<p>
	<hr>
	<div class="noticeboard">
		<div class="wrap">
			<!-- 검색처리기능 -->
			<div class="search">
				<form id="searchForm"
					action="<c:url value='/admin/noticeList.oa' />" method="get">
					<select class="searcht" name="type">
						<option value="">--</option>
						<option value="TC" name="type"
							<c:out value="${param.type eq 'TC' ? 'selected' : ''}"/>>전체</option>
						<option value="T" name="type"
							<c:out value="${param.type eq 'T' ? 'selected' : ''}"/>>제목</option>
						<option value="C" name="type"
							<c:out value="${param.type eq 'C' ? 'selected' : ''}"/>>내용</option>
					</select>
					<c:choose>
						<c:when test="${param.keyword eq 'null'}">
							<input class="searchtext" type="text" name="keyword" value="" />
						</c:when>
						<c:otherwise>
							<input class="searchtext" type="text" name="keyword"
								value="<c:out value='${param.keyword}'/>" />
						</c:otherwise>
					</c:choose>
					<button class="btn btn-default sbtn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</form>
			</div>
			<p>
			<hr>
			<table align="center">
				<c:forEach var="item" items="${list}" varStatus="status">
					<c:if test="${status.index % 4 == 0}">
						<tr>
					</c:if>
					<td><a href="/Oasis/admin/noticeDetail.oa?N_IDX=${item.N_IDX}">
							<div class="thumbnail"
								style="background-image:url(/Oasis/img/${item.N_IMAGE}); border-radius: 10%;"></div>
					</a>
						<div class="setting" style="text-align: center;">
							<div class="noticeTitle">
								<c:if test="${item.N_TYPE eq 'B'}">
									<c:set var="type" value="고객" />
								</c:if>
								<c:if test="${item.N_TYPE eq 'S'}">
									<c:set var="type" value="매장" />
								</c:if>
								<c:if test="${item.N_TYPE eq 'E'}">
									<c:set var="type" value="이벤트" />
								</c:if>
								<h3>
									<a href="/Oasis/admin/noticeDetail.oa?N_IDX=${item.N_IDX}">[${type}]${item.N_TITLE}</a>
								</h3>
							</div>
							<div class="notieceDate">
								<p>
									<fmt:formatDate value="${item.N_DATE}" pattern="yyyy-MM-dd" />
								</p>
							</div>
						</div></td>
					<c:if test="${status.index % 4 == 3 or status.last}">
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="notice_view_more" style="">
		<p>
			<button class="loadmore" onClick="loadMore()">더보기</button>
			<input type="hidden" id="page" />
		</p>
	</div>
</body>
<script>

function loadMore() {
	var url = "<c:url value='/admin/loadMoreNotice.oa'/>"; // 추가 데이터를 가져올 URL
	var page = $("#page").val() == '' ? 2 : parseInt($("#page").val()) + 1; // 현재 페이지
	var type = "${param.type}"; // 검색 조건
	var keyword = "${param.keyword}"; // 검색 키워드

	// AJAX를 이용해 추가 데이터를 가져옵니다.
	$.ajax({
		url: url,
		type: "GET",
		data: {
			page: page,
			type: type,
			keyword: keyword,
		},
		success: function (data) {
			// 추가 데이터를 가져와서 HTML 코드를 생성합니다.
			var html = "";
			$.each(data.list, function (i, item) {
				if (i % 4 == 0) {
					html += '<tr>';
				}
				
				// item.N_DATE를 Date 객체로 변환합니다.
				var date = new Date(item.N_DATE);
				// 연도를 가져옵니다.
				var year = date.getFullYear();
				// 월을 가져옵니다. month는 0부터 시작하므로 1을 더해줍니다.
				var month = ('0' + (date.getMonth() + 1)).slice(-2);
				// 일을 가져옵니다.
				var day = ('0' + date.getDate()).slice(-2);
				// 연도, 월, 일을 합쳐서 YYYY-MM-DD 형식의 문자열을 만듭니다.
				var formattedDate = year + '-' + month + '-' + day;

				html += '<td><a href="/Oasis/admin/noticeDetail.oa?N_IDX=' + item.N_IDX + '">'
					+ '<div class="thumbnail" style="background-image:url(/Oasis/img/' + item.N_IMAGE + '); border-radius: 10%;"></div>'
					+ '</a><div class="setting" style="text-align: center;">'
					+ '<div class="noticeTitle">';
				if (item.N_TYPE === 'B') {
					html += '<c:set var="type" value="고객"/>';
				} else if (item.N_TYPE === 'S') {
					html += '<c:set var="type" value="매장"/>';
				} else if (item.N_TYPE === 'E') {
					html += '<c:set var="type" value="이벤트"/>';
				}
				html += '<h3><a href="/Oasis/admin/noticeDetail.oa?N_IDX=' + item.N_IDX + '">[${type}]' + item.N_TITLE + '</a></h3>'
					+ '</div><div class="notieceDate"><p>' + formattedDate + '</p></div></div></td>';
				if (i % 4 == 3 || i == data.list.length - 1) {
					html += '</tr>';
				}
				lastNIdx = item.N_IDX;
			});

			// HTML 코드를 DOM에 추가합니다.
			// 테이블을 선택합니다.
            var table = $("table");

            // 테이블의 모든 행을 가져옵니다.
            var rows = table.find("tr");

            // 마지막 행을 가져옵니다.
            var lastRow = rows[rows.length - 1];

            // 마지막 행 뒤에 HTML 코드를 추가합니다.
            $(lastRow).after(html);

			// 페이지네이션 정보를 업데이트합니다.
			var paging = data.paging;
			if (paging.currentPage < paging.totalPage) {
				$("#page").val(paging.currentPage + 1);
			} else {
				$(".loadmore").hide();
			}
		}
	});
}

</script>
</html>



