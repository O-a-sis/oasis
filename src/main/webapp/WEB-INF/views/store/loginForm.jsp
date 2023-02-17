<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
=======
>>>>>>> 795bd4b (no message)
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오아시스 관리자</title>
</head>
<body>
<<<<<<< HEAD
<div style="height: 70px; width: 100%; background-color: #ff6600; padding:10px">
    <h1 style="display:inline; color:white;"><strong>오아시스</strong></h1>
	<h3 style="display:inline; color:white;"><strong>관리자</strong></h3>
=======
<div style="height: 100px; width: 100%; background-color: orange;">
       <span><h1 style="color:white;">오아시스</h1></span> <span><h3 style="color:white;">관리자</h3></span>
>>>>>>> 795bd4b (no message)
</div>
<br>
<center>
<h1>오아시스 로그인</h1>
<<<<<<< HEAD
<form action="<c:url value='login.oa'/>" method="POST">
=======
<form action="<c:url value='/store/login.oa'/>" method="POST">
>>>>>>> 795bd4b (no message)
<h3> Username:&nbsp; <input type="text" name="STORE" placeholder="지점 번호를 입력하세요"></h3>
<h3> Password:&nbsp; <input type="text" name="S_PASSWORD" placeholder="지점 비밀번호를 입력하세요"></h3>
<button type="submit">로그인</button>

</form>
</center>
</body>
</html>