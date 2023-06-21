<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<title>문자메시지 인증 팝업창</title>
<%-- <script src="${path }/resources/js/join/coolsms.js"></script>
  --%><script src="${path }/resources/js/join/jquery-1.12.4.js"></script><script type="text/javascript"></script>
</head>
<script>

//휴대폰 번호 인증
var code2 = "";

function phoneChkClicked(){
	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
	var phone = $("#phone").val();
	$.ajax({
        type:"GET",
        url:"${path}/phoneCheck?phone=" + phone,
        dataType : "text",
        cache : false,
        success:function(data){
        	console.log(data);
        	if($.trim(data) == "error"){
        		alert("휴대폰 번호가 올바르지 않습니다.")
				$("#successChk").text("유효한 번호를 입력해주세요.");
				$("#successChk").css("color","red");
				$("#phone").attr("autofocus",true);
        	}else{	        		
        		$("#phone2").attr("disabled",false);
        		$("#phoneChk2").css("display","inline-block");
        		$("#successChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
        		$("#successChk").css("color","green");
        		$("#phone").attr("readonly",true);
        		code2 = data;
        	}
        },
        error:function(data){
        	alert("실패");
        }
    });
}

//휴대폰 인증번호 대조
function phoneChk2Clicked(){
	
	
	if($("#phone2").val() == code2){
		$("#successChk").text("인증번호가 일치합니다.");
		$("#successChk").css("color","green");
		$("#phoneDoubleChk").val("true");
		$("#phone2").attr("disabled",true);
		window.opener.location.href="${path}/join/utilClauPage";            //인증이 완료되면 부모창을 회원가입 페이지로 이동
		window.close();                                //팝업 페이지 종료
	}else{
		$("#successChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$("#successChk").css("color","red");
		$("#phoneDoubleChk").val("false");
		$(this).attr("autofocus",true);
	}
	
}

</script>
<body>
<table>
	<tr>
		<td colspan="3" align="center">휴대폰 인증하기</td>
	</tr>
	<tr>
		<td><input type="text" id="phone"></td>
		<td><input type="button" value="인증번호 보내기" id="phoneChk" onclick="phoneChkClicked()" name="phoneChk"></td>
	</tr>
	<tr>
		<td><input type="text" id="phone2" disabled></td>
		<td><input type="button" value="본인인증" id="phoneChk2" onclick="phoneChk2Clicked()"></td>
		<td><label id="successChk">휴대폰 번호 입력후 인증번호 보내기를 해주십시오.</label></td>
		
		<input type="hidden" id="phoneDoubleChk">
	</tr>
	<tr>
		<td colspan="3">최초 가입 시에만 사용하고 있습니다. 따로 저장되지 않습니다.(번호만 입력해주세요.)</td>
	</tr>
</table>
</body>
</html>	