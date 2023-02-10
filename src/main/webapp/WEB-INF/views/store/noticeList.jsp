<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
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
<div>
<h1 style="display:inline" onclick="location.href='<c:url value="main.oa"/>'">오아시스</h1>
<h3 style="display:inline">${sessionScope.S_NAME} - 관리자</h3>
</div>
<div style="height: 100px; width: 100%; background-color: #ff6600; padding:10px">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1 style="color:white; display:inline" onclick="location.href='<c:url value="todaysOrders.oa"/>'"><strong>거래내역</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <h1 style="color:white; display:inline" onclick="location.href='<c:url value="stock.oa"/>'"><strong>재고관리</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <h1 style="color:white; display:inline" onclick="location.href='<c:url value="noticeList.oa"/>'"><strong>공지사항</strong></h1>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   
	   <c:if test="${status eq '1'}">
       <button type="button" onclick="closeStore();">매장 마감</button>
       </c:if>
       <c:if test="${status eq '0'}">
       <button type="button" onclick="openStore();">매장 오픈</button>
       </c:if>
       
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <h1 style="color:white; display:inline" onclick="location.href='<c:url value="ordersAllList.oa"/>'"><strong>이전 거래내역</strong></h1>
</div>
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
					<td><a href='<c:url value="/store/noticeDetail.oa?N_IDX=${item.N_IDX}&page=${param.page}"/>'>${item.N_TITLE}</a></td>							
					<td align=center>${item.N_DATE}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="paging">${paging.pageHtml}</div>
</body>
    <script>
        window.onload = function () {
            // 변수를 선언합니다.
            var clock = document.getElementById('clock');
            // 매 1초마다 함수를 실행합니다.
            setInterval(function () {
                var today = new Date();
                let day = ['일', '월', '화', '수', '목', '금', '토'];

                function dateFormat(today) {
                    let dateFormat=today.getFullYear() + '년 ' + (today.getMonth()+1) + '월 '
                    + today.getDate() + '일 ' + day[today.getDay()] + '요일 '
                    + today.getHours() + '시 ' + today.getMinutes() + '분 '
                    + today.getSeconds() + '초';
                    return dateFormat;
                }

                clock.innerHTML = dateFormat(today).toString();
            }, 1000);
        };
    </script>
<script>
    function openStore() {
    	if(confirm("매장을 오픈하시겠습니까?")) {
    		location.href="/Oasis/store/open?STORE=${sessionScope.STORE}";
    	} 
    }
    
    function closeStore() {
    	if(confirm("매장을 마감하시겠습니까?")) {
    		location.href="/Oasis/store/close?STORE=${sessionScope.STORE}";
    	} 
    }
</script>
</html>