<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<title>문자메시지 인증 팝업창</title>
<%-- <script src="${path }/resources/js/join/coolsms.js"></script>
  --%><script src="${path }/resources/js/join/jquery-1.12.4.js"></script><script type="text/javascript"></script>
</head>
<body>
<script>
window.opener.location.href=window.opener.location.href;            //인증이 완료되면 부모창을 회원가입 페이지로 이동
window.close();    
</script>
</body>
</html>