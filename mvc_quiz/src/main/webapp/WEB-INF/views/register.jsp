<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
</head>
<body>
	<form action="register" method="post" >
		<input type="text" name="id"  placeholder="아이디"><br>
		<input type="password" name="pwd"  placeholder="비밀번호"><br>
		<input type="text" name="name"  placeholder="이름"><br>
		<input type="submit" value="회원 가입">
		<input type="button" value="취소" onclick="location.href='list'">
	</form>
</body>
</html>