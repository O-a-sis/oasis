<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ include file="/WEB-INF/include/include-storeheader.jspf" %>
=======
>>>>>>> 795bd4b (no message)
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>관리자 - 공지사항</title>
<STYLE TYPE="text/css">
table {font-size: 12pt;}

.button { 
	border-radius:7px;
	font-size:18px;
	width:120px;
}
</STYLE>
</head>
<body>

<h1 id="clock"><strong></strong></h1>
<div>
 <h1><strong>공지사항</strong></h1>
 <hr style="width:100%;">
</div>
<div>
 <h3>
 	[<c:if test="${detail.N_TYPE eq 'S'}">본사 공지</c:if>
	<c:if test="${detail.N_TYPE eq 'E'}">이벤트</c:if>] &nbsp;
	${detail.N_TITLE}
 </h3>
 <h4 color=#D8D8D8>${detail.N_DATE}</h4>
 <hr style="width:100%;">
</div>
<div>
 <h4>${detail.N_CONTENT}</h4>
 <br><br><br><br><br><br><br>
 <hr style="width:100%;">
</div>
<div>
<center><button type="button" class="button" style="color:white; background:orange" onclick="location.href='<c:url value="noticeList.oa?page=${param.page}"/>'">목록으로</button></center>
</div>

=======
<title>Insert title here</title>
</head>
<body>

>>>>>>> 795bd4b (no message)
</body>
</html>