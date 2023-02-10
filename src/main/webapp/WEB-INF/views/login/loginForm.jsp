<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
</head>
<body>
<div style="height: 70px; width: 100%; background-color: #ff6600; padding:10px">
    <h1 style="display:inline; color:white;"><strong>오아시스</strong></h1>
	<h3 style="display:inline; color:white;"><strong>회원</strong></h3>
</div>
<br>
<center>
<h1>오아시스 로그인</h1>
<form action="<c:url value='login.oa'/>" method="POST">
<h3> 전화번호:&nbsp; <input type="text" name="B_PHONE" placeholder="전화 번호를 입력하세요"></h3>
<h3> 비밀번호:&nbsp; <input type="password" name="B_PASSWORD" placeholder="비밀번호를 입력하세요"></h3>
<button type="submit">로그인</button> <span> <a href='/Oasis/member/joinForm.oa'>회원가입</a></span>
<div>
<a href='/Oasis/member/findPw.oa'>비밀번호 찾기</a>
</div>
</form>
</center>
</body>
</html>