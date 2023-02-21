<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> kakaoPay api 이용하기 </h1>
 
<form method="post" action="/Oasis/kakaoPay" accept-charset="utf-8">
상품명 :<input type="text" name="product" id="product"/><br>
주문번호 :<input type="text" name="orderno" id="orderno"/><br>
가격 :<input type="text" name="price" id="price"/><br>
유저아이디 :<input type="text" name="userId" id="userId"/><br>
수량 :<input type="text" name="count" id="count"/><br>
    <button>카카오페이로 결제하기</button>
</form>
</body>
</html>