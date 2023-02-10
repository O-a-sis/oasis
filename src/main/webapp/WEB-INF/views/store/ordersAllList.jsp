<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html>
<head>
<style>
.button { 
	border-radius:7px;
	font-size:16px;
	width:100px;
}
</style>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/side.css'/>" />
<meta charset="UTF-8">
<title>관리자 - 재고관리</title>
</head>
<body>
<div>
<h1 style="display:inline" onclick="location.href='<c:url value="main.oa"/>'">오아시스</h1>
<h3 style="display:inline">${sessionScope.S_NAME} - 관리자</h3>
</div>
<div style="height: 100px; width: 100%; background-color: #ff6600; padding:10px">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1 style="color:white; display:inline"><strong>거래내역</strong></h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
       <h1 style="color:white; display:inline"><strong>이전 거래내역</strong></h1>
</div>
<h1 id="clock"><strong></strong></h1>
<br>
<h2 style="display:inline"><strong>이전 거래내역</strong></h2>&nbsp;&nbsp;

<br><br>
	<c:forEach items="${list}" var="item">
			<table class="orders" border=0 width=900px align=center>
				<colgroup>
					<col width="*%" />
					<col width="13%" />
					<col width="20%" />
					<col width="15%" />
					<col width="20%" />
				</colgroup>
				<tr>
				<td><span>${item.O_LIST}</span>
				<input type=hidden id="oidx" value="${item.O_IDX}">
				</td>
				<td>${item.O_SUM}원</td>
				<td>${item.O_DATE}</td>
				<c:if test="${item.O_STATUS eq '1'}">
					<td><h3><strong>접수대기</strong></h3></td>
					<td><button type="button" class="button" style="color:white; background:orange" id="uptBtn">접수</button>
					<input type=hidden id="oidx" value="${item.O_IDX}">
					</td>
				</c:if>
				<c:if test="${item.O_STATUS eq '2'}">
					<td><h3><strong>제조중</strong></h3></td>
					<td><button type="button" class="button" style="color:white; background:blue" id="uptPcBtn">제조완료</button>
					<input type=hidden id="oidx" value="${item.O_IDX}">
					</td>
					
				</c:if>
				<c:if test="${item.O_STATUS eq '3'}">
					<td><h3><strong>제조완료</strong></h3></td>
					<td><button type="button" class="button" style="color:white; background:black">제조완료</button></td>
				</c:if>
				
			</table>
		</c:forEach>
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
</html>