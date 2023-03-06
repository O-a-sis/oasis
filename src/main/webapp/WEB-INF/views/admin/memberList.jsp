<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<title>본사-회원관리</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/storedefault.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/storesub.css'/>" />
<title>본사-지점관리</title>
<%@ include file="/WEB-INF/include/include-adminheader.jspf"%>

</head>

<body>
<div class="wrap">
	<div id="adminmlist">

<h1>회원 목록</h1>
<table class="board_list" >
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

</div>
</div>
</body>
</html>