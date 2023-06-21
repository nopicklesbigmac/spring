<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<form action="login" method="post">
		<input type="text" name="id" placeholder="아이디" /><br>
		<input type="password" name="pw" placeholder="비밀번호" /><br>
		<input type="submit" value="로그인" />
		<input type="button" value="취소" onclick="location.href='/springRequest/index'" />
	</form>
</body>
</html>