<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<title>본사-회원관리</title>


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
			<strong>회원관리</strong>
		</h2>

	</div>
	<br>
		<div
		style="height: 20px; width: 100%; background-color: #ff6600;">
	</div>
	<br><br>

<h1>회원 목록</h1>
<table class="board_list" border="1">
   <thead>
      <tr>
         <th scope="col">회원 이름</th>
         <th scope="col">회원 생년월일</th>
         <th scope="col">회원 전화번호</th>
         <th scope="col">회원 닉네임</th>
         <th scope="col">회원 가입날짜</th>
      </tr>
   </thead>
   <tbody>

      <c:choose>
          <c:when test="${fn:length(list) > 0}">
            <c:forEach var="item" items="${list}">


               <tr>
                  <td>${item.B_NAME}</td>
                  <td>${item.B_BIRTH}</td>
                  <td>${item.B_PHONE}</td>
                  <td>${item.B_NICKNAME}</td>
                  <td>${item.B_DATE}</td>
               </tr>

            </c:forEach>
         </c:when>

         <c:otherwise>
            <tr>
               <td colspan="4">조회된 결과가 없습니다.</td>
            </tr>
         </c:otherwise>
      </c:choose>
   </tbody>
</table>


<div class="paging" align="center">${paging.pageHtml}</div>


</body>
</html>