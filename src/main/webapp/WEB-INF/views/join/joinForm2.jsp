<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>회원가입</h2>
	
	<form action="./joinSuccess.oa" method="post">
		전화번호:<input type="text" name="B_PHONE"><br/>
		비밀번호:<input type="password" name="B_PASSWORD"><br/>
		이름:<input type="text" name="B_NAME"><br/>
		닉네임:<input type="text" name="B_NICKNAME"><br/>
		생일:<input type="text" name="B_BIRTH"><br/>
		
		<br/>
	
		
		<input type="submit" value="가입">
		
	</form>

</body>
</html>