<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
상품명 :<input type="text" name="product" id="product"/><br>
주문번호 :<input type="text" name="orderno" id="orderno"/><br>
가격 :<input type="text" name="price" id="price"/><br>
유저아이디 :<input type="text" name="usetId" id="userId"/><br>
수량 :<input type="text" name="count" id="count"/>
<button id="btn-kakaopay" class="btn btn-primary">카카오페이</button>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> 
<script src="<c:url value='/js/kakaopay.js'/>"></script>
</html>