<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오아시스 관리자</title>
</head>
<body>
<div style="height: 70px; width: 100%; background-color: #ff6600; padding:10px">
    <h1 style="display:inline; color:white;"><strong>오아시스</strong></h1>
	<h3 style="display:inline; color:white;"><strong>관리자</strong></h3>
</div>
<br>
<center>
<h1>오아시스 로그인</h1>
<form action="<c:url value='login.oa'/>" method="POST">
<h3> Username:&nbsp; <input type="text" name="STORE" placeholder="지점 번호를 입력하세요"></h3>
<h3> Password:&nbsp; <input type="text" name="S_PASSWORD" placeholder="지점 비밀번호를 입력하세요"></h3>
<button type="submit">로그인</button>

</form>
</center>
</body>
</html>