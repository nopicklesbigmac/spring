<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path }/resources/css/megabox.min.css" media="all">
<script src="${path }/resources/js/join/jquery-1.12.4.js"></script><script src="${path }/resources/js/join/jquery-ui.1.12.1.js"></script><script type="text/javascript"></script>
<title>회원가입 메인페이지</title>
</head>
<script>

//아이디 유효성 검사
function CheckId(str){
   var reg1 = /^[a-z0-9]{8,12}$/;    // a-z 0-9 중에 8자리 부터 12자리만 허용 한다는 뜻
   var reg2 = /[a-z]/g;    
   var reg3 = /[0-9]/g;
   var idChkMsg = $("#JoinInfoRegLoginId-error-text");
   if(reg1.test(str) &&  reg2.test(str) && reg3.test(str)){
	   idChkMsg.text('사용 가능한 아이디입니다');
	   idChkMsg.css("color","green");
	   return true;
   }else{
	   idChkMsg.text('아이디는 영문,숫자 조합 8자리 이상 12자리 이하 입니다.');
	   idChkMsg.css("color","red");
	   return false;
   }
};

//비밀번호 유효성 검사
function CheckPw(str){

	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	 if(pw.length < 10 || pw.length > 16){
	  	return false;
	 }else if(pw.search(/\s/) != -1){
	  	return false;
	 }else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
	 	 return false;
	 }else {
		return true;
 }

}


//이름 유효성 검사
function CheckName(str){
	var nameChkMsg = $("#JoinInfoRegLoginName-error-text");
	if (str == "") {	
		nameChkMsg.text('이름을 입력해주세요');	
		return false;
	}else if(str.length < 2){
		nameChkMsg.text('이름은 2글자 이상으로 입력해주세요');
		return false;
	}
	for (var i=0; i<str.length; i++)  {  
		  var chk = str.substring(i,i+1);   
		  if(chk.match(/[0-9]|[a-z]|[A-Z]/)) {    
				nameChkMsg.text('이름을 정확히 입력해주세요');
				return false;
		}   
		if(chk.match(/([^가-힣\x20])/i)){   
			nameChkMsg.text('이름을 정확히 입력해주세요');  
			return false;
		}    
		if(str.value == " "){ 
			nameChkMsg.text('이름을 정확히 입력해주세요'); 
			return false;
		  	}
	} 
	nameChkMsg.text('');
	return true;
}

//이메일 유효성 검사
function CheckEmail(str){
	 var emailChkMsg = $("#JoinInfoRegEmail-error-text");
	 var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 if(str.match(pattern)!=null){
		 emailChkMsg.text('');
		 return true;
	 }else{
		 emailChkMsg.text('올바른 이메일 형식으로 입력해주세요.')
		 return false;
	 }
}

var id;
var pw;
var pw1;
var name;
var email;

//이름에서 뗏을때
function NameBlur(obj){
	name = obj.value;
	if(CheckName(name)==false){
		$("#nameDoubleChk").val('false');

	}else{
		$("#nameDoubleChk").val('true');
	}
}


//id에서 뗏을때
function idBlur(obj){
	id = obj.value;
	if(CheckId(id)==false){
		$("#idDoubleChk").val('false');
	}else{
		$("#idDoubleChk").val('true');
		
	}
}


//비밀번호에서 뗏을 때
function pwBlur(obj){
	var pwChkMsg = $("#JoinInfoRegLoginPwd-error-text");
	pw = obj.value;
	if(CheckPw(pw)==true){
		if(pw==pw1){
			$("#pwDoubleChk").val('true');	
			pwChkMsg.text('');
		}else{
			if(typeof pw != "undefined" && typeof pw1 != "undefined"){
				pwChkMsg.text('비밀번호와 비밀번호 확인의 입력값이 일치하지 않습니다.');
				pwChkMsg.css("color","red");
			}
			$("#pwDoubleChk").val('false');
		}
		
	}else {
		pwChkMsg.text('비밀번호는 영문,숫자,특수기호 중 2가지 이상 조합하여 10자리 이상 16자리 이하 입니다.');
		$("#pwDoubleChk").val('false');
	}
}

//비밀번호확인에서 뗏을 때
function pwChkBlur(obj){
	var pwDoubleChkMsg = $("#JoinInfoRegLoginPwdConfirm-error-text");
	pw1 = obj.value;
	
	if(CheckPw(pw1)==true){
		if(pw==pw1){
			$("#pwDoubleChk").val('true');	
			pwDoubleChkMsg.text('');
		}else{
			if(typeof pw != "undefined" && typeof pw1 != "undefined"){
				pwDoubleChkMsg.text('비밀번호와 비밀번호 확인의 입력값이 일치하지 않습니다.');
				pwDoubleChkMsg.css("color","red");
			}
			$("#pwDoubleChk").val('false');
		}
	}else {
		pwDoubleChkMsg.text('비밀번호는 영문,숫자,특수기호 중 2가지 이상 조합하여 10자리 이상 16자리 이하 입니다.');
		$("#pwDoubleChk").val('false');
	}
}

//이메일 키업 이벤트
function emailChkKeyUp(obj){
	email = obj.value;
	if(CheckEmail(email)==false){
		$("#emailDoubleChk").val('false');
	}else{
		$("#emailDoubleChk").val('true');
	}
}


//중복확인 버튼 클릭시
function idCheckBtnClicked(){
	if($("#idDoubleChk").val()=='true'){
		$.ajax({
			url : '${path}/idCheck?id='+ id,
			type : 'post',
			cache : false,
			success : function(data) {
				console.log("성공");
				if ($.trim(data) != '0') {
					console.log(data);
					console.log(1);
					$("#ididDoubleChk").val('false');
					alert("중복된 id입니다");
				}else{
					$("#ididDoubleChk").val('true');
					alert("사용 가능한 id입니다");
				}
			}, error : function() {
				console.log("실패");
			}
		});
	}else{
		alert("올바른 id를 입력해주세요");
	}
}

//회원가입 버튼 클릭시
function regBtnClicked(){
	var birth = $("#birth").val();
	var param ={
			"u_name":name, 
			"u_id":id, 
			"u_pw":pw,
			"u_email":email,
			"u_birth":birth
	};
	if($("#nameDoubleChk").val() != 'true'){
		alert('이름을 정확히 입력해주세요');
	}else if(!birth){
		alert("생년월일을 입력해주세요");
	}else if($("#ididDoubleChk").val() != 'true'){
		alert('아이디 중복확인을 진행해주세요');
	}else if($("#pwDoubleChk").val() != 'true'){
		alert('비밀번호를 정확히 입력해주세요');
	}else if($("#emailDoubleChk").val() != 'true'){
		alert('이메일을 정확히 입력해주세요');
	}else{
		$.ajax({
			url : '${path}/reg',
			type : 'post',
			cache : false,
			contentType : 'application/json',
			data:JSON.stringify(param),
			success : function(data) {
				console.log(data);
				alert('회원가입이 완료되었습니다');
				location.href="${path}/join/regFinish?name="+ data.name;
				console.log("성공");
			}, error : function() {
				console.log("실패");
			}
		});
	}
}
</script>
<body>
<div class="member-wrap">
		<h1 class="ci"><a href="${path }/main" title="메인 페이지로 이동">MEGABOX : Life Theater</a></h1>

		<!-- col-wrap -->
		<div class="col-wrap">
			<!-- col -->
			<div class="col">
				<!-- step-member -->
				<div class="step-member" title=""><!--step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 단계 중 step3 정보입력 단계-->
					<ol>
						<li>
							<p class="step">
								<em>STEP1.</em> <span>본인인증<!--본인인증--></span>
							</p>
						</li>
						<li>
							<p class="step">
								<em>STEP2.</em> <span>약관동의<!--약관동의--></span>
							</p>
						</li>
						<li>
							<p class="step on">
								<em>STEP3.</em> <span>정보입력<!--정보입력--></span>
							</p>
						</li>
						<li>
							<p class="step">
								<em>STEP4.</em> <span>가입완료<!--가입완료--></span>
							</p>
						</li>
					</ol>
				</div>
				<!--// step-member -->

				<p class="page-info-txt">
					<strong>안녕하세요.<!--님 안녕하세요.--></strong>
					<span>회원정보를 입력해주세요.<!--회원정보를 입력해주세요.--></span>
				</p>

				<div class="table-wrap">
					<table class="board-form">
						<caption>생년월일, 휴대폰번호, 아이디, 비밀번호, 비밀번호 확인, 이메일 주소, 무인발권기 기능설정, 나만의 메가박스 항목을 가진 회원가입 정보입력 표<!--생년월일, 휴대폰번호, 아이디, 비밀번호, 비밀번호 확인, 이메일 주소, 무인발권기 기능설정, 나만의 메가박스 항목을 가진 회원가입 정보입력 표--></caption>
						<colgroup>
							<col style="width:130px;">
							<col>
						</colgroup>
						<tbody>
						<tr>
								<th scope="row"><label for="ibxJoinInfoRegName">이름<!--이름--></label></th>
								<td>
									<input maxlength="8" id="ibxJoinInfoRegName" type="text" placeholder="이름을 입력하세요" class="input-text w260px" onkeyup="NameBlur(this)"><!--영문,숫자,특수기호 중 2가지 이상 조합-->
									<div id="JoinInfoRegLoginName-error-text" class="alert"></div>
									<input type="hidden" id="nameDoubleChk"/>
								</td>
							</tr>
							<tr>
								<th scope="row">생년월일<!--생년월일--></th>
								<td id="ibxMbJoinInfoRegBirthDe"><input type="date" min="1920-01-01" max="2015-01-01" id="birth"></td>
							</tr>

							<!-- 휴대폰 번호 불러올때 -->
							<tr id="trMblpTelno"><th scope="row">휴대폰 번호 <!--휴대폰 번호 --></th><td>   ${phoneNum }</td></tr>
							<tr id="nonMbCertRow" style="display: none;">
								<th scope="row"><label for="mblpCharCertNo">인증번호<!--인증번호--></label></th>
								<td>
									<div class="chk-num">
										<div class="line">
											<input maxlength="4" id="mblpCharCertNo" type="text" class="input-text w210px" title="인증번호 입력"><!--인증번호 입력-->

											<div class="time-limit" id="timer">
												3:00
											</div>
										</div>
									</div>

									<button id="btnMblpCharCert" type="button" class="button gray-line small w75px ml08 disabled">인증확인</button>
									<div id="nonMbCert-error-text" class="alert"></div>
								</td>

							</tr>
							<tr>
								<th scope="row"><label for="ibxJoinInfoRegLoginId">아이디<!--아이디--></label></th>
								<td>
									<input maxlength="12" id="ibxJoinInfoRegLoginId" type="text" placeholder="영문,숫자 조합(8~12자)" class="input-text w260px" onkeyup="idBlur(this)"><!--영문,숫자 조합(8~12자)-->
									<button id="btnMbLoginIdDupCnfm" type="button" class="button gray-line small w75px ml08 disabled" onclick="idCheckBtnClicked()">중복확인<!--중복확인--></button>
									<div id="JoinInfoRegLoginId-error-text" class="alert"></div>
									 <input type="hidden" id="idDoubleChk"/>
									 <input type="hidden" id="ididDoubleChk"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxJoinInfoRegLoginPwd">비밀번호<!--비밀번호--></label></th>
								<td>
									<input maxlength="16" id="ibxJoinInfoRegLoginPwd" type="password" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" class="input-text w260px" onblur="pwBlur(this)"><!--영문,숫자,특수기호 중 2가지 이상 조합-->
									<span class="tooltiptext">비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ &amp; * + = - ? _  입니다.</span>
									<div id="JoinInfoRegLoginPwd-error-text" class="alert"></div>
									<input type="hidden" id="pwDoubleChk"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxJoinInfoRegLoginPwdConfirm">비밀번호 확인<!--비밀번호 확인--></label></th>
								<td>
									<input maxlength="16" id="ibxJoinInfoRegLoginPwdConfirm" type="password" placeholder="영문,숫자,특수기호 중 2가지 이상 조합" class="input-text w260px" onblur="pwChkBlur(this)"><!--영문,숫자,특수기호 중 2가지 이상 조합-->
									<span class="tooltiptext">비밀번호 설정 시 사용가능한 특수문자는 ~ ! @ # $ % ^ &amp; * + = - ? _  입니다.</span>
									<div id="JoinInfoRegLoginPwdConfirm-error-text" class="alert"></div>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="ibxJoinInfoRegEmail">이메일 주소<!--이메일 주소--></label></th>
								<td>
									<input maxlength="50" id="ibxJoinInfoRegEmail" type="text" placeholder="이메일주소를 입력해 주세요" class="input-text w260px" onkeyup="emailChkKeyUp(this)"><!--이메일주소를 입력해 주세요-->
									<div id="JoinInfoRegEmail-error-text" class="alert"></div>
									<input type="hidden" id="emailDoubleChk"/>
								</td>
							</tr>
							<tr>
								<th scope="row">무인발권기<br>기능 설정<!--무인발권기<br />기능 설정--></th>
								<td>
									<input type="radio" id="kioskByymmddLoginSetY" name="kioskByymmddLoginSetAt">
									<label for="kioskByymmddLoginSetY">사용<!--사용--></label>

									<input type="radio" id="kioskByymmddLoginSetN" name="kioskByymmddLoginSetAt" class="ml10">
									<label for="kioskByymmddLoginSetN">사용안함<!--사용안함--></label>

									<span class="font-size-14 ml15">※ '생년월일 + 휴대폰번호로' 티켓출력<!--※ '생년월일 + 휴대폰번호로' 티켓출력--></span>
								</td>
							</tr>
							<tr>
								<th scope="row">나만의 메가박스<!--나만의 메가박스--></th>
								<td id="favorBrchRedTd">
									자주 방문하는 메가박스를 등록해 주세요!<!--자주 방문하는 메가박스를 등록해 주세요!-->

									<a href="javaScript:fn_favorBrchReg()" title="자주 방문하는 메가박스 설정 선택" class="button gray-line small w75px ml08" w-data="500" h-data="360">설정<!--설정--></a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- marketing-agree -->
				<div class="marketing-agree mt40">
					<p class="tit">마케팅 활용을 위한 개인정보 수집 이용 안내(선택)<!--마케팅 활용을 위한 개인정보 수집 이용 안내(선택)--></p>

					<div class="cont">
						<dl>
							<dt>수집목적</dt><dd>고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유</dd><dt>수집항목</dt><dd>이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬 정보수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그 </dd><dt>보유기간</dt><dd>회원 탈퇴 시 혹은 이용 목적 달성 시 까지</dd><!--<dt>수집목적</dt>
													   <dd>고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유</dd>
													   <dt>수집항목</dt>
													   <dd>이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬 정보수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그 </dd>
													   <dt>보유기간</dt>
													   <dd>회원 탈퇴 시 혹은 이용 목적 달성 시 까지</dd>-->
						</dl>

						<div class="radio-agree">
							<input type="radio" id="agree" name="marketing_agree">
							<label for="agree">동의<!--동의--></label>

							<input type="radio" id="notagree" name="marketing_agree" class="ml20">
							<label for="notagree">미동의<!--미동의--></label>
						</div>

						<p class="mt30">혜택 수신설정<!--혜택 수신설정--></p>

						<div class="benefit-agree">
							<input type="checkbox" id="push">
							<label for="push">알림<!--알림--></label>

							<input type="checkbox" id="sms" class="ml20">
							<label for="sms">SMS</label>

							<input type="checkbox" id="email" class="ml20">
							<label for="email">이메일<!--이메일--></label>
						</div>

						<p class="mt20">
							※  이벤트, 신규 서비스, 할인 혜택 등의 소식을 전해 드립니다.<br>(소멸포인트 및 공지성 안내 또는 거래정보와 관련된 내용은 수신 동의 여부와 상관없이 발송됩니다.)<!--※  이벤트, 신규 서비스, 할인 혜택 등의 소식을 전해 드립니다.<br />
														(소멸포인트 및 공지성 안내 또는 거래정보와 관련된 내용은 수신 동의 여부와 상관없이 발송됩니다.)-->
						</p>

					</div>
				</div>
				<!--// marketing-agree -->


				<div class="btn-member-bottom">
					<button id="btnJoinInfoRegButton" type="button" class="button purple large disabled" onclick="regBtnClicked()">회원가입<!--회원가입--></button>

				</div>
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
</body>
</html>