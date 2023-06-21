//제이쿼리 작동확인
if (typeof jQuery == 'undefined') {
  alert("작동 안된다");
}else{
alert("작동 잘되네");
}

//휴대폰 번호 인증
var code2 = "";
$("#phoneChk").click(function(){
	alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
	var phone = $("#phone").val();
	$.ajax({
        type:"POST",
        url:"/join/phoneCheck",
        cache : false,
        success:function(data){
        	if(data == "error"){
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
        }
    });
});

//휴대폰 인증번호 대조
$("#phoneChk2").click(function(){
	if($("#phone2").val() == code2){
		$("#successChk").text("인증번호가 일치합니다.");
		$("#successChk").css("color","green");
		$("#phoneDoubleChk").val("true");
		$("#phone2").attr("disabled",true);
	}else{
		$("#successChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$("#successChk").css("color","red");
		$("#phoneDoubleChk").val("false");
		$(this).attr("autofocus",true);
	}
});