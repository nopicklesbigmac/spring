<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />



<!doctype html>
<!--[if lt IE 10]><html class="lt-ie9" lang="ko"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="ko">
<!--<![endif]-->
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes" />
<link rel="shortcut icon" href="/static/pc/images/favicon.ico" />







<title>MEET PLAY SHARE, 메가박스</title>
<meta property="name" id="metaTagTitle" content="MEET PLAY SHARE, 메가박스" />
<meta property="description" id="metaTagDtls"
	content="사람들과 공유할 수 있는, 공간경험을 만듭니다." />
<meta property="keywords" id="metaTagKeyword"
	content="메가박스,megabox,영화,영화관,극장,티켓,박스오피스,상영예정작,예매,오페라,싱어롱,큐레이션,필름소사이어티,클래식소사이어티,이벤트,Movie,theater,Cinema,film,Megabox" />

<meta property="fb:app_id" id="fbAppId" content="546913502790694" />


<meta property="og:site_name" id="fbSiteName" content="메가박스" />
<meta property="og:type" id="fbType" content="movie" />
<meta property="og:url" id="fbUrl"
	content="https://www.megabox.co.kr/main" />
<meta property="og:title" id="fbTitle" content="MEET PLAY SHARE, 메가박스" />
<meta property="og:description" id="fbDtls"
	content="사람들과 공유할 수 있는, 공간경험을 만듭니다." />
<meta property="og:image" id="fbImg"
	content="https://img.megabox.co.kr/SharedImg/metaTag/2020/02/04/gFfTzMwwiCxhBwcUV5TRGMFX9Cmoj64W.jpg" />






<link rel="stylesheet" href="${path }/resources/css/megabox.min.css"
	media="all" />
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-30006739-3"></script>
<script>window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', 'UA-30006739-3');</script>
<script src="${path }/resources/js/main/megabox.api.min.js"></script>
<script src="${path }/resources/js/main/lozad.min.js"></script>
<script src="${path }/resources/js/main/megabox.common.min.js"></script>
<script src="${path }/resources/js/main/megabox.netfunnel.min.js"></script>
<script src="${path }/resources/js/main/persona.js" async></script>

<style>
.swal-icon 
{
	/* background-color: #503396; */
}
.swal-button 
{
	background-color: #503396;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>

<body>

	<div class="skip" title="스킵 네비게이션">
		<a href="#contents" title="본문 바로가기">본문 바로가기</a> <a href="#footer"
			title="푸터 바로가기">푸터 바로가기</a>
	</div>

	<div class="body-wrap">





		<!-- <script async defer src="https://connect.facebook.net/en_US/sdk.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script> -->
		<script src="${path }/resources/js/main/hmac-sha256.js"></script>
		<script src="${path }/resources/js/main/enc-base64-min.js"></script>
		
		<c:if test="${errMsg != null && errMsg != ''}">
			<script>alert("${errMsg}");</script>
		</c:if>
		<script type="text/javascript">
/*전역변수
아이디
패스워드  입력 완료 체크 변수 필요
*/
var sValidateLoginIdAt  = 'N';	//로그인ID  입력 검증 여부
var sValidateLoginPwdAt = 'N';	//로그인PWD 입력 검증 여부
var submitIng = false;
var sCookieVal = "";	//쿠키값
/*
window.fbAsyncInit = function() {
	FB.init({
    	appId            : '',
      	autoLogAppEvents : true,
      	xfbml            : true,
      	version          : ''
   });
};

var naverLogin = new naver.LoginWithNaverId({
	clientId: '',
	callbackUrl: location.href,
	isPopup: false,
	callbackHandle: false
	// callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다.
});
*/

function search_movie_by_name(){
	var mName = document.getElementById('headerMovieName').value;
	location.href='search?mName=' + mName;
}

//홍현식     로그인 버튼 클릭시 모달 레이어
function fn_viewLoginPopup_new(){
	$("#layer_login_select").addClass('on');
	document.body.classList.add('no-scroll');
	$(".shadow").show();
}

//홍현식     로그인 창에서 x 버튼 누를 시 모달 레이어 닫음
function login_modal_close(){
	$("#layer_login_select").removeClass('on');
	document.body.classList.remove('no-scroll');
}


$(function(){
	function textChange(){
		   if(req.readyState == 4 && req.status == 200){

		   }
		}
	$(".movie-list-info").mouseover(function(){
	       $(this).find('.wrap').css("display", "block");
	});
	$(".movie-list-info").mouseout(function(){
	       $(this).find('.wrap').css("display", "none");
	});
	$(".btn-util > #likebtn").click(function(){
		var userid ='${sessionScope.loginId}';
		
		if(userid==""|| userid == null) {
		swal ("로그인후 이용가능합니다 .",'','')
			return ;
			
		}
		$(this).find('.iconset').toggleClass('on');
		
		var like = $(this).find('span').text();
		var m_num = $(this).attr("data-no");
		var l_type = $(this).attr("data-type");
		if (l_type=="on"){
			$(this).removeAttr("data-type");
			$(this).attr("data-type","off");
			$(this).find('span').text(parseInt(like)-1);
		}else{
			$(this).removeAttr("data-type");
			$(this).attr("data-type","on");
			$(this).find('span').text(parseInt(like)+1);
		}
		var params = {
				m_num     : m_num
	    	  ,	l_type     : l_type
  	 }
		 req = new XMLHttpRequest();
		 req.onreadystatechange = textChange;
		 req.open('post', 'like');
		 params = JSON.stringify(params);
		 req.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
		 req.send(params); 
		
	});
	/*로그인 버튼 비활성*/
	$("#btnLogin").attr("disabled", true);

	/*쿠키조회 pc 아이디값 입력 및 자동로그인 체크*/
	sCookieVal = fn_getCookie('loginId');
	if (!(sCookieVal == null || sCookieVal == "")){
		$("#ibxLoginId").val(sCookieVal);
		$("input:checkbox[id='chkIdSave']").prop("checked",true);
		fn_validateInputVal("loginId",sCookieVal);
	}

	/*이벤트*/
	/*로그인*/
	$("#btnLogin").click(function(){
		var sLoginId   = $("#ibxLoginId").val();
		var sLloginPwd = $("#ibxLoginPwd").val();

// 		//아이디 생성규칙 확인
// 		if(!fn_validateInputVal("loginId" ,$("#ibxLoginId").val(), 'Y')) {
// 			$("#ibxLoginId").focus();
// 			return;
// 		}
// 		//패스워드 생성규칙확인
// 		if(!fn_validateInputVal("loginPwd",$("#ibxLoginPwd").val(), 'Y')) {
// 			$("#ibxLoginPwd").focus();
// 			return;
// 		}

		$('#error-text').text('');

		//아이디 저장 버튼 체크시 쿠키 설정
		if($("input:checkbox[id='chkIdSave']").is(":checked")){
			fn_setCookie('loginId',$("#ibxLoginId").val(),730);
		}
		//아이디 저장 체크 안했을때 쿠키 삭제
		else if(!$("input:checkbox[id='chkIdSave']").is(":checked")){
			fn_deleteCookie('loginId');
		}

		fn_selectMbLogin(sLoginId, sLloginPwd);	//로그인
	});

	/*아이디 입력시 체크 */
	$("#ibxLoginId").on("keyup", function(e){
		if(fn_validateInputVal("loginId", $(this).val())){
			if(e.keyCode == 13){$("#btnLogin").click();}
		} else {
			if(e.keyCode == 13){$("#ibxLoginPwd").focus();}
		}

		return;
	});

	/*비밀번호 입력체크 */
	$("#ibxLoginPwd").on("keyup", function(e){
		if(fn_validateInputVal("loginPwd", $(this).val())){
			if(e.keyCode == 13){$("#btnLogin").click();}
		}
		return;
	});


	// 페이스북 로그인
	$('.login-facebook').on('click', function(e) {
		e.preventDefault();

		var type = $(this).data('type');

		FB.login(function(response){
			if(response.authResponse.userID) {
				$.ajaxMegaBox({
					url: '/on/oh/ohg/MbLogin/selectMbSimpleLogin.rest',
					data: JSON.stringify({ simpleLoginId: response.authResponse.userID, type: type }),
					success: function (data) {
						if(data.result) {
							AppHandler.Common.goMain();  // 메인페이지로 이동
						} else {
							AppHandler.Common.alert('본 서비스는 메가박스 회원인 경우에만  이용하실 수 있습니다.\n회원가입 후 이용 부탁 드립니다.');
						}
					}
				});
			}
		});
	});
});

function search_movie_by_name(){
	var mName = document.getElementById('headerMovieName').value;
	location.href='search?mName=' + mName;
}

//쿠키설정
function fn_setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays*24*60*60*1000));
	var expires = "expires="+d.toUTCString();
	document.cookie = cname + "=" + cvalue + "; " + expires + ";path=/";
}

//쿠키조회
function fn_getCookie(name) {
	var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	return value? value[2] : null;

}

//쿠키삭제
function fn_deleteCookie(name){
	var d = new Date();
	d.setTime(d.getDate() -1);
	var expires = "expires="+d.toUTCString();
	document.cookie = name + "=;" + expires + ";path=/";
}


//입력 문자 체크
function fn_validateInputVal(type,sVal,submitAt){
	if(type == "loginId") {		  //아이디

		if(sVal == ""){
			sValidateLoginIdAt = 'N';
		}
// 		if (!/((?=.{8,})(?=.*[0-9])(?=.*[a-zA-Z]).*$)/g.test(sVal)) {
// 			$('#error-text').text('아이디는 영문,숫자 조합 8자리 이상 12자리 이하 입니다.');
// 			sValidateLoginIdAt = 'N';
// 		}
// 		else if (/((?=.{8,})(?=.*[~!@#$%^&*+=-]).*$)/g.test(sVal)) {
// 			$('#error-text').text('아이디는 영문,숫자 조합 8자리 이상 12자리 이하 입니다.');
// 			sValidateLoginIdAt = 'N';
// 		}
		else{
			$('#error-text').text('');
			sValidateLoginIdAt = 'Y';
		}
	}
	else if(type == "loginPwd") { //패스워드
		if(sVal == ""){
			sValidateLoginPwdAt = 'N';
		}
// 		if (!/((?=.{10,})(?=.*[0-9])(?=.*[a-zA-Z]).*$)|((?=.{10,})(?=.*[~!@#$%^&*+=-])(?=.*[a-zA-Z]).*$)|((?=.{10,})(?=.*[!@#$%^&*+=-])(?=.*[0-9]).*$)/g.test(sVal)) {
// 			$('#error-text').text('비밀번호는 영문,숫자,특수기호 중 2가지 이상 조합하여 10자리 이상 16자리 이하 입니다.');
// 			sValidateLoginPwdAt = 'N';
// 		}
		else {
			$('#error-text').text('');
			sValidateLoginPwdAt = 'Y';
		}
	}

	if(submitAt != 'Y'){
		if(sValidateLoginIdAt == 'Y' && sValidateLoginPwdAt =='Y') {
			$("#btnLogin").attr("disabled", false);	//버튼활성화
		}
		else {
			$("#btnLogin").attr("disabled", true);	//버튼비활성화
		}
	}

	if(sValidateLoginIdAt == 'N' || sValidateLoginPwdAt =='N') {
		return false;
	}

	return true;
}





//홍현식 로그인
function fn_selectMbLogin(sLoginId, sLloginPwd, snsLoginAt, redisKey){

	if(submitIng) return;

	/* 폼데이터 초기화 */
	$('#loginForm input[name=certType]').val();								//본인인증 모듈 코드값 초기화
	var sMenuId = $('input[name=menuId]').val();							//호출화면id
	var sMappingId = $('input[name=mappingId]').val();						//리턴URL
	var sSnsLogin = typeof snsLoginAt == 'undefined' ? "N" : snsLoginAt;	//sns로그인 여부

	var validLoginId  = sLoginId != null ? sLoginId.replace(/ /gi,"") : "";
	var validLoginPwd = sLloginPwd != null ? sLloginPwd.replace(/ /gi,"") : "";

	if(validLoginPwd != "simpleLogin"){
		if(validLoginId == "" || validLoginPwd == ""){
			gfn_alertMsgBoxSize('로그인 정보를 입력해 주세요.',400,250);	//로그인 정보를 입력해 주세요.
			return;
		}
	}

	var paramData = { loginId:sLoginId
					, loginPwd:sLloginPwd
					, menuId:sMenuId
					, mappingId:sMappingId
					, snsLogin:sSnsLogin
					, redisKey:redisKey
					};
	
	$.ajaxMegaBox({
		url: "${path}/login/selectMbLoginInfo",
		data: JSON.stringify(paramData),
		//async: false,
		success: function (data, textStatus, jqXHR) {
			var revStr                 = data.revStr;
			//비밀번호 5회 오류	//본인인증 수단 선택 M-ME-DA-01
			if (revStr == "acctLock") {
				$('#loginForm input[name=redisKey]').attr('value',redisKey);
				$('#loginForm input[name=certType]').attr('value','SCRC05');
				var options = {};
				options.msg = '로그인정보가 5회 이상 잘못 입력되었습니다.\n회원인증 후 새로운 비밀번호를 설정해 주세요.';	//비밀번호 5회 이상 잘못 입력되었습니다.\n본인인증 후 새로운 비밀번호를 설정해 주세요.
				options.callback  = fn_mvPage;
				options.param = {confirm:'/on/oh/ohg/MbLogin/viewMbSimpleCertPage.rest'};	//간편인증페이지
				options.minWidth  = 400;
				options.minHeight = 250;
				gfn_alertMsgBox(options);
				return;
			}
			//비밀번호 변경9개월 초과 //비밀번호 재설정 M-ME-FI-04	비밀번호변경 9개월 체크 하지 않음. 무조건 3개월 연장
// 			else if (revStr == "loginPwdUpt9mm") {
// 				$('input[name=loginId]').attr('value',loginId);
// // 				mbLayer.toggle({id:revStr, msg:'회원님의 개인정보 보호를 위해 3개월마다 비밀번호 변경 안내해드리고 있습니다.\n마지막 변경일 : '+loginPwdLstUptDt+'('+pwdUptDayco+'일전)', btn:'비밀번호 변경', callback:fn_mvPage, param:'/pw-register', minHeight:200, type:'single' });
// 				var options      = {};
// 				options.msg      = '회원님의 개인정보 보호를 위해 3개월마다 비밀번호 변경 안내해드리고 있습니다.\n마지막 변경일 : '+loginPwdLstUptDt+'('+pwdUptDayco+'일전)';
// 				options.okBtnTxt = "비밀번호 변경";
// 				options.callback = fn_mvPage;
// 				options.param    = {confirm:'/pw-register'};
// 				options.minWidth  = 400;
// 				options.minHeight = 250;
// 				gfn_alertMsgBox(options);
// 				return;
// 			}
			//비밀번호 변경3개월 초과	//다음에하기, 비밀번호 재설정 M-ME-FI-04
			else if (revStr == "loginPwdUpt3mm") {
				$('#loginForm input[name=redisKey]').attr('value',redisKey);
				var options = {};
				options.msg        = '회원님의 개인정보 보호를 위해 3개월마다 비밀번호 변경안내를 시행하고 있습니다.\n안전한 서비스 이용을 위해 비밀번호 변경 후 이용바랍니다.\n지금 변경 하시겠습니까?\n\n마지막 변경일 : '+loginPwdLstUptDt+'('+pwdUptDayco+'일전)';
				options.confirmFn  = fn_mvPage;
				options.cancelFn   = fn_loginSuccessEvent;
				options.okBtnTxt     = "비밀번호 재설정";
			    options.cancelBtnTxt = "다음에 하기";
			    options.minWidth  = 400;
				options.minHeight = 300;
				options.param      = {confirm:"/pw-register" };
				gfn_confirmMsgBox(options);
				return;
// 				if(confirm('회원님의 개인정보 보호를 위해 3개월마다 비밀번호 변경안내를 시행하고 있습니다.\n안전한 서비스 이용을 위해 비밀번호 변경 후 이용바랍니다.\n지금 변경 하시겠습니까?\n\n마지막 변경일 : '+loginPwdLstUptDt+'('+pwdUptDayco+'일전)')){
// 					$('input[name=loginId]').attr('value',loginId);
// 					fn_mvPage('/pw-register');
// 					return;
// 				}
// 				else {
// 					fn_mvPage("/main");	//메인페이지로 이동
// 					return;
// 				}
			}
			//마케팅 수신일 2년 초과	//todo 다음에하기, 수신동의 설정 내정보 수정화면 개발후연결
			else if (revStr == "marketRcv") {
				var options        = {};
				options.msg        = '마케팅 수신 동의일로부터 2년이 경과되어, 수신에 대한 재동의 안내를 시행하고 있습니다. \n메가박스의 다양한 소식 및 이벤트를 받고 싶으시면 수신동의 재설정이 필요합니다.  \n수신동의 재설정을 진행 하시겠습니까?\n\n[수신동의 정보]\n'+marketRcvStr+'';
				//options.msg        = '마케팅 수신 동의일로부터 2년이 경과되어, 수신에 대한 재동의 안내를 시행하고 있습니다. \n메가박스의 다양한 소식 및 이벤트를 받고 싶으시면 수신동의 재설정이 필요합니다.  \n수신동의 재설정을 진행 하시겠습니까?\n\n[수신동의 정보]\n&#39;+lstSmsRcvAgreeDt+&#39;'.replaceAll('\n','<br/>');
				options.confirmFn  = fn_mvPage;
				options.cancelFn   = fn_loginSuccessEvent;
				options.okBtnTxt     = "수신동의 설정";
			    options.cancelBtnTxt = "다음에 하기";
				options.param      = {confirm:"/on/oh/ohh/Mypage/userAdditInfoPage.do?marketRcvReAgree=Y"};
				options.minWidth  = 400;
				options.minHeight = 300;
				gfn_confirmMsgBox(options);
				return;
			}
			//관리자에의한 패스워드 초기화 //비밀번호 재설정 M-ME-FI-04	관리자에 의한 패스워드 초기화는 없다.
// 			else if (revStr == "loginPwdReset") {
// // 				mbLayer.toggle({id:revStr, msg:'비밀번호 재설정이 완료되었습니다. 다시 로그인해 주시기 바랍니다.', btn:'확인', callback:fn_mvPage, param:'/pw-register', minHeight:200, type:'single' });
// 				var options = {};
// 				options.msg = '비밀번호 재설정이 완료되었습니다. 다시 로그인해 주시기 바랍니다.';
// 				options.callback  = fn_mvPage;
// 				options.param = {confirm:'/pw-register'};
// 				options.minWidth  = 400;
// 				options.minHeight = 250;
// 				gfn_alertMsgBox(options);
// 				return;
// 			}
			//휴면계정복구 안내	//TODO 다음에하기, 휴면계정복구 본인인증 수단 선택 M-ME-DA-01
			else if (revStr == "mbSchIdGuideDormAcct") {
				$('#loginForm input[name=certType]').attr('value','SCRC03');
				$('#loginForm input[name=redisKey]').attr('value',redisKey);
				var options = {};
				options.msg        = '회원님의 아이디는 ['+loginIdStar+'] 메가박스 온라인 서비스를 1년이상 이용하지 않아 휴면계정으로 전환되었습니다. 휴면계정 복구 후 서비스 이용이 가능합니다.\n휴면계정 복구를 진행하시겠습니까?';
				options.okBtnTxt = "휴면계정복구";
				options.callback = fn_mvPage;
				options.param    = {confirm:"/member-check"};
				options.minWidth  = 400;
				options.minHeight = 300;
				gfn_alertMsgBox(options);
				return;
			}
			//탈퇴회원안내
			else if (revStr == "quitMb") {
				gfn_alertMsgBoxSize('회원탈퇴 후 1개월 이내 재가입할 수 없습니다.\n메가박스 고객센터로 문의해 주세요',400,250);	//회원탈퇴 후 1개월 이내 재가입할 수 없습니다. 메가박스 고객센터로 문의해 주세요
				return;
			}
			//loginPwdFail 패스워드실패안내, mbJoinReq 회원가입안내, mbInfoSearchUnable 탈퇴회원안내
			else if (revStr == "loginPwdFail" || revStr == "mbJoinReq" || revStr == "mbInfoSearchUnable") {
// 				$('.alert').text('로그인 정보가 잘못되었습니다. (로그인 '+pwdErrCnt+'/5회 실패)');	2020-02-06 메가박스 차세대 이행/안정화 결함대장 28번
				$("#ibxLoginId").val("");
				$("#ibxLoginPwd").val("");
				alert('아이디 또는 비밀번호가 맞지 않습니다.\n로그인 정보를 다시 확인바랍니다.',400,250);	//msg.ch.ohg.ME031=아이디 또는 비밀번호가 맞지 않습니다.\\n로그인 정보를 다시 확인바랍니다.
				$("#btnLogin").attr("disabled", true);	//버튼비활성화
				sValidateLoginPwdAt ='N';
				return;
			}
			else if(revStr == "loginSuccess"){
				alert('로그인되었습니다');
				location.href="${path}/main";
			}

		    if(typeof loginPopupCallScn === "undefined"){
		    	loginPopupCallScn = "";
		    }
// 		    console.log("this : "+loginPopupCallScn);
			//화면이동

			else {


			}
			return;
		},
		error: function(xhr,status,error){
			 var err = JSON.parse(xhr.responseText);
			 alert(xhr.status);
			 alert(err.message);
		},
		beforeSend: function() {
			submitIng = true;
		},
		complete: function() {
			submitIng = false;
		}
	});
	
	
	
	
	
}
/* 비회원 */
var sValidateNonMbNmAt               = "N";
var sValidateNonMbByymmddAt          = "N";
var sValidateNonMbTelnoAt            = "N";

var sValidateMblpCharCertNo          = "N";

var sValidateNonMbPwdAt              = "N";
var sValidateNonMbPwdConfirmAt       = "N";
var sValidateNonMbPwdEqualAt         = "N";
var sValidateNonMbBokdPersonInfoProc = "N";
var sValidateMblpCertNoSuccess      = "N";

var AuthTimer;
var bokdCnfmAt                       = "N";

//이벤트
$(function(){
	if(typeof $("#ibxNonMbPwdConfirm").val() == 'undefined'){
		bokdCnfmAt = "Y";
	}
	fn_validateNonMbInputVal();
	/*비회원 로그인 버튼 비활성화*/
	$("#btnMbLogin").attr("disabled", true);

	/*비회원 정보 확인 버튼 비활성화*/
	$("#btnChkNonMbLogin").attr("disabled", true);
	$("#btnNonMbLogin").attr("disabled", true);

	/* 이름 숫자를 제외한 입력 여부판단 */
	$("#ibxNonMbNm").on("keyup", function(e){
		var partton = /[^ㄱ-힣a-zA-Z]/g;
		if(partton.test($(this).val())) {
			var value = $(this).val().replace(/[^ㄱ-힣a-zA-Z]/g,"");
			$(this).val(value);
		}
		if(fn_validateNonMbInputVal()){
			if(e.keyCode == 13) {$("#btnChkNonMbLogin").click();}
		} else {
			if(e.keyCode == 13) {$("#ibxNonMbByymmdd").focus()};
		}
	});
	$("#ibxNonMbNm").focusout(function(){
		var partton = /[^ㄱ-힣a-zA-Z]/g;
		if(partton.test($(this).val())) {
			var value = $(this).val().replace(/[^ㄱ-힣a-zA-Z]/g,"");
			$(this).val(value);
		}
		fn_validateNonMbInputVal();
	});

	/* 생년월일 숫자만 입력 여부판단 */
	$("#ibxNonMbByymmdd").on("keyup", function(e){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		if(fn_validateNonMbInputVal()){
			if(e.keyCode == 13) {$("#btnChkNonMbLogin").click();}
		} else {
			if(e.keyCode == 13) {$("#ibxNonMbTelno").focus();}
		}
	});
	$("#ibxNonMbByymmdd").focusout(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		fn_validateNonMbInputVal();
	});

	/* 휴대폰번호 숫자만 입력 여부판단 */
	$("#ibxNonMbTelno").on("keyup", function(e){
		$(this).val($(this).val().replace(/[^0-9]/g,""));

		//휴대폰 번호
		if($("#ibxNonMbTelno").val() != "") {
			var frontNm = $("#ibxNonMbTelno").val().substr(0,2);
			if(frontNm != '01'){
				$('#mblpInput-error-text').text('휴대폰번호를 정확히 입력해주세요.');
				ibxNonMbTelno = 'N';
				return false;
			}
			else if($("#ibxNonMbTelno").val().length < 10){
				$('#mblpInput-error-text').text('휴대폰번호를 정확히 입력해주세요.');
				sValidateNonMbTelnoAt = 'N';
				return false;
			}
			else {
				sValidateNonMbTelnoAt = 'Y';
				$('#mblpInput-error-text').text('');
			}
		}
		else {
			sValidateNonMbTelnoAt = 'N';
		}

		//console.log("sValidateNonMbTelnoAt", sValidateNonMbTelnoAt);
		//console.log("sValidateMblpCertNoSuccess", sValidateMblpCertNoSuccess);

		//인증번호 전송 버튼 활성화
		if( sValidateNonMbTelnoAt   == 'Y' && sValidateMblpCertNoSuccess == 'N') {
			$("#nonMbCertNoSend").attr("disabled", false);
			$("#nonMbCertNoSend").removeClass("disabled");
			if(window.fn_validateJoinInfoRegInputVal) {
				//sValidateMblpCertNoSuccess = "Y";
				fn_validateJoinInfoRegInputVal();
			}
		}
		else{
			$("#nonMbCertNoSend").attr("disabled", true);
			$("#nonMbCertNoSend").addClass("disabled");
			if(window.fn_validateJoinInfoRegInputVal) {
				//sValidateMblpCertNoSuccess = "N";
				fn_validateJoinInfoRegInputVal();
			}
		}

		if(e.keyCode != 9){
			if(typeof AuthTimer != 'undefined'){
				AuthTimer.fnStop();
				$('#timer').html("3:00");
				$('#nonMbCertNoSend').html("인증요청");
				sValidateMblpCertNoSuccess = "N";
				$('#nonMbCertRow').show();
				$('#mblpCharCertNo').val("");
				$("#nonMbCertNoSend").removeClass("disabled");
				$("#nonMbCertNoSend").attr("disabled", false);
				$("#btnMblpCharCert").attr("disabled", true);
				$("#btnMblpCharCert").addClass("disabled");
				if(fn_validateNonMbInputVal()){
					if(e.keyCode == 13) {$("#btnChkNonMbLogin").click();}
				} else {
					if(e.keyCode == 13) {$("#nonMbCertNoSend").click();}
				}
			}
			else {
				if(fn_validateNonMbInputVal()){
					if(e.keyCode == 13) {$("#btnChkNonMbLogin").click();}
				} else {
					if(e.keyCode == 13) {$("#ibxNonMbPwd").focus();}
				}
			}
		}
	});
	$("#ibxNonMbTelno").focusout(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		fn_validateNonMbInputVal();
	});

	/* 인증번호 숫자만 입력 여부 판단*/
	$("#mblpCharCertNo").on("keyup", function(e){
		$(this).val($(this).val().replace(/[^0-9]/g,""));

		if($("#mblpCharCertNo").val().length >= 4) {
			$("#btnMblpCharCert").removeClass("disabled");
			$("#btnMblpCharCert").attr("disabled", false);
		}
		else {
			$("#btnMblpCharCert").attr("disabled", true);
			$("#btnMblpCharCert").addClass("disabled");
		}

		if(e.keyCode == 13) {$("#btnMblpCharCert").click();}
	});
	$("#mblpCharCertNo").focusout(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		if($("#mblpCharCertNo").val().length >= 4) {
			$("#btnMblpCharCert").removeClass("disabled");
			$("#btnMblpCharCert").attr("disabled", false);
		}
		else {
			$("#btnMblpCharCert").attr("disabled", true);
			$("#btnMblpCharCert").addClass("disabled");
		}
	});

	/* 비밀번호 숫자만 입력 여부판단 */
	$("#ibxNonMbPwd").on("keyup", function(e){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		if(fn_validateNonMbInputVal()){
			if(e.keyCode == 13) {$("#btnChkNonMbLogin").click();}
		} else {
			if(e.keyCode == 13) {$("#ibxNonMbPwdConfirm").focus();}
		}
	});
	$("#ibxNonMbPwd").focusout(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		fn_validateNonMbInputVal();
	});

	/* 비밀번호 확인 숫자만 입력 여부판단 */
	$("#ibxNonMbPwdConfirm").on("keyup", function(e){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		if(fn_validateNonMbInputVal()) {
			if(e.keyCode == 13) {$("#btnChkNonMbLogin").click();}
		}
	});
	$("#ibxNonMbPwdConfirm").focusout(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
		fn_validateNonMbInputVal();
	});

	//체크박스 변경여부
	$("#chkNonMbBokdPersonInfoProcTrue").change(function() {
		if($('#chkNonMbBokdPersonInfoProcTrue').is(":checked")) {
			fn_validateNonMbInputVal();
		}
		else {
			fn_validateNonMbInputVal();
		}
	});

	$("#chkNonMbBokdPersonInfoProcFalse").change(function() {
		if($('#chkNonMbBokdPersonInfoProcFalse').is(":checked")) {
			fn_validateNonMbInputVal();
		}
		else {
			fn_validateNonMbInputVal();
		}
	});

	/*이벤트*/
	/* 인증번호 전송 버튼 클릭*/
	$("#nonMbCertNoSend").click(function(){
		if($("#nonMbCertNoSend").hasClass("disabled")){
			return;
		}

		var sRedisKey     = $('#loginForm input[name=nonMbCertRedisKey]').val();
		var sNonMbTelno   = $('#ibxNonMbTelno').val();
		var paramData = { redisKey : sRedisKey
						, nonMbTelno : sNonMbTelno
						};

		$('#nonMbCert-error-text').text('');

		$.ajaxMegaBox({
			url: "/on/oh/ohg/MbLogin/selectNonMbCertNoSend.rest",
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(paramData),
			success: function (data, textStatus, jqXHR) {
				$('input[name=nonMbCertRedisKey]').attr('value',data.resultMap.redisKey);

				if(data.resultMap.successAt == "N"){
					//비회원로그인-예매
					var bokdLoginAt = $('#loginForm input[name=bokdLoginAt]').val();
    				if(bokdLoginAt == "Y"){
    					//예매로그인일경우
    					//인증시간이 만료된 경우
    					if(data.resultMap.msg == "ME061"){
    						gfn_alertMsgBoxSize('인증시간이 만료되었습니다. 인증번호를 재전송 후 입력바랍니다.', 400, 250);	//인증시간이 만료되었습니다. 인증번호를 재전송 후 입력바랍니다.
    					}
    					//동일번호로 3회 이상 요청하는경우
    					else if(data.resultMap.msg == "ME062"){
    						//오입력값을 체크한다.
        					$('.before').hide();
            				$('.after').show();
            				$('#btnNonMbModalClose').trigger("click");
        					$('#layer_login_select button.btn-modal-close').trigger("click");
    						gfn_alertMsgBoxSize('동일번호로 연속적인 인증이 발생하여 창을 닫습니다.\n3분후 다시 시도해 주세요.', 400, 250);	//동일번호로 연속적인 인증이 발생하여 창을 닫습니다.\\n번호를 확인 한 후 처음부터 다시 진행바랍니다.
    					}

    				}
    				else {
    					//회원가입
    					var options = {};
						options.msg = '동일번호로 연속적인 인증이 발생하여 창을 닫습니다.\n3분후 다시 시도해 주세요.';	//동일번호로 연속적인 인증이 발생하여 창을 닫습니다.\\n처음부터 다시 이용바랍니다.
						options.callback  = fn_mvMainPage;
						options.minWidth  = 400;
						options.minHeight = 250;
						gfn_alertMsgBox(options);
    				}
					return;
				}
				else {
					//nonMbCertRedisKey
					//console.log("certNo", data.resultMap.certNo);
					$('#nonMbCertNoSend').html("재전송");
					$('#loginForm input[name=nonMbCertedMblpNo]').attr('value',sNonMbTelno);
					gfn_alertMsgBoxSize('인증번호를 전송했습니다.\n인증번호가 도착하지 않았을 경우 재전송을 눌러 주세요.', 400, 250);

					if(typeof AuthTimer != 'undefined'){
						AuthTimer.fnStop();
						$('#timer').html("3:00");
					}
					else {
						AuthTimer = new $ComTimer();
					}
					AuthTimer.comSecond = 180;
					AuthTimer.fnCallback = function(){alert("다시인증을 시도해주세요.")}
					AuthTimer.timer = setInterval(function(){AuthTimer.fnTimer()},1000);
					AuthTimer.domId = document.getElementById("timer");
					//입력하신 휴대폰 번호로 인증번호가 발송되었습니다. 확인 후 인증번호를 입력해주세요!
				}
			},
			error: function(xhr,status,error){
				var err = JSON.parse(xhr.responseText);
				alert(xhr.status);
				alert(err.message);
			}
		});
	});


	//인증번호 확인 버튼 클릭
	$("#btnMblpCharCert").click(function(){
		if($("#btnMblpCharCert").hasClass("disabled")){
			return;
		}

		var sRedisKey     = $('#loginForm input[name=nonMbCertRedisKey]').val();
		var sMblpCharCertNo = $('#mblpCharCertNo').val();
		var sNonMbTelno     = $('#ibxNonMbTelno').val();
		var paramData = { redisKey : sRedisKey
						, certNo : sMblpCharCertNo
						, nonMbTelno : sNonMbTelno
						};

		$.ajaxMegaBox({
			url: "/on/oh/ohg/MbLogin/selectNonMbCertNoCnfn.rest",
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(paramData),
			success: function (data, textStatus, jqXHR) {
				var successAt = data.resultMap.successAt;
				var msg = data.resultMap.msg;
				var redisKey = data.resultMap.redisKey;

				if(successAt == "Y"){
					sValidateMblpCertNoSuccess = "Y";
					fn_validateNonMbInputVal();
					$('#loginForm input[name=nonMbCertRedisKey]').attr('value',data.resultMap.redisKey);
					$('#nonMbCert-error-text').text('');
					$("#nonMbCertNoSend").attr("disabled", true);
					$("#nonMbCertNoSend").addClass("disabled");
					$("#nonMbCertRow").hide();
					gfn_alertMsgBoxSize('휴대폰 인증을 완료했습니다.\n확인 버튼을 눌러주세요.', 400, 250);	//휴대폰 인증을 완료했습니다.
					if(typeof fn_validateJoinInfoRegInputVal != "undefined"){
						fn_validateJoinInfoRegInputVal()	//회원가입에서 검증함수 호출
					}
				}
				else {
					sValidateMblpCertNoSuccess = "N";
					if(msg == "ME019"){
						$('#nonMbCert-error-text').text('인증번호가 일치하지 않습니다.\n인증번호를 다시 입력해주세요.');	//msg.ch.ohg.ME019 인증번호를 다시 확인 후 입력해 주세요.
					}
					else if(msg == "ME040"){
						$('#nonMbCert-error-text').text('인증시간이 만료되었습니다. 인증번호를 재전송 후 입력바랍니다.');	//msg.ch.ohg.ME040	유효시간이 지났습니다.  인증번호 재전송을 통해서 다시 인증해주세요.
					}
					else if(msg == "ME061"){
						$('#nonMbCert-error-text').text('인증시간이 만료되었습니다. 인증번호를 재전송 후 입력바랍니다.');	//msg.ch.ohg.ME061	유효시간이 지났습니다.  인증번호 재전송을 통해서 다시 인증해주세요.
						gfn_alertMsgBoxSize('인증시간이 만료되었습니다. 인증번호를 재전송 후 입력바랍니다.',400,250);	//입력정보를 확인해주세요.
					}

					$("#nonMbCertNoSend").removeClass("disabled");
					$("#nonMbCertNoSend").attr("disabled", false);
					$("#nonMbCertRow").show();
				}
			},
			error: function(xhr,status,error){
				var err = JSON.parse(xhr.responseText);
				alert(xhr.status);
				alert(err.message);
			}
		});
	});

	// 비회원 정보 확인 팝업 요청
	$("#btnChkNonMbLogin").click(function(){

		if(submitIng) return;

		if(typeof $("#ibxNonMbPwdConfirm").val() != 'undefined'){
			if($("#ibxNonMbPwd").val() != $("#ibxNonMbPwdConfirm").val()) {
				gfn_alertMsgBoxSize('입력정보를 확인해주세요.',400,250);	//입력정보를 확인해주세요.
				return;
			}
		}

		//생년월일 날짜형태 확인
// 		if(!fn_validateDateYn($("#ibxNonMbByymmdd").val())) {
// 			alert("생년월일 입력이 잘못 되었습니다.");
// 			$("#ibxNonMbByymmdd").focus();
// 			return;
// 		}
		$("#btnNonMbLogin").attr("disabled", false);
		fn_chkNonMbLogin();
	});

	// 비회원 로그인
	$("#btnNonMbLogin").click(function(){

		var paramData = { nonMbNm:$("#ibxNonMbNm").val()
						, nonMbByymmdd:$("#ibxNonMbByymmdd").val()
						, nonMbTelno:$("#ibxNonMbTelno").val()
						, nonMbPwd:$("#ibxNonMbPwd").val()
						, bokdCnfmAt:bokdCnfmAt
						};

		$.ajaxMegaBox({
			url: "/on/oh/ohg/NonMbLogin/selectNonMbLoginInfo.rest",
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(paramData),
			success: function (data, textStatus, jqXHR) {

				var menuId                 = data.menuId;
	            var mappingId              = data.mappingId;
	            var statCd                 = data.result.statCd;


	            if(typeof loginPopupCallScn === "undefined"){
			    	loginPopupCallScn = "";
			    }
	            //화면이동
	            if(menuId != "" && menuId != null){    //화면으로 띄웠을떄
	                fn_mvPage(mappingId);
	                return;
	            }
	            else {
	                if(loginPopupCallScn != "" && loginPopupCallScn != null){  //팝업으로 띄었을때 파라메타는 팝업 호출화면에 전역으로 정의
	                    $(".btn-layer-close").trigger("click");
	                    if(loginPopupCallScn == "SimpleBokdM"){
	                    	$('.before').hide();
	            			$('.after').show();
	                        alert("콜백함수호출");
	                    } else if(loginPopupCallScn == "StoreDtlV"){
	                    	$('.before').hide();
	            			$('.after').show();
	                    } else if(loginPopupCallScn == "MySbscDtlsL"){
	                    	$('.before').hide();
	            			$('.after').show();
	            			location.href = '/on/oh/ohh/MySbscDtls/mySbscDtlsListPage.do?currPage=1&searchText=';
	                    }
	                }
	                else {
	                	var bokdLoginAt = $('#loginForm input[name=bokdLoginAt]').val();
	    				if(bokdLoginAt == "Y"){
	    					//예매로그인일경우
	    					//오입력값을 체크한다.
	    					$('.before').hide();
	        				$('.after').show();
	        				$('#btnNonMbModalClose').trigger("click");
	    					$('#layer_login_select button.btn-modal-close').trigger("click");
	    					fn_validDataRevisn(JSON.parse($('#loginForm input[name=bokdLoginParam]').val()));
	    					return;
	    				}

	                	if(bokdCnfmAt == "Y"){
	                		$('#nonMbBokdCnfmForm input[name=nonMbNm]').attr('value',$('#ibxNonMbNm').val());
	                		$('#nonMbBokdCnfmForm input[name=nonMbTelno]').attr('value',$('#ibxNonMbTelno').val());
	                		$('#nonMbBokdCnfmForm input[name=nonMbPwd]').attr('value',$('#ibxNonMbPwd').val());
	                		$('#nonMbBokdCnfmForm input[name=nonMbByymmdd]').attr('value',$('#ibxNonMbByymmdd').val());

                            /////////////////////////////////////////////////////////////////////
	                		// 예매정보가 없을 시 메세지 팝업처리 /////////////////////////////////
                            /////////////////////////////////////////////////////////////////////
                            if(statCd == 0) {
                                fn_mvNonMbBokdCnfm("/non-member"); //비회원 예매 확인일때
                            }else{
                                alert("입력하신 정보와 일치하는 예매내역이 없습니다.");
                            }
                            /////////////////////////////////////////////////////////////////////
                            /////////////////////////////////////////////////////////////////////

	                		//fn_mvNonMbBokdCnfm("/non-member"); //비회원 예매 확인일때
	                	}
	                	else {
	                		location.reload();
	                	}

	                }
	            }
	            return;
			},
			error: function(xhr,status,error){
				 var err = JSON.parse(xhr.responseText);
				 alert(xhr.status);
				 alert(err.message);
			},
			beforeSend: function() {
	            submitIng = true;
	        },
	        complete: function() {
	            submitIng = false;
	        }
	    });

	    //페이지 이동 submit
	    function fn_mvNonMbBokdCnfm(page){
// 	        console.log("fn_mvNonMbBokdCnfm : "+page);
	        $("#nonMbBokdCnfmForm").attr("method","post");
	        $("#nonMbBokdCnfmForm").attr("action",page);
	        $("#nonMbBokdCnfmForm").submit();
	    }

	  	//비회원 예매 확인 페이지 이동 submit
	    function fn_mvPage(page){
// 	        console.log("MbLoginScriptDV.fn_mvPage : "+page);
	        $("#loginForm").attr("method","post");
	        $("#loginForm").attr("action",page);
	        $("#loginForm").submit();
	    }
	});
});

var callback = undefined;
//입력 문자 체크
function fn_validateNonMbInputVal(){
	//이름
	if($("#ibxNonMbNm").val() != "") {
		sValidateNonMbNmAt = 'Y';
	}
	else {
		sValidateNonMbNmAt = 'N';
	}

	//생년월일
	if($("#ibxNonMbByymmdd").val() != "") {
		if(fn_validateDateYn($("#ibxNonMbByymmdd").val(),6)){
			sValidateNonMbByymmddAt = 'Y';
			//비회원예매확인
			if(bokdCnfmAt == "Y"){
				$('#ErrTextNonMbByymmdd').text('');
			}
			//비회원로그인
			else {
				$('#mblpInput-error-text').text('');
			}
		}
		else {
			sValidateNonMbByymmddAt = 'N';
			//비회원예매확인
			if(bokdCnfmAt == "Y"){
				$('#ErrTextNonMbByymmdd').text('생년월일을 정확히 입력해주세요.');
			}
			//비회원로그인
			else {
				$('#mblpInput-error-text').text('생년월일을 정확히 입력해주세요.');
			}
			return false;
		}
	}
	else {
		sValidateNonMbByymmddAt = 'N';
		$('#mblpInput-error-text').text('');
	}

	//휴대폰 번호
	if($("#ibxNonMbTelno").val() != "") {
		var frontNm = $("#ibxNonMbTelno").val().substr(0,2);
		if(frontNm != '01'){
			$('#mblpInput-error-text').text('휴대폰번호를 정확히 입력해주세요.');
			ibxNonMbTelno = 'N';
			return false;
		}
		else if($("#ibxNonMbTelno").val().length < 10){
			$('#mblpInput-error-text').text('휴대폰번호를 정확히 입력해주세요.');
			sValidateNonMbTelnoAt = 'N';
			return false;
		}
		else {
			sValidateNonMbTelnoAt = 'Y';
			$('#mblpInput-error-text').text('');
		}
	}
	else {
		sValidateNonMbTelnoAt = 'N';
	}


	if($("#ibxNonMbPwd").val().length == 4) {
		sValidateNonMbPwdAt = 'Y';
	}
	else {
		sValidateNonMbPwdAt = 'N';
	}
	if(bokdCnfmAt == "Y"){
		sValidateNonMbPwdConfirmAt       = 'Y';
		sValidateNonMbPwdEqualAt         = 'Y';
		sValidateNonMbBokdPersonInfoProc = 'Y';
		sValidateMblpCertNoSuccess       = 'Y';
	}
	else{
		if($("#ibxNonMbPwdConfirm").val().length == 4) {
			sValidateNonMbPwdConfirmAt = 'Y';
		}
		else {
			sValidateNonMbPwdConfirmAt = 'N';
		}

		if($("#ibxNonMbPwd").val().length > 0 && $("#ibxNonMbPwdConfirm").val().length > 0 && $("#ibxNonMbPwd").val() == $("#ibxNonMbPwdConfirm").val()) {
			sValidateNonMbPwdEqualAt = 'Y';
			$('#nonMbPwdErrText').text('');
		}
		else if($("#ibxNonMbPwd").val().length > 0 && $("#ibxNonMbPwdConfirm").val().length > 0 && $("#ibxNonMbPwd").val() != $("#ibxNonMbPwdConfirm").val()){
			sValidateNonMbPwdEqualAt = 'N';
			$('#nonMbPwdErrText').text('비밀번호와 비밀번호 확인의 입력값이 일치하지 않습니다.');
			return false;
		}

		if($('#chkNonMbBokdPersonInfoProcTrue').prop("checked")){
			sValidateNonMbBokdPersonInfoProc = 'Y';
		}
		else {
			sValidateNonMbBokdPersonInfoProc = 'N';
		}

		if($('#chkNonMbBokdPersonInfoProcFalse').prop("checked")){
			sValidateNonMbBokdPersonInfoProc = 'N';
		}
	}

// 	$('#error-text1').text
// 	("sValidateNonMbNmAt:"             +sValidateNonMbNmAt              +("/")+$("#ibxNonMbNm").val().length        +("\n\n")+
// 			"sValidateNonMbByymmddAt:"         +sValidateNonMbByymmddAt         +("/")+$("#ibxNonMbByymmdd").val().length   +("\n\n")+
// 			"sValidateNonMbTelnoAt:"           +sValidateNonMbTelnoAt           +("/")+$("#ibxNonMbTelno").val().length     +("\n\n")+
// 			"sValidateNonMbPwdAt:"             +sValidateNonMbPwdAt             +("/")+$("#ibxNonMbPwd").val().length       +("\n\n")+
// 			"sValidateNonMbPwdConfirmAt:"      +sValidateNonMbPwdConfirmAt      +("/")+$("#ibxNonMbPwdConfirm").val().length+("\n\n")+
// 			"sValidateNonMbPwdEqualAt:"        +sValidateNonMbPwdEqualAt        +("/\n\n")+
// 			"sValidateNonMbBokdPersonInfoProc:"+sValidateNonMbBokdPersonInfoProc+("/\n\n")
// 		+$("input:checkbox[id='chkNonMbBokdPersonInfoProc']").is(":checked"));

	if(    bokdCnfmAt                       == "N"
		&& sValidateNonMbNmAt               == 'Y'
		&& sValidateNonMbByymmddAt          == 'Y'
		&& sValidateNonMbTelnoAt            == 'Y'
		&& sValidateNonMbPwdAt              == 'Y'
		&& sValidateNonMbPwdConfirmAt       == 'Y'
		&& sValidateNonMbBokdPersonInfoProc == 'Y'
 		&& sValidateNonMbPwdEqualAt         == 'Y'
 		&& sValidateMblpCertNoSuccess       == 'Y'){
		$("#btnChkNonMbLogin").attr("disabled", false);
		return true;
	}
	else if (bokdCnfmAt == "Y"
			&& sValidateNonMbNmAt       == 'Y'
			&& sValidateNonMbByymmddAt         == 'Y'
			&& sValidateNonMbTelnoAt == 'Y'
			&& sValidateNonMbPwdAt       == 'Y'){
		$("#btnNonMbLogin").attr("disabled", false);
		return true;
	}
	else{
		$("#btnChkNonMbLogin").attr("disabled", true);
		$("#btnNonMbLogin").attr("disabled", true);
		return false;
	}
}

/*날짜 형태 확인*/
function fn_validateDateYn(param, length) {
	try
	{
		var year  = 0;
		var month = 0;
		var day   = 0;

		param = param.replace(/-/g,'');

		// 자리수가 맞지않을때
		if( isNaN(param) || param.length < Number(length) || param.length > Number(length)) {
			return false;
		}

		if( param.length == 6){
			year  = Number(param.substring(0, 2));
			month = Number(param.substring(2, 4));
			day   = Number(param.substring(4, 6));
		}
		else if(param.length == 8){
			year  = Number(param.substring(0, 4));
			month = Number(param.substring(4, 6));
			day   = Number(param.substring(6, 8));

			var sysYear = Number(new Date().getFullYear());
			//년도입력이 현재 년도보다 클때.
			if(sysYear < year){
				return false;
			}
		}
		else {
			return false;
		}


		var dd = day / 0;


		if( month<1 || month>12 ) {
			return false;
		}

		var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		var maxDay = maxDaysInMonth[month-1];

		// 윤년 체크
		if( month==2 && ( year%4==0 && year%100!=0 || year%400==0 ) ) {
			maxDay = 29;
		}

		if( day<=0 || day>maxDay ) {
			return false;
		}
		return true;

	} catch (err) {
		return false;
	}
}


var simpleLoginWithPopup;
var simpleLoginWith = function(lnkgTy){
    var url = "https://kauth.kakao.com/oauth/authorize?client_id=fc1c6f725158262e3d3008e9eda48e0c&redirect_uri=http://localhost:8085${path}/login/kakaoLogin&response_type=code";
    if ( simpleLoginWithPopup ) {
        simpleLoginWithPopup.close();
    }
    if(lnkgTy != "FACEBOOK"){
		simpleLoginWithPopup = window.open(url, 'simpleLoginWithPopup', 'width=420, height=550');
	}
	else {
		simpleLoginWithPopup = window.open(url, 'simpleLoginWithPopup', 'width=650, height=600, scrollbars=yes');
	}
}

var fn_LoginPopUpCall = function(paramData){
    if ( lnkgInfoObj.attr("connTy") != undefined ) {
        fn_ConnWithCallBack(paramData);
    } else {
        fn_LoginWithCallBack(paramData);
    }

}
var fn_LoginPopUpCallError = function(msg){
    gfn_alertMsgBoxSize(msg, 400, 250);
}

//비회원 확인 팝업
function fn_chkNonMbLogin() {

	var $td = $(document).find('#layer_no_member_chk td');

	var telTmp = $('#ibxNonMbTelno').val();

	switch(telTmp.length){
	case 10 : telTmp = telTmp.format('XXX-XXX-XXXX'); break;
	case 11 : telTmp = telTmp.format('XXX-XXXX-XXXX');break;
	}

	$td.eq(0).html($('#ibxNonMbNm').val());
	$td.eq(1).html($('#ibxNonMbByymmdd').val());
	$td.eq(2).html(telTmp);

	// 레이어 호출
	$(document).find('#aNonMbLogin').click();
}
</script>
		<script type="text/javascript">
var fn_LoginWithCallBack = function(paramData){
    $.ajaxMegaBox({
        url: "/on/oc/ocz/SimpleLogin/selectSimpleLogin.do",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        data: JSON.stringify(paramData),
        success: function (data, textStatus, jqXHR) {
            if ( data.userMap == null ) {
            	//var simpleLoginTyCd = data.userMap.simpleLoginTyCd;
                gfn_alertMsgBoxSize('['+paramData.simpleLoginTyCd+'] 계정으로 연동된 메가박스 계정이 없습니다.\n연동을 원하시면 나의메가박스 > 개인정보수정에서\n간편로그인 계정연동을 진행해 주세요.', 400, 250);
            } else {
                var loginId = data.userMap.loginId;
                var mbNo    = data.userMap.mbNo;
                fn_selectMbLogin(loginId, "simpleLogin", "Y", paramData.redisKey);
            }
        },
        error: function(xhr,status,error){
            var err = JSON.parse(xhr.responseText);
            alert(xhr.status);
            alert(err.message);
        }
    });
}
var lnkgInfoObj;
$(function(){
    $("div.sns-login > a").off("click").on("click",function(){
        lnkgInfoObj = $(this);
        simpleLoginWith($(this).attr("lnkgTy"));
    });
});
</script>
		<form id="loginForm">
			<input type='hidden' name='redisKey' value='' /> <input
				type='hidden' name='menuId' value='' /> <input type='hidden'
				name='mappingId' value='' /> <input type='hidden' name='rtnParam'
				value='' /> <input type='hidden' name='certType' value='' /> <input
				type='hidden' name='preUrl' value='' />

			<!-- 좌석도 로그인 프로세스 여부PARAM-->
			<input type='hidden' name='bokdLoginAt' value='' /> <input
				type='hidden' name='bokdLoginParam' value='' /> <input
				type='hidden' name='nonMbCertRedisKey' value='' /> <input
				type='hidden' name='nonMbCertedMblpNo' value='' /> <input
				type='hidden' name='reloadYn' value='' /> <input type='hidden'
				name='validDataRevisnYn' value='N' />

		</form>








		<!-- 로그인 레이어팝업 시작 -->
		<!-- 화면ID  M-ME-LO-01 -->
		<!-- 화면ID  M-ME-CC-01 -->
		<div style="display: none;">
			<a id="loginPupupATag" href="#layer_login_select"
				class="button active btn-modal-open" w-data="850" h-data="484"></a>
		</div>

		<section id="layer_login_select" class="modal-layer shadow"
			style="z-index: 501;">
			<a href="#" class="focus" title="레이어로 포커스 이동 됨">레이어로 포커스 이동 됨<!--레이어로 포커스 이동 됨--></a>
			<div class="wrap"
				style="width: 850px; height: 556px; margin-left: -425px; margin-top: -278px;">
				<header class="layer-header">
					<h3 class="tit">로그인</h3>
				</header>

				<div class="layer-con" style="height: 511px;">

					<div class="tab-list tab-layer">
						<ul>
							<li class="on"><a href="#login_tab_01" title="회원 로그인 선택">회원
									로그인<!--회원 로그인-->
							</a></li>
							<li><a href="#login_tab_02" title="비회원 로그인 선택">비회원 로그인<!--비회원 로그인--></a></li>
						</ul>
					</div>

					<!-- tab-cont-wrap -->
					<div class="tab-cont-wrap">
						<!-- tab 회원 로그인 -->
						<div id="login_tab_01" class="tab-cont on">
							<a href="" class="ir" title="로그인"></a>

							<div class="login-member col-2">
								<!-- col-wrap -->
								<div class="col-wrap">
									<div class="col left">
										<div class="login-input-area">
											<input autocomplete="off" id="ibxLoginId" maxlength="20"
												type="text" placeholder="아이디" title="아이디를 입력하세요"
												class="input-text strTrim">
											<!--아이디-->
											<!--아이디를 입력하세요-->
											<input autocomplete="off" id="ibxLoginPwd" maxlength="20"
												type="password" placeholder="비밀번호" title="비밀번호를 입력하세요"
												class="input-text mt15">
											<!--비밀번호-->
											<!--비밀번호를 입력하세요-->
											<div class="alert"></div>

											<!-- chk-util -->
											<div class="chk-util">
												<div class="left">
													<input id="chkIdSave" type="checkbox"> <label
														for="chkIdSave">아이디 저장<!--아이디 저장--></label>
												</div>

												<div class="right">
													<div class="hp-ad">
														<a
															href="https://www.sepay.org/spm/join?regSiteCode=XF&ctgCode=1&subCode=1"
															title="휴대폰 간편 로그인 선택" target="_blank" title="새창 열림"><span>휴대폰
																간편로그인<!--휴대폰 간편로그인-->
														</span> <em>광고<!--광고--></em></a>
													</div>
												</div>
											</div>
											<!--// chk-util -->

											<button id="btnLogin" type="button"
												class="button purple large btn-login">
												로그인
												<!--로그인-->
											</button>

											<div class="link">
												<a href="/user-find" title="ID/PW 찾기 선택">ID/PW 찾기<!--ID/PW 찾기--></a>
												<a href="${path }/join" title="회원가입 선택">회원가입<!--회원가입--></a>
												<a href="/on/oh/ohg/MbLogin/viewNonMbLogin.rest"
													title="비회원 예매확인 선택">비회원 예매확인<!--비회원 예매확인--></a>
											</div>

											<div class="sns-login">
												<a href="javaScript:void(0)" lnkgTy="FACEBOOK"
													title="페이스북으로 로그인 선택"><img
													src="${path }/resources/images/icon/ico-facebook.png"
													alt="페이스북"> <!--페이스북--> 페이스북으로 로그인<!--페이스북으로 로그인--></a> <a
													href="javaScript:void(0)" lnkgTy="NAVER"
													title="네이버로 로그인 선택"><img
													src="${path }/resources/images/icon/ico-naver.png"
													alt="네이버"> <!--네이버--> 네이버로 로그인<!--네이버로 로그인--></a> <a
													href="javaScript:void(0)" lnkgTy="KAKAO"
													title="카카오톡으로 로그인 선택"><img
													src="${path }/resources/images/icon/ico-kakao.png"
													alt="카카오톡"> <!--카카오톡--> 카카오톡으로 로그인<!--카카오톡으로 로그인--></a> <a
													href="javaScript:void(0)" lnkgTy="PAYCO"
													title="페이코로 로그인 선택"><img
													src="${path }/resources/images/icon/ico-payco.png"
													alt="페이코"> <!--페이코--> 페이코로 로그인<!--페이코로 로그인--></a>
											</div>
										</div>
									</div>

									<div class="col right">
										<div class="login-ad" id="Rw6jtk0hQTuOBSzFbvGGlw"></div>
									</div>
								</div>
								<!--// col-wrap -->
							</div>
						</div>
						<!--// tab 회원 로그인 -->

						<!-- tab 비회원 로그인 -->
						<div id="login_tab_02" class="tab-cont">
							<a href="" class="ir" title="비회원 로그인"></a>

							<div class="login-member col-2">
								<!-- col-wrap -->
								<div class="col-wrap">
									<div class="col left">

										<div class="no-member-login-table">
											<table
												summary="이름, 생년월일, 휴대폰번호, 인증번호, 비밀번호, 비밀번호 확인 항목을 가진 비회원 로그인 입력 표">
												<caption>
													이름, 생년월일, 휴대폰번호, 인증번호, 비밀번호, 비밀번호 확인 항목을 가진 비회원 로그인 입력 표
													<!--이름, 생년월일, 휴대폰번호, 인증번호, 비밀번호, 비밀번호 확인 항목을 가진 비회원 로그인 입력 표-->
												</caption>
												<colgroup>
													<col style="width: 110px;">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><label for="ibxNonMbNm">이름<!--이름--></label>
														</th>
														<td><input maxlength="20" id="ibxNonMbNm" type="text"
															placeholder="이름" class="input-text"> <!--이름--></td>
													</tr>
													<tr>
														<th scope="row"><label for="ibxNonMbByymmdd">생년월일<!--생년월일--></label>
														</th>
														<td><input maxlength="6" id="ibxNonMbByymmdd"
															type="text" placeholder="생년월일 앞6자리" class="input-text">
															<!--주민번호 앞 6자리--></td>
													</tr>
													<tr>
														<th scope="row"><label for="ibxNonMbTelno">휴대폰번호<!--휴대폰번호--></label>
														</th>
														<td>
															<div class="hp-input">
																<input maxlength="11" id="ibxNonMbTelno" type="text"
																	placeholder="- 없이 입력" class="input-text">
																<!--- 없이 입력-->
																<button id="nonMbCertNoSend" type="button"
																	class="button gray" disabled="disabled">
																	인증요청
																	<!--인증요청-->
																</button>
															</div>
															<div id="mblpInput-error-text" class="alert"></div>
														</td>
													</tr>
													<tr id="nonMbCertRow">
														<th scope="row"><label for="mblpCharCertNo">인증번호<!--인증번호--></label>
														</th>
														<td>
															<div class="chk-num">
																<div class="line">
																	<input maxlength="4" id="mblpCharCertNo" type="text"
																		class="input-text">

																	<div class="time-limit" id="timer">3:00</div>
																</div>

																<button id="btnMblpCharCert" type="button"
																	class="button purple" disabled="disabled">
																	확인
																	<!--확인-->
																</button>
															</div>
															<div id="nonMbCert-error-text" class="alert"></div>
														</td>
													</tr>
													<tr>
														<th scope="row"><label for="ibxNonMbPwd">비밀번호</label>
															<!--비밀번호--></th>
														<td><input maxlength="4" id="ibxNonMbPwd"
															type="password" placeholder="비밀번호(숫자 4자리)"
															class="input-text"> <!--비밀번호(숫자 4자리)--></td>
													</tr>
													<tr>
														<th scope="row"><label for="ibxNonMbPwdConfirm">비밀번호<!--비밀번호-->확인<!--확인--></label>
														</th>
														<td><input maxlength="4" id="ibxNonMbPwdConfirm"
															type="password" placeholder="비밀번호(숫자 4자리) 확인"
															class="input-text"> <!--비밀번호(숫자 4자리) 확인-->
															<div id="nonMbPwdErrText" class="alert"></div></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<div class="col right">

										<div class="no-member-privacy-rule">
											<p class="tit">
												비회원예매 개인정보 처리방침
												<!--비회원예매 개인정보 처리방침-->
											</p>

											<div class="cont">
												<dl>
													<dt>수집목적</dt>
													<dd>비회원예매 서비스 제공 / 이용자식별 / 구매 및 결제</dd>
													<dt>수집항목</dt>
													<dd>이름, 생년월일, 휴대폰번호, 비밀번호</dd>
													<dt>보유기간</dt>
													<dd class='ismsimp'>관람 또는 취소 후 7일 이내</dd>
													<!--<dt>수집목적</dt><dd>비회원예매 서비스 제공 / 이용자식별 / 구매 및  결제</dd><dt>수집항목</dt><dd>이름, 생년월일, 휴대폰번호, 비밀번호</dd><dt>보유기간</dt><dd>관람 또는 취소 후 7일 이내</dd>-->
												</dl>

												<div class="btn-agree">
													<input type="radio" id="chkNonMbBokdPersonInfoProcTrue"
														name="chkNonMbBokdPersonInfoProc"> <label
														for="chkNonMbBokdPersonInfoProcTrue">동의<!--동의--></label> <input
														type="radio" id="chkNonMbBokdPersonInfoProcFalse"
														name="chkNonMbBokdPersonInfoProc" class="ml20"> <label
														for="chkNonMbBokdPersonInfoProcFalse">미동의<!--미동의--></label>
												</div>

												<ul class="dot-list gblue mt20">
													<li class="font-gblue">정보수집에 동의를 거부할 수 있으며, 동의하지 않을 경우
														비회원 예매서비스를 이용하실 수 없습니다.<!--정보수집에 동의를 거부할 수 있으며, 동의하지 않을 경우 비회원 예매서비스를 이용하실 수 없습니다.-->
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
								<!--// col-wrap -->

								<div class="btn-group">
									<button id="btnChkNonMbLogin" type="button"
										class="button purple">확인</button>
									<a id="aNonMbLogin" href="#layer_no_member_chk"
										class="button purple btn-modal-open" w-data='600' h-data='320'
										style="display: none;"></a>
								</div>
							</div>
						</div>
						<!--// tab 비회원 로그인 -->
					</div>
					<!--// tab-cont-wrap -->
				</div>

				<button type="button" class="btn-modal-close"
					onclick="login_modal_close()">
					레이어 닫기
					<!--레이어 닫기-->
				</button>
			</div>
		</section>

		<section id="layer_no_member_chk" class="modal-layer">
			<div class="wrap">
				<header class="layer-header">
					<h3 class="tit">알림</h3>
				</header>

				<div class="layer-con">
					<p>티켓 발권을 위한 입력정보를 확인해 주세요.</p>

					<div class="table-wrap v1">
						<table class="data-table"
							summary="이름, 생년월일, 휴대폰번호 항목을 가진 비회원 티켓 발권을 위한 입력정보 표">
							<caption>이름, 생년월일, 휴대폰번호 항목을 가진 비회원 티켓 발권을 위한 입력정보 표</caption>
							<colgroup>
								<col style="width: 80px;" />
								<col />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="a-l">이름</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row" class="a-l">생년월일</th>
									<td></td>
								</tr>
								<tr>
									<th scope="row" class="a-l">휴대폰번호</th>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="btn-group-fixed">
					<button type="button" class="button close-layer small">취소</button>
					<button id="btnNonMbLogin" type="button"
						class="button purple small">확인</button>
				</div>

				<button id="btnNonMbModalClose" type="button"
					class="btn-modal-close">레이어 닫기</button>
			</div>
		</section>


		<script type="text/javascript">
    $(function(){
         if(fn_loginAt()!="true"){
        	 $('#header .right-link .before').show();
      		  $('#header .right-link .after').hide();
         }else{
        	 $('#header .right-link .before').hide();
     		  $('#header .right-link .after').show();
              
         }
         
	     




    var sysCd = 'ON';
    });

</script>

		<!-- 베네피아 배너 접근 시 노출 -->


		<!-- 메인에만 광고영역 노출 -->

		<div class="header-add-area">
			<div class="cont">
				<script data-id="3Vx8ybGrT2Ka3I2TjnHTjQ"
					name="megabox_p/main/main@main_top_1100x80_1100x600?mlink=374"
					src="//cast.imp.joins.com/persona.js" async></script>
			</div>
			<button type="button" class="btn-del">광고영역 닫기</button>
		</div>

		<!-- 메인 영화에만 광고영역 노출 -->


		<!-- header -->
		<header id="header" class="main-header no-bg">
			<h1 class="ci">
				<a href="${path }/main" title="MEGABOX 메인으로 가기">MEGABOX : Life
					Theater</a>
			</h1>

			<!-- 브라우저 다운로드 -->


			<script type="text/javascript">
    $(function(){
	  	//닫기 버튼 클릭
		$('.ie-update').on('click', '.close-chk .closeDl', function() {
			 if ($(":checkbox[id='one_month_no_update']:checked").length > 0) {
				fn_setCookie("BROWDER_DL", "Y", 30);
			}

			$('.ie-update').hide();
		});

		//다시보지 않기
		 if (fn_getCookie("BROWDER_DL") == null || fn_getCookie("BROWDER_DL") == 'N') {
			if ( $(".lt-ie9").length > 0 && $('.ie-update').length > 0 ) {
				$('.ie-update').show();
			}
		}
    });
    </script>
			<!-- ie-update : ie 9 이하 일때만 출력 -->
			<div class="ie-update">
				<div class="dimd"></div>
				<div class="wrap">
					<p class="tit">
						<img src="${path }/resources/images/ie/txt-update.png"
							alt="megabox 홈페이지는 internet explrer10이상에서 최적화된 서비스 이용이 가능합니다. ie9 이하에서는 예매가 정상적으로 진행되지 않을 수 있으니, 브라우저를 업그레이드하시거나 다른 예매수단을 이용해 주세요!" />
					</p>

					<div class="box">
						<div class="col">
							<p class="txt">
								브라우저를 최신 버전으로<br>업그레이드 해보세요!
							</p>

							<div class="link">
								<a
									href="https://www.microsoft.com/ko-kr/download/internet-explorer.aspx"
									title="internet explorer 새 버전 다운로드" target="_blank"> <img
									src="${path }/resources/images/ie/btn-ie.png"
									alt="internet explorer 새 버전 다운로드" />
								</a>
							</div>

							<div class="link">
								<a href="http://www.google.com/chrome?hl=ko" title="chrome 다운로드"
									target="_blank"> <img
									src="${path }/resources/images/ie/btn-chrome.png"
									alt="chrome 다운로드">
								</a>
							</div>
						</div>

						<div class="col">
							<p class="txt">
								megabox 모바일 app을<br>이용해 보세요!
							</p>

							<div class="link">
								<a
									href="https://itunes.apple.com/us/app/megabox/id894443858?l=ko&amp;ls=1&amp;mt=8"
									title="available on the app store" target="_blank"> <img
									src="${path }/resources/images/ie/btn-appstore.png"
									alt="available on the app store">
								</a>
							</div>

							<div class="link">
								<a
									href="https://play.google.com/store/apps/details?id=com.megabox.mop&amp;hl=ko"
									title="available on the google play" target="_blank"> <img
									src="${path }/resources/images/ie/btn-google.png"
									alt="available on the google play">
								</a>
							</div>
						</div>
					</div>

					<div class="close-chk">
						<input type="checkbox" id="one_month_no_update" /> <label
							for="one_month_no_update" class="ml05">한 달 동안 이 창을 열지 않음</label>

						<button type="button" class="closeDl button purple x-small ml20">닫기</button>
					</div>
				</div>
			</div>
			<!--// ie-update : ie 9 이하 일때만 출력 -->
			<!--// 브라우저 다운로드 -->

			<!-- topGnb -->




			<!-- 2019-04-15 마크업 수정 : 고객요청  -->
			<div class="util-area">
				<div class="left-link">
					<a href="/benefit/viplounge" title="VIP LOUNGE">VIP LOUNGE</a> <a
						href="/benefit/membership" title="멤버십">멤버십</a> <a href="/support"
						title="고객센터">고객센터</a>
				</div>

				<div class="right-link">
					<!-- 로그인전 -->
					<div class="before" style="display: none">
						<a href="javaScript:fn_viewLoginPopup_new()" title="로그인">로그인</a> <a
							href="${path }/join" title="회원가입">회원가입</a>
					</div>

					<!-- 로그인후 -->
					<div class="after" style="display: none">
						<a href="javaScript:fn_logout()" class="" title="로그아웃">로그아웃</a> <a
							href="" class="notice" title="알림">알림</a>

						<!-- layer-header-notice -->
						<div class="layer-header-notice">
							<div class="notice-wrap">
								<p class="tit-notice">알림함</p>

								<div class="count">
									<p class="left">
										전체 <em class="totalCnt">0</em> 건
									</p>

									<p class="right">* 최근 30일 내역만 노출됩니다.</p>
								</div>

								<!-- scroll -->
								<div class="scroll m-scroll">
									<ul class="list">
										<li class="no-list">알림 내역이 없습니다.</li>
									</ul>
								</div>
								<div class="notice-list-more">
									<button type="button" class="button btn-more-notice-list">
										더보기 <i class="iconset ico-btn-more-arr"></i>
									</button>
								</div>
								<!--// scroll -->
								<button type="button" class="btn-close-header-notice">알림
									닫기</button>
							</div>
							<!--// notice-wrap -->
							<!--// layer-header-notice -->
						</div>

					</div>

					<a href="booking">빠른예매</a>
				</div>
			</div>
			<!--// 2019-04-15 마크업 수정 : 고객요청  -->

			<div class="link-area">
				<a href="#layer_sitemap" class="header-open-layer btn-layer-sitemap"
					title="사이트맵">사이트맵</a> <a href="#"
					class="header-open-layer btn-layer-search" title="검색">검색</a> <a
					href="timetable" class="link-ticket" title="상영시간표">상영시간표</a> <a
					href="Membermain" class="header-open-layer btn-layer-mymega"
					title="나의 메가박스">나의 메가박스</a>
			</div>

			<!-- gnb -->
			<!--
        2019-04-15 마크업 수정 : 고객요청
        1뎁스 a 태그에 각각 다른 class 추가
    -->

			<nav id="gnb">
				<ul class="gnb-depth1">
					<li><a href="movie" class="gnb-txt-movie" title="영화">영화</a>
						<div class="gnb-depth2">
							<ul>
								<li><a href="/movie" title="전체영화">전체영화</a></li>


								<li><a href="/curation/specialcontent" title="큐레이션">큐레이션</a></li>

								<li id="festivalArea" style="display: none;"><a
									href="/festival" title="영화제">영화제</a></li>
								<li><a href="/moviepost/all" title="무비포스트">무비포스트</a></li>
							</ul>
						</div></li>
					<li><a href="booking" class="gnb-txt-reserve" title="예매">예매</a>
						<div class="gnb-depth2">
							<ul>
								<li><a href="booking" title="빠른예매">빠른예매</a></li>
								<li><a href="timetable" title="상영시간표">상영시간표</a></li>
								<li><a href="" title="더 부티크 프라이빗 예매">더
										부티크 프라이빗 예매</a></li>
							</ul>
						</div></li>
					<li><a href="list" class="gnb-txt-theater" title="극장">극장</a>
						<div class="gnb-depth2">
							<ul>
								<li><a href="list" title="전체극장">전체극장</a></li>
								<li><a href="/specialtheater/list" title="특별관">특별관</a></li>
							</ul>
						</div></li>
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag('EVENT_LIST','/event');return false;"
						class="gnb-txt-event" title="이벤트">이벤트</a>
						<div class="gnb-depth2">
							<ul>
								<li><a href="javascript:void(0)"
									onclick="NetfunnelChk.aTag('EVENT_LIST','/event');return false;"
									title="진행중 이벤트">진행중 이벤트</a></li>
								<li><a href="javascript:void(0)"
									onclick="NetfunnelChk.aTag('EVENT_LIST','/event/end');return false;"
									title="지난 이벤트">지난 이벤트</a></li>
								<li><a href="javascript:void(0)"
									onclick="NetfunnelChk.aTag('EVENT_LIST','/event/winner/list');return false;"
									title="당첨자발표">당첨자발표</a></li>
							</ul>
						</div></li>
					<li><a href="javascript:void(0)"
						onclick="NetfunnelChk.aTag('STORE_LIST','/store');return false;"
						class="gnb-txt-store" title="스토어">스토어</a></li>
					<li><a href="/benefit/membership" class="gnb-txt-benefit"
						title="혜택">혜택</a>
						<div class="gnb-depth2">
							<ul>
								<li><a href="/benefit/membership" title="메가박스 멤버십">메가박스
										멤버십</a></li>
								<li><a href="/benefit/discount/guide" title="제휴/할인">제휴/할인</a></li>
							</ul>
						</div></li>
				</ul>
			</nav>
			<!--// gnb -->
			<!--// topGnb -->

			<!-- 레이어 : 사이트맵 -->




			<div id="layer_sitemap" class="header-layer layer-sitemap">
				<!-- wrap -->
				<div class="wrap">
					<a href="" class="link-acc" title="사이트맵 레이어 입니다.">사이트맵 레이어 입니다.</a>

					<p class="tit">SITEMAP</p>

					<div class="list position-1">
						<p class="tit-depth">영화</p>

						<ul class="list-depth">
							<li><a href="/movie" title="전체영화">전체영화</a></li>
							<li><a href="/curation/specialcontent" title="큐레이션">큐레이션</a></li>
							<li><a href="javascript:void(0)" onclick="" title="영화제">영화제</a></li>
							<li><a href="/moviepost/all" title="무비포스트">무비포스트</a></li>
						</ul>
					</div>

					<div class="list position-2">
						<p class="tit-depth">예매</p>

						<ul class="list-depth">
							<li><a href="booking" title="빠른예매">빠른예매</a></li>
							<li><a href="timetable" title="상영시간표">상영시간표</a></li>
							<li><a href="#" title="더 부티크 프라빗 예매">더 부티크 프라이빗 예매</a></li>
						</ul>
					</div>

					<div class="list position-3">
						<p class="tit-depth">극장</p>

						<ul class="list-depth">
							<li><a href="list" title="전체극장">전체극장</a></li>
							<li><a href="/specialtheater/list" title="특별관">특별관</a></li>
						</ul>
					</div>

					<div class="list position-4">
						<p class="tit-depth">이벤트</p>

						<ul class="list-depth">
							<li><a href="javascript:void(0)"
								onclick="NetfunnelChk.aTag('EVENT_LIST','/event');return false;"
								title="진행중 이벤트">진행중 이벤트</a></li>
							<li><a href="javascript:void(0)"
								onclick="NetfunnelChk.aTag('EVENT_LIST','/event/end');return false;"
								title="지난 이벤트">지난 이벤트</a></li>
							<li><a href="javascript:void(0)"
								onclick="NetfunnelChk.aTag('EVENT_LIST','/event/winner/list');return false;"
								title="당첨자발표">당첨자발표</a></li>
						</ul>
					</div>

					<div class="list position-5">
						<p class="tit-depth">스토어</p>

						<ul class="list-depth">
							<li><a href="javascript:void(0)"
								onclick="NetfunnelChk.aTag('STORE_LIST','/store');return false;"
								title="새로운 상품">새로운 상품</a></li>
							<li><a href="javascript:void(0)"
								onclick="NetfunnelChk.aTag('STORE_LIST','/store/megaticket');return false;"
								title="메가티켓">메가티켓</a></li>
							<li><a href="javascript:void(0)"
								onclick="NetfunnelChk.aTag('STORE_LIST','/store/megachance');return false;"
								title="메가찬스">메가찬스</a></li>
							<li><a href="javascript:void(0)"
								onclick="NetfunnelChk.aTag('STORE_LIST','/store/popcorn');return false;"
								title="팝콘/음료/굿즈">팝콘/음료/굿즈</a></li>
							<!-- <li><a href="javascript:void(0)" onclick="NetfunnelChk.aTag('STORE_LIST','/store/e-giftcard');return false;" title="기프트카드">기프트카드</a></li> -->
						</ul>
					</div>
					<div class="list position-6">
						<p class="tit-depth">나의 메가박스</p>
						<ul class="list-depth mymage">


							<li><a
								href="javascript:movePage('/mypage',						'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');"
								title="나의 메가박스 홈">나의 메가박스 홈</a></li>
							<li><a
								href="javascript:movePage('/mypage/bookinglist',			'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');"
								title="예매/구매내역">예매/구매내역</a></li>
							<li><a
								href="javascript:movePage('/mypage/movie-coupon',		'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');"
								title="영화관람권">영화관람권</a></li>
							<li><a
								href="javascript:movePage('/mypage/store-coupon',		'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');"
								title="스토어교환권">스토어교환권</a></li>
							<li><a
								href="javascript:movePage('/mypage/discount-coupon',		'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');"
								title="할인/제휴쿠폰">할인/제휴쿠폰</a></li>

							<li><a
								href="javascript:movePage('/mypage/point-list',			'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');"
								title="멤버십포인트">멤버십포인트</a></li>
							<li><a
								href="javascript:movePage('/mypage/moviestory',			'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');"
								title="나의 무비스토리">나의 무비스토리</a></li>
							<li><a
								href="javascript:movePage('/mypage/myevent',				'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');"
								title="나의 이벤트 응모내역">나의 이벤트 응모내역</a></li>
							<li><a
								href="javascript:movePage('/mypage/myinquiry',			'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');"
								title="나의 문의내역">나의 문의내역</a></li>
							<li><a href="#" title="자주쓰는 할인 카드">자주쓰는 할인 카드</a></li>
							<li><a
								href="javascript:movePage('/on/oh/ohh/Mypage/mainPage.do?returnURL=info','로그인이 필요한 서비스 입니다.');"
								title="회원정보">회원정보</a></li>



						</ul>
					</div>

					<div class="list position-7">
						<p class="tit-depth">혜택</p>

						<ul class="list-depth">
							<li><a href="/benefit/membership" title="멤버십 안내">멤버십 안내</a></li>
							<li><a href="/benefit/viplounge" title="VIP LOUNGE">VIP
									LOUNGE</a></li>
							<li><a href="/benefit/discount/guide" title="제휴/할인">제휴/할인</a></li>
						</ul>
					</div>

					<div class="list position-8">
						<p class="tit-depth">고객센터</p>

						<ul class="list-depth">
							<li><a href="/support" title="고객센터 홈">고객센터 홈</a></li>
							<li><a href="/support/faq" title="자주묻는질문">자주묻는질문</a></li>
							<li><a href="/support/notice" title="공지사항">공지사항</a></li>
							<li><a href="/support/inquiry" title="1:1문의">1:1문의</a></li>
							<li><a href="/support/rent" title="단체/대관문의">단체/대관문의</a></li>
							<li><a href="/support/lost" title="분실물문의">분실물문의</a></li>
						</ul>
					</div>

					<div class="list position-9">
						<p class="tit-depth">회사소개</p>

						<ul class="list-depth">
							<li><a href="/megaboxinfo" target="_blank" title="메가박스소개">메가박스소개</a></li>
							<li><a href="/socialcontribution" target="_blank"
								title="사회공헌">사회공헌</a></li>
							<li><a href="/advertize" target="_blank" title="홍보자료">홍보자료</a></li>
							<li><a href="#top" target="_blank" title="제휴/부대사업문의">제휴/부대사업문의</a></li>
							<li><a href="/onlinereport" target="_blank" title="온라인제보센터">온라인제보센터</a></li>
							<li><a href="/ir" target="_blank" title="자료">IR자료</a></li>
							<li><a href="/recruit" target="_blank" title="인재채용림">인재채용</a></li>
							<li><a href="https://jebo.joonganggroup.com/main.do"
								target="_blank" title="윤리경영">윤리경영</a></li>
						</ul>
					</div>

					<div class="list position-10">
						<p class="tit-depth">이용정책</p>

						<ul class="list-depth">
							<li><a href="/support/terms" title="이용약관">이용약관</a></li>
							<li><a href="/support/lcinfo" title="위치기반서비스 이용약관">위치기반서비스
									이용약관</a></li>
							<li><a href="/support/privacy" title="개인정보처리방침">개인정보처리방침</a></li>
							<li><a href="/support/screenrule" title="스크린수배정에관한기준">스크린수배정에관한기준</a></li>
						</ul>
					</div>

					<div class="ir">
						<a href="" class="layer-close" title="레이어닫기">레이어닫기</a>
					</div>
				</div>
				<!--// wrap -->
			</div>
			<!--// 레이어 : 사이트맵 -->

			<!-- 레이어 : 검색 -->
			<div id="layer_header_search"
				class="header-layer layer-header-search appendHtml">
				<div class="wrap">
					<a href="" class="link-acc" title="검색 레이어 입니다.">검색 레이어 입니다.</a>

					<div class="tab-rank tab-layer">
						<ul>
							<li class="on"><button type="button" class="btn">예매율
									순</button></li>
							<li><button type="button" class="btn">메가박스 관객순</button></li>
						</ul>
					</div>

					<div class="rank-cont">
						<p class="img">

							<img
								src="https://img.megabox.co.kr/SharedImg/2022/07/28/8SfJ8Fmgcum3MdNXr0YodTDDQaax6Rpn_316.jpg"
								alt="육사오(6/45)" onerror="noImg(this, 'main');">

						</p>

						<div class="list">
							<ol>


								<li><em>1</em> <a
									href="javascript:gfn_moveDetail('22041400')"
									data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/07/28/8SfJ8Fmgcum3MdNXr0YodTDDQaax6Rpn_316.jpg"
									onerror="noImg(this, 'main');" title="육사오(6/45) 상세보기">육사오(6/45)</a></li>

								<li><em>2</em> <a
									href="javascript:gfn_moveDetail('22037300')"
									data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/08/05/QDUC0cjm2bnWDCCQPYpQvelnoFe1CCfH_316.jpg"
									onerror="noImg(this, 'main');" title="헌트 상세보기">헌트</a></li>

								<li><em>3</em> <a
									href="javascript:gfn_moveDetail('22047900')"
									data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/08/04/x8Db5kXIPIjSWfLlqnrxpdKuY4REEKrB_316.jpg"
									onerror="noImg(this, 'main');" title="블랙폰 상세보기">블랙폰</a></li>

								<li><em>4</em> <a
									href="javascript:gfn_moveDetail('22018400')"
									data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/05/09/6zfAYe6IrZ8BWnruqEfafwakt5cUjWgX_316.jpg"
									onerror="noImg(this, 'main');" title="탑건: 매버릭 상세보기">탑건: 매버릭</a></li>

								<li><em>5</em> <a
									href="javascript:gfn_moveDetail('22023000')"
									data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/07/28/1ogGcWYxCNJ9MTnizlZLdZ6REjg6xX1z_316.jpg"
									onerror="noImg(this, 'main');" title="한산: 용의 출현 상세보기">한산:
										용의 출현</a></li>


							</ol>
							<ol style="display: none">


								<li><em>1</em> <a
									href="javascript:gfn_moveDetail('22018700')"
									data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/05/23/oZfETtpEvKGpdY2JQo2Z6wFL0S4cpKy5_316.jpg"
									onerror="noImg(this, 'main');" title="범죄도시 2 상세보기">범죄도시 2</a></li>

								<li><em>2</em> <a
									href="javascript:gfn_moveDetail('22018400')"
									data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/05/09/6zfAYe6IrZ8BWnruqEfafwakt5cUjWgX_316.jpg"
									onerror="noImg(this, 'main');" title="탑건: 매버릭 상세보기">탑건: 매버릭</a></li>

								<li><em>3</em> <a
									href="javascript:gfn_moveDetail('22023000')"
									data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/07/28/1ogGcWYxCNJ9MTnizlZLdZ6REjg6xX1z_316.jpg"
									onerror="noImg(this, 'main');" title="한산: 용의 출현 상세보기">한산:
										용의 출현</a></li>

								<li><em>4</em> <a
									href="javascript:gfn_moveDetail('22037300')"
									data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/08/05/QDUC0cjm2bnWDCCQPYpQvelnoFe1CCfH_316.jpg"
									onerror="noImg(this, 'main');" title="헌트 상세보기">헌트</a></li>

								<li><em>5</em> <a
									href="javascript:gfn_moveDetail('22028200')"
									data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/07/06/t0SyNNVrh4UBBxmdCqBVtehgd03NWpf7_316.jpg"
									onerror="noImg(this, 'main');" title="토르: 러브 앤 썬더 상세보기">토르:
										러브 앤 썬더</a></li>


							</ol>
						</div>
					</div>

					<div class="header-search-area">
		                <input type="text" id="headerMovieName" title="영화명을 검색해 주세요" placeholder="영화를 검색하세요" class="input-text">
		                <button type="button" id="btnHeaderSearch" class="btn-search" onclick="search_movie_by_name()">검색</button>
            		</div>

					<form name="headerBoxoForm" id="headerBoxoForm" method="post"
						onsubmit="return fn_chkHeaderBoxOffice();">
						<input type="hidden" name="searchText" id="searchText">
					</form>



					<div class="ir">
						<a href="" class="layer-close" title="레이어닫기">레이어닫기</a>
					</div>
				</div>
			</div>
			<!--// 레이어 : 검색 -->

			<!-- 레이어 : 마이페이지 -->




			<div id="layer_mymega" class="header-layer layer-mymege">
				<a href="" class="ir" title="나의 메가박스 레이어 입니다.">나의 메가박스 레이어 입니다.</a>

				<!-- wrap -->
				<div class="wrap" style="display: none">

					<div class="login-after">
						<div class="couponpass" style="display: none;">
							<span>쿠폰패스 이용고객이시군요!!쿠폰패스로 발급된 쿠폰을 확인해보세요~ </span>
						</div>
						<div class="user-info">
							<p class="txt">안녕하세요!</p>

							<p class="info">
								<!--
                            vip 일때만 출력
                            vip 아닐때는 태그 자체 삭제
                        -->
								<em class="vip">VIP PREMIUM</em> <em class="name"></em> <span>회원님</span>
							</p>

							<div class="last-date">
								마지막 접속일 : <em></em>
							</div>

							<!-- vip, 멤버십 없을때는 미 출력  -->
							<div class="membership">
								<!-- <i class="iconset ico-header-vip"></i>
                        <i class="iconset ico-header-film"></i>
                        <i class="iconset ico-header-classic"></i> -->
							</div>

							<div class="btn-fixed">
								<a href="/mypage" class="button" title="나의  메가박스">나의 메가박스</a>
							</div>
						</div>

						<div class="box">
							<div class="point">
								<p class="tit">Point</p>

								<p class="count">0</p>

								<div class="btn-fixed">
									<a href="/mypage/point-list" class="button" title="멤버십 포인트">멤버십
										포인트</a>
								</div>
							</div>
						</div>

						<div class="box">
							<div class="coupon">
								<p class="tit">
									쿠폰/관람권
									<!-- <i class="iconset ico-header-new"></i> -->
								</p>

								<p class="count">
									<em title="쿠폰 수" class="cpon">0</em> <span title="관람권 수"
										class="movie">0</span>
								</p>

								<div class="btn-fixed">
									<a href="/mypage/discount-coupon" class="button" title="쿠폰">쿠폰</a>
									<a href="/mypage/movie-coupon" class="button" title="관람권">관람권</a>
								</div>
							</div>
						</div>

						<div class="box">
							<div class="reserve">
								<p class="tit">
									예매
									<!-- <i class="iconset ico-header-new"></i> -->
								</p>

								<p class="txt"></p>

								<div class="btn-fixed">
									<a href="/mypage/bookinglist" class="button" title="예매내역">예매내역
									</a>
								</div>
							</div>
						</div>

						<div class="box">
							<div class="buy">
								<p class="tit">
									구매
									<!-- <i class="iconset ico-header-new"></i> -->
								</p>

								<p class="count">
									<em>0</em> <span>건</span>
								</p>
							</div>

							<div class="btn-fixed">
								<a href="/mypage/bookinglist?tab=02" class="button" title="구매내역">구매내역</a>
							</div>
						</div>
					</div>

					<!-- 로그인 전 -->
					<div class="login-before">
						<p class="txt">
							로그인 하시면 나의 메가박스를 만날 수 있어요.<br /> 영화를 사랑하는 당신을 위한 꼭 맞는 혜택까지 확인해
							보세요!
						</p>

						<div class="mb50">
							<a href="#layer_login_common" id="moveLogin" title="로그인"
								class="button w120px btn-modal-open" w-data='850' h-data='484'>로그인</a>
						</div>

						<a href="/join" class="link" title="혹시 아직 회원이 아니신가요?">혹시 아직
							회원이 아니신가요?</a>
					</div>
				</div>
				<!--// wrap -->

				<div class="ir">
					<a href="" class="layer-close" title="레이어닫기">레이어닫기</a>
				</div>
			</div>
			<!--// 레이어 : 마이페이지 -->

		</header>
		<!--// header -->

		<!-- 		<div id="bodyContent"> -->
		<link rel="stylesheet" href="${path }/resources/css/main.css"
			media="all" />
		<!-- 2019-04-03 swipe 기능 추가 -->
		<script src="${path }/resources/js/main/swiper.min.js"></script>

		<script>
$(function(){
	// 메인 배너 스와이프
	var pop_Swiper = null;
	var timer = null,
		   perc = 0,
		   timeTotal = 3000,
		   timeCount = 0,
		   cFlag;

		var info_specialSwiper = new Swiper('.info-special', {
			slidesPerView: 'auto',
			slidesPerView: 6,
			spaceBetween: 16,
			navigation: {
				nextEl: ".special-next",
				prevEl: ".special-prev",
			},
		});

	if( $('#pop_swiper').length > 0 ) {
		pop_Swiper = new Swiper('#pop_swiper', {
		    speed : 1000,
		    loop: true,
		    effect: 'fade',
		    observer: true,
		    observeParents:true,
		    autoplay: {
		        delay: timeTotal,
		        disableOnInteraction:false,
		    },
		    pagination: {
		        el: '.btn_pg',
	            clickable : true,
		    },
		     on: {
		         init: function () {
		            animateUpdate();
		        },
		        transitionStart: function () {
		            clearInterval(timer);
		        },
		        transitionEnd: function () {
		            perc = 1;
		            if(!this.autoplay.running) this.autoplay.start();
		            $('.pop_lobtn_play').removeClass('stop');
		            cFlag = false;
		            animateUpdate();
		        },
		    }
		});
	}

	function animateUpdate() {
	    autoplayTime = timeTotal / 100;
	    clearInterval(timer);
	    timer = setInterval(updateProgress, autoplayTime);
	    function updateProgress() {
	        if(perc >= 100) {
	            clearInterval(timer);
	        }else{
	            perc++;
	        }
	    }
	}
	
	
	$('.btn-layer-search').click(function(){
		var layer_header_search = document.getElementById('layer_header_search');
		if(layer_header_search.classList.contains('on')){
			$("#layer_header_search").removeClass('on');
		}else{
			$("#layer_header_search").addClass('on');
		}
	});

	$('.pop_lobtn_play').click(function() {
        if (!cFlag) {
            $(this).addClass('stop');
            clearInterval(timer);
            pop_Swiper.autoplay.stop();
            cFlag = true;
        }else{
            $(this).removeClass('stop');
            pop_Swiper.autoplay.start();
            animateUpdate();
            cFlag = false;
        }
    });

	//그랜드오픈 스와이프
	if( $('.open-swiper').length > 0 ){
		var open_swiper = new Swiper('.open-swiper', {
			autoplay: {
				delay: 3000,
				disableOnInteraction: true,
			},
			slidesPerView: 3,
			spaceBetween: 0,
			pagination: {
				el: '.open-pagination',
				//type: 'fraction',
				clickable: false,
			},
			navigation : {
				prevEl : '.open-prev',
				nextEl : '.open-next',
			},
			ally : {
				enabled : true
			}
		});

		$('.open-cont .count-num .total').text(open_swiper.snapGrid.length)

		open_swiper.on('slideChange', function(){
			$('.open-cont .count-num .active').text(open_swiper.activeIndex + 1)
		});

		$('.open-pause').on('click', function(){
			open_swiper.autoplay.stop();

			$(this).removeClass('on');
			$('.open-play').addClass('on').focus();
		});

		$('.open-play').on('click', function(){
			open_swiper.autoplay.start();

			$(this).removeClass('on');
			$('.open-pause').addClass('on').focus();
		});

		$('.open-swiper .cell a').on({
			focus : function(){
				open_swiper.autoplay.stop();
			}
		});

		$('.open-swiper').on({
			mouseenter : function(){
				open_swiper.autoplay.stop();
				$('.open-pause').removeClass('on');
				$('.open-play').addClass('on');
			}
		});

		$(window).resize(function(){
			open_swiper.update();
		}).resize();
	}
	//배너명 설정(다시 보지않기 설정후 신규적용시는 떠야함. 배너별 유일하게 구분)
	var bannerDate = "";

	
		bannerDate = "202208081153";
	

	/* 보고싶어 이벤트*/
	$(document).on('click','.btn-util .btn-like', function(){
		fn_addHeart(this);
	});

	//박스오피스/누적관객/메가스코어순
	$("button[name='btnSort']").on('click', function() {
		//버튼 on 클래스 추가
		$("button[name='btnSort']").removeClass('on');
		$(this).addClass('on');

		var sort = $(this).attr("sort");
		//해당 영역 display
		$(".main-movie-list>.list li").hide();
		$(".main-movie-list>.list li[name='li_"+ sort +"']").show();
	});

	//팝업 닫기 버튼 클릭
	$(".btn-close-main-notice").on('click', function() {
		//alert("11111");
		if ($(":checkbox[id='no_see']:checked").length > 0) {
			fn_setCookie("MAIN_POP_"+bannerDate, "Y", 1);
		}

		$('.main-notice-layer').hide();
	});

	//다시보지 않기 설정시 팝업 뜨지 않음
	if (fn_getCookie("MAIN_POP_"+bannerDate) == null || fn_getCookie("MAIN_POP_"+bannerDate) == 'N') {
		if ($('.main-notice-layer').length > 0) {
			$('.main-notice-layer').show();
		}
	}


	//검색 버튼 클릭
	$("#btnSearch").click(function(){
		fn_searchBoxOffice();
	});

	/* 검색 input enter key 이벤트 */
	$("#movieName").on("keydown", function(e){
		var keycode = (e.keyCode ? e.keyCode : e.which);
		if(keycode == 13){
			fn_searchBoxOffice();
		}
	});


	//선호극장 > 변경
	$('#myFaverBrch a').click(function() {

		gfn_favorBrchReg(function(param) {

			var data = {favorInfo : {mbFavorBrchList : param}};

			makeHtmlForFaverInfo(data, 'B');
		});
	});

	// 선호관람정보 > 설정
	$('#myFaverInfo a').click(function() {

		var option = {
			url       : '/on/oh/ohh/MyScnBoard/MyBrchFavorPopup.do',
			height    : 300,
			width     : 600,
			initFn    : 'faverInfoInit',
			initParam : {callbackFn : function(param){

				var arrTime  = new Array();
				var arrGenre = new Array();

				var data = {favorInfo : {mbFavorTimeList : arrTime, mbFavorGenreList : arrGenre}};

				$.each(param, function(i, data) {

					if (data.favorDivCd == 'FDC03') arrTime.push(data);
					if (data.favorDivCd == 'FDC01') arrGenre.push(data);
				});

				makeHtmlForFaverInfo(data, 'I');
			}}
		}

		gfn_divLayPopUp(option);
	});

	// 해피톡 유출관련
    if(fn_loginAt()){
		//fn_happyCheck();
    }
});

//홍현식 로그인 여부 체크
function fn_loginAt() {
	
	var result;
	$.ajax({
		url: "${path}/login/selectLoginSession",
		type: "POST",
		async: false,
		contentType: "text",
		success: function (data) {
			if(data=="true"){
				result="true";
			}else{
				result="false";
			}
		}
	});
return result;
}

//홍현식 로그아웃
function fn_logout(){
	$.ajax({
		url: "${path}/login/logoutSession",
		type: "POST",
		async: false,
		contentType: "text",
		success: function (data) {
			location.href="${path}/main";
		}
	});	
}

//쿠키설정
function fn_setCookie(cname, cvalue, exdays) {
	var d = new Date();
	d.setTime(d.getTime() + (exdays*24*60*60*1000));
	var expires = "expires="+d.toUTCString();
	document.cookie = cname + "=" + cvalue + "; " + expires + ";path=/";
}

//쿠키조회
function fn_getCookie(name) {
	var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	return value? value[2] : null;
}

//영화 관람평 이동
function fn_moveDetailTab(rpstMovieNo) {
	$("#rpstMovieNo").val(rpstMovieNo);
	$("#detailForm").attr("action", "/movie-detail?tabCd=one");
	$("#detailForm").submit();
}

//박스오피스 이동 체크
function fn_chkBoxOffice() {
	if ($("#movieName").val() == "") {
		gfn_alertMsgBox("영화명을 입력해 주세요");
		return false;
	}
}

//박스오피스 이동
function fn_searchBoxOffice() {
	$("#boxoForm").attr("action", "search?mName="+$("#movieName").val());
	$("#boxoForm").submit();
}


/*보고싶어 저장*/
function fn_addHeart(obj){
	var rpstMovieNo = $(obj).attr("rpst-movie-no");
	var allData = { rpstMovieNo:rpstMovieNo};
	var idx = $(".movie-list-info .btn-see .heart").index(obj);

	$.ajaxMegaBox({
        url: "/on/oh/oha/Movie/mergeMovieHeart.do",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
		data: JSON.stringify(allData),
		sessionAt: true,
        success: function (data, textStatus, jqXHR) {

			var resultMap = data.resultMap;

			if(resultMap.msg == "sessionFail"){
				alert("로그인 후 이용가능한 서비스입니다.");
				return;
			}

			var text = "";
			$(obj).html('');

            var s_intrstCnt = '';
            if (resultMap.intrstCnt > 999) {
            	s_intrstCnt = Math.floor((resultMap.intrstCnt/1000) * 10)/10  + 'k';
            } else {
            	s_intrstCnt = resultMap.intrstCnt;
            }

			if(resultMap.rowStatCd == "D"){
				text = "<i title=\"보고싶어 설정 안함\" class=\"iconset ico-heart-toggle-gray\"></i>"+s_intrstCnt;
			}else{
				text = "<i title=\"보고싶어 설정 함\" class=\"iconset ico-heart-toggle-gray on\"></i>"+s_intrstCnt;
			}
			$(obj).append(text);
        },
        error: function(xhr,status,error){
        	 var err = JSON.parse(xhr.responseText);
        	 alert(xhr.status);
        	 alert(err.message);
        }
    });
}

var moveBokdPage = function(movieNo, mxType) {
    var form = $('<form>').attr({ 'action': '/booking', 'method': 'post' });
    form.append($('<input>').attr({ 'type': 'hidden', 'name': 'rpstMovieNo', 'value': movieNo }));

    // MX 예매 여부
    if(mxType) form.append($('<input>').attr({ 'type': 'hidden', 'name': 'theabKindCd1', 'value': 'MX' }));

    $('footer').append(form);
    form.submit();
};

</script>
		<form name="detailForm" id="detailForm" method="post">
			<input type="hidden" name="rpstMovieNo" id="rpstMovieNo" />
		</form>
		<form name="boxoForm" id="boxoForm" method="post"
			onsubmit="return fn_chkBoxOffice();">
			<input type="hidden" name="ibxMovieNmSearch" id="ibxMovieNmSearch" />
		</form>

		<div class="container main-container">

			<!-- contents -->
			<div id="contents">

				<!-- main-page -->
				<div class="main-page">

					<!-- 로그인 후에만 출력 -->

					<!-- section main-movie : 영화 -->
					<div id="main_section01" class="section main-movie">
						<div class="bg">
							<div class="bg-pattern"></div>
							<img
								src="https://img.megabox.co.kr/SharedImg/2022/08/05/j955i2acyN0WMg7QQOjnSVLuMl1xmzur_380.jpg"
								alt="NVV1sJ39un40HMIwi8fY54YpXhzqBG36.jpg"
								onerror="this.src='${path }/resources/images/bg-noimage-main.png'" />
						</div>

						<!-- cont-area  -->
						<div class="cont-area">

							<!-- tab-sorting -->
							<div class="tab-sorting">
								<button type="button" class="on" sort="boxoRankList"
									name="btnSort">박스오피스</button>
								<!-- 2020.03.16. 김민영K 삭제요청.
						<button type="button" sort="accmAdncList" name="btnSort">누적관객순</button>
						<button type="button" sort="megaScoreList" name="btnSort">메가스코어순</button>
						-->
							</div>
							<!-- tab-sorting -->

							<a href="movie" class="more-movie" title="더 많은 영화보기"> 더 많은
								영화보기 <i class="iconset ico-more-corss gray"></i>
							</a>

							<!-- main-movie-list -->
							<div class="main-movie-list">
								<ol class="list">
									<!-- 3개의 list를  loop 한다-->
									<!-- 박스오피스 시작 -->
									<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->
									<c:forEach var="list" items="${list }" varStatus="status">
									<c:if test="${status.index < 4}"> 
											
									<c:choose>
														<c:when test="${status.first}">
															<li name="li_boxoRankList" class="first">
														</c:when>
														<c:otherwise>
															<li name="li_boxoRankList" class="">
														</c:otherwise>
													</c:choose>
										
											<a
											href="move-detail?rpstMovieNo='${list.m_num}'"
											class="movie-list-info" title="영화상세 보기">
											
												<div class="screen-type2">
													<%-- <p><img src="${path }/resources/images/btn/mov_top_tag_db.png" alt="dolby"></p>
													<p><img src="${path }/resources/images/btn/mov_top_tag_mx.png" alt="mx"></p> --%>
												</div>
												<p class="rank"><c:out value="${status.count}" /><span class="ir">위</span>
												</p> <!-- to 개발 : alt 값에 영화 제목 출력 --> <img
												src="${list.m_poster}" alt="${list.m_name}" class="poster"
												onerror="this.src='${path }/resources/images/bg-noimage-main.png'" />
												<div class="wrap">
													<div class="summary">
														${list.m_story }
														<!--
														관람 전이 더 높을 때
														<div class="my-score small">

														관람 후가 더 높을 때
														<div class="my-score big">

														관람 후가 더 같을 때
														<div class="my-score equal">
													 --></div>
														<div class="score">
															<div class="preview">
																<p class="tit">관람평</p>
																<p class="number">${list.m_avgstr}<span class="ir">점</span>
																</p>
															</div>
														</div>
													</div>
										</a>
											<div class="btn-util">
													<c:choose>
														<c:when test="${map[list.m_num]==true}">
															<button id = "likebtn" type="button" class="button btn-like"
																data-no="${list.m_num}" data-type="on">
																<!-- 좋아요 on / 안하면 off -->
																<i class="iconset ico-heart-toggle-gray on"></i>
																<span>${list.m_like }</span>
															</button>
														</c:when>
														<c:otherwise>
															<button type="button" id = "likebtn" class="button btn-like"
																data-no="${list.m_num}" data-type="off">
																<!-- 좋아요 on / 안하면 off -->
																<i class="iconset ico-heart-toggle-gray"></i>
																<span>${list.m_like }</span>
															</button>
														</c:otherwise>
													</c:choose>
												<div class="case">
													<!-- 개봉 예매가능 기본-->
													<a href="booking"
														class="button gblue" title="영화 예매하기">예매</a>
												</div>
											</div></li>
											
											</c:if>
									</c:forEach>
									<!-- 각 map 별 첫번째 li 에 first클래스 추가 -->

									<!-- 박스오피스 종료 -->
								</ol>
							</div>
							<!--// main-movie-list -->

							<div class="search-link">
								<div class="cell">
									<div class="search">
										<input type="text" placeholder="영화명을 입력해 주세요" title="영화 검색"
											class="input-text" id="movieName" />
										<button type="button" class="btn" id="btnSearch">
											<i class="iconset ico-search-w"></i> 검색
										</button>
									</div>
								</div>

								<div class="cell">
									<a href="timetable" title="상영시간표 보기"><i
										class="iconset ico-schedule-main"></i> 상영시간표</a>
								</div>
								<div class="cell">
									<a href="movie" title="박스오피스 보기"><i
										class="iconset ico-boxoffice-main"></i> 박스오피스</a>
								</div>
								<div class="cell">
									<a href="booking" title="빠른예매 보기"><i
										class="iconset ico-quick-reserve-main"></i> 빠른예매</a>
								</div>
							</div>
							<!-- 2019-02-22 추가 : 마우스 아이콘 영역 추가 -->
							<div class="moving-mouse">
								<!--  <i class="iconset ico-mouse"></i> -->
								<img class="iconset" alt=""
									src="${path }/resources/images/icon/ico-mouse.png" />
							</div>
							b
							<!--// 2019-02-22 추가 : 마우스 아이콘 영역 추가 -->
						</div>
						<!--// cont-area  -->
					</div>
					<!--// section main-movie : 영화 -->

					<!-- section main-benefit : 혜택 -->
					<div id="main_section02" class="section main-benefit">
						<!-- wrap -->
						<div class="wrap">
							<!-- 혜택 시작 -->
							<div class="tit-util">
								<h2 class="tit">혜택</h2>
								<a href="javascript:void(0)"
									onclick="NetfunnelChk.aTag('EVENT_LIST','/event');return false;"
									class="btn-more-cross purple" title="혜택 더보기">더보기</a>
							</div>
							<!--
							왼쪽 글씨 이미지 사이즈 300 * 230, 오른쪽 이미지 635 * 325
						 -->
							<div class="slider main-condition">
								<div class="slider-view">
									<div class="cell">
										<div class="position">
											<div class="txt">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11681"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/08/08/4flptBkOJU3Mdmn4idl7zPo71DUnvwlL.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
											<div class="bg">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11681"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/08/08/DxlgADp9kpfQurpgBvWLQMfI2VkI02VI.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
										</div>
									</div>
									<div class="cell">
										<div class="position">
											<div class="txt">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11650"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/08/01/hBPtMdOJzpuPAtgYiRzA27HiJEUso7ia.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
											<div class="bg">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11650"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/08/01/PkqUJY2rla9nNB3IlZxfSGPB29H2PV1b.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
										</div>
									</div>
									<div class="cell">
										<div class="position">
											<div class="txt">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11514"
													target="_self" title="이벤트페이지 바로가기"><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/06/24/6sb4dWdd8y1njIzzRxrzRqeUYKreanON.png"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
											<div class="bg">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11514"
													target="_self" title="이벤트페이지 바로가기"><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/06/24/e0J0ZfB5njye346I2UzHL0tUIjmxot2f.png"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
										</div>
									</div>
									<div class="cell">
										<div class="position">
											<div class="txt">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11438"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/06/07/6GT9suCtq4nejcuEINJC4IxvKGZy0hTT.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
											<div class="bg">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11438"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/06/07/SIeNdNGwmOKgIKPCraVEJYVSoaEaH1gT.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
										</div>
									</div>
									<div class="cell">
										<div class="position">
											<div class="txt">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11303"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/04/25/xjBVzi25V6oLS7Q7i1ZRgqK3CZUnuRzE.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
											<div class="bg">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11303"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/04/25/f509FdJABFDs6erpBAUqJx0uNColbDOs.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
										</div>
									</div>
									<div class="cell">
										<div class="position">
											<div class="txt">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11263"
													target="_self" title="할인쿠폰 받기"><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/08/05/oF7Qwu6GNyz5oVwHfWxtLv1Tc0zbRtrO.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
											<div class="bg">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=11263"
													target="_self" title="할인쿠폰 받기"><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/08/05/CMDINzKvXAivmNE9VnmAjXMHbhKrKDJC.png"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
										</div>
									</div>
									<div class="cell">
										<div class="position">
											<div class="txt">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=10868"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/01/14/mmitS7eSkiQVzZL1paP0NxK5m6j3uVKT.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
											<div class="bg">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=10868"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2022/01/14/yDRjd4ejz8oirC4wLrukvHK3KIWH1tCY.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
										</div>
									</div>
									<div class="cell">
										<div class="position">
											<div class="txt">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=9187"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2021/02/01/f7RPSplY1eWEFFhKNBDJK4JIXKv9NBZK.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
											<div class="bg">
												<a
													href="https://www.megabox.co.kr/event/detail?eventNo=9187"
													target="_self" title=""><img
													src="https://img.megabox.co.kr/SharedImg/BnftMng/2021/02/01/fZ8glF2ggujTRrF5vtRuE1iE2UjjV1oF.jpg"
													alt=""
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" /></a>
											</div>
										</div>
									</div>
								</div>
								<div class="slider-control">

									<div class="page">
										<!--
										cell 갯수만큼 span 반복
									 -->
										<span style="width: 25%;"></span> <span class="on"
											style="width: 25%;"></span> <span style="width: 25%;"></span>
										<span style="width: 25%;"></span>
									</div>

									<div class="util">
										<button type="button" class="btn-prev">이전 이벤트 보기</button>
										<button type="button" class="btn-next">다음 이벤트 보기</button>

										<button type="button" class="btn-pause on">일시정지</button>
										<button type="button" class="btn-play">자동재생</button>
									</div>

									<div class="page-count">
										<span>1</span> / <em>8</em>
									</div>

								</div>
							</div>


							<div class="brn-ad" style="height: 204px;">
								<div class="banner">
									<div class="size">
										<a href="#" data-no="10868" data-netfunnel="N"
											class="eventBtn" title=""> <img
											src="https://img.megabox.co.kr/SharedImg/event/2022/01/14/PaafbTzHLzAZslfTq3eRZS19bGTV7sG7.jpg"
											alt="신규 &amp; 휴면회원 만.반.잘.부! 모두 혜택 받아가세요"
											onerror="this.src='${path }/resources/images/bg-noimage-main.png'" />
										</a>
									</div>
									<div class="size small">
										<a href="#" data-no="11438" data-netfunnel="N"
											class="eventBtn" title="이벤트페이지 바로가기"> <img
											src="https://img.megabox.co.kr/SharedImg/event/2022/05/31/4pLdCNd6S9Vl2JGPW4Q68KSPJ28axiUc.jpg"
											alt="[대한항공X메가박스] SKYPASS 회원 할인 프로모션"
											onerror="this.src='${path }/resources/images/bg-noimage-main.png'" />
										</a>
									</div>
								</div>
								<!-- 광고영역 -->
								<div class="ad-img">
									<!-- <img src="../../../static/pc/images/main/@img-main-ad.png" alt="블루멤버스 포인트로" /> -->
									<script data-id="M_rwl-o8QV2xFMa0Oy93qQ"
										name="megabox_p/main/main@main_middle_event_415x530?mlink=341"
										src="//cast.imp.joins.com/persona.js" async></script>
								</div>
								<!-- 광고영역 -->
							</div>
							<!-- 혜택 종료 -->

							<div class="menu-link">
								<div class="cell vip">
									<a href="/benefit/viplounge" title="VIP LOUNGE 페이지로 이동">VIP
										LOUNGE</a>
								</div>
								<div class="cell membership">
									<a href="/benefit/membership" title="멤버십 페이지로 이동">멤버십</a>
								</div>
								<div class="cell card">
									<a href="/benefit/discount/guide" title="할인카드안내 페이지로 이동">할인카드안내</a>
								</div>
								<div class="cell event">
									<a href="javascript:void(0)"
										onclick="NetfunnelChk.aTag('EVENT_LIST','/event');return false;"
										title="이벤트 페이지로 이동">이벤트</a>
								</div>
								<div class="cell store">
									<a href="javascript:void(0)"
										onclick="NetfunnelChk.aTag('STORE_LIST','/store');return false;"
										title="스토어 페이지로 이동">스토어</a>
								</div>
							</div>

							<!-- grand-open -->
							<div class="grand-open">
								<p class="tit">
									<span>MEGABOX</span> <strong>GRAND<br />OPENING
									</strong>
								</p>

								<div class="open-cont">

									<div class="open-pagination"></div>

									<div class="open-control">
										<button type="button" class="open-prev">이전 이벤트 보기</button>
										<button type="button" class="open-next">다음 이벤트 보기</button>

										<button type="button" class="open-pause on">일시정지</button>
										<button type="button" class="open-play">자동재생</button>
									</div>

									<div class="count-num">
										<span title="현재 페이지" class="active">1</span> / <span
											title="전체 페이지" class="total">1</span>
									</div>

									<div class="open-swiper">
										<div class="swiper-wrapper">
											<div class="cell swiper-slide">
												<a href="#" data-no="11531" data-netfunnel=""
													class="eventBtn new" title="[금정AK플라자지점] 오픈 이벤트 페이지로 이동">
													<span class="label"> <!-- 지점 상태에 따른 노출 문구 설정--> <em>신규오픈</em>
														<!-- 코드선택일 경우 (신규오픈,리뉴얼오픈,오픈예정)-->
												</span>

													<p class="area">
														<span></span> <strong>금정AK플라자</strong>
													</p>

													<p class="date">2022.07.13</p> <img src=""
													alt="[금정AK플라자지점] 오픈 이벤트"
													onerror="this.src='${path }/resources/images/bg-noimage-main.png'" />
													<!-- 이벤트 이미지 적용하지 않고 기본이미지 사용 2019.08.29 -->
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--// grand-open -->
						</div>
						<!--// wrap -->
					</div>
					<!--// section main-benefit : 혜택 -->

					<div id="main_section03" class="section main-curation">
						<!-- wrap -->
						<div class="wrap">
							<div class="tit-util">
								<h2 class="tit">큐레이션</h2>

								<div class="right">
									<a href="/curation/filmsociety" title="큐레이션 더보기"> 큐레이션 더보기
										<i class="iconset ico-more-corss gray"></i>
									</a>
								</div>
							</div>

							<!-- curation-area -->
							<div class="curation-area">
								<!-- curr-img -->
								<div class="curr-img">
									<p class="bage classic">메가박스 클래식소사이어티</p>
									<div class="img">
										<a href="javascript:gfn_moveDetail('22045000');"
											title="영화상세 보기"> <img
											src="https://img.megabox.co.kr/SharedImg/2022/07/20/0MpvTj5AFFSmZLdyBHxxbZOkFKWVHpTy_420.jpg"
											alt="[오페라] 투란도트 @The Met"
											onerror="this.src='${path }/resources/images/bg-noimage-main.png'" />
										</a>
									</div>

									<div class="btn-group justify">
										<div class="left">
											<a href="javascript:gfn_moveDetail('22045000');"
												class="button" title="영화상세 보기">상세정보</a>
										</div>
										<div class="right">
											<a href="javascript:moveBokdPage('22045000');"
												class="button gblue" title="영화 예매하기">예매</a>
										</div>
									</div>

									<div class="info classic">
										<p class="txt">
											#<span>클래식소사이어티</span>
										</p>
										<p class="tit">[오페라] 투란도트 @The Met</p>
										<p class="summary">
											한국 테너 이용훈, 칼라프 역으로 다시 메트 무대에 도전장!<br> <br>[상영 정보]<br>상영지점
											: 센트럴 / 코엑스 / 목동 / 성수 / 분당 / 킨텍스<br>상영일정 : 2022년 8월
											2일(화) ~ 9월 10일(토) / 화 19:00, 토 10:00<br>러닝타임 : 180분
											*인터미션 없음<br> <br>[공연정보] <br>제작년도 : 2022년 5월 7일<br>작곡
											: 자코모 푸치니 (Giacomo Puccini)<br>지휘 : 마르코 아르밀리아토 (Marco
											Armiliato)<br>연출 : 프랑코 제피렐리 (Franco Zeffirelli)<br>출연
											: 류드밀라 모나스티르스카(투란도트), 이용훈(칼라프), 에르모넬라 야호(류) 등<br>liudmyla
											monastyrska (Turandot), Yonghoon Lee (Calàf), Ermonela Jaho
											(Liù)<br> <br>[시놉시스]<br>고대중국의 공주 투란도트는 아름다운
											외모로 수많은 왕자들의 구혼을 받지만, 모든 청혼을 거부하며 오직 자신이 낸 세 가지 수수께끼를 푸는 사람과
											결혼하겠다고 선포한다. 수수께끼를 풀지 못한 왕자들은 처참하게 처형당하고, 소문은 흉흉해진다. 한 편,
											타타르왕국에서 쫓겨나 유랑생활을 하던 칼라프 왕자는 투란도트에게 반하여 자신을 사랑하는 시녀 류와 아버지의
											만류를 뿌리치고 자신의 신분을 속인 채 투란도트의 수수께끼에 도전한다. <br> <br>[작품소개]<br>소프라노
											류드밀라 모나스티르스카는 푸치니의 얼음공주 역으로 메트 무대에 섰다. 투란도트의 사랑을 얻으려고 작정한 용감한
											왕자 역은 테너 이용훈이, 충직한 시녀 류 역은 소프라노 에르모넬라 야호가 맡았고 베이스 페루초 푸를라네토가
											눈먼 티무르 왕으로 출연한다. 지속적 인기를 누리는 프랑코 제피렐리의 연출로 막이 오르는 푸치니의 명작을
											마르코 아르밀리아토가 지휘한다.<br>
										</p>
									</div>
								</div>
								<!--// curr-img -->

								<!--// list-area -->
								<div class="list">
									<ul>
										<li><a href="javascript:gfn_moveDetail('22040400');"
											title="영화상세 보기">
												<p class="bage classic">클래식소사이어티</p>
												<div class="img">
													<img
														src="https://img.megabox.co.kr/SharedImg/2022/07/07/LKqgCSfHArzl5unuMEfKeD0RWG4q0sOf_230.jpg"
														alt="[2022 시네도슨트] 메트로폴리탄 미술관"
														onerror="this.src='${path }/resources/images/bg-noimage-main.png'" />
												</div>

												<p class="tit">[2022 시네도슨트] 메트로폴리탄 미술관</p>

												<p class="summary">스크린에서 만나는 세계의 미술관 2022 CINE DOCENT -
													The Metropolitan Museum of Art 메가박스 클래식 소사이어티의 시네 도슨트,
													2022년 새롭게 돌아왔습니다. 서유럽을 넘어 러시아와 북미까지. 세계의 미술관들이 품고 있는 문화와
													예술사를 안현배 미술사학자의 풍부한 해설과 함께 만나 보세요. [미국 뉴욕 - 메트로폴리탄 미술관] 미국의
													루브르라 불리는 서양 미술 걸작품들의 총 집합소. 문화와 구대륙에 대한 열등감을 극복하고 신대륙 예술의
													기틀을 마련하고자 한 의욕이 낳은 거대한 미술관. - 강연일시 : 8월 16일(화) 오후 7시 30분,
													8월 17일(수) 오전 11시 * 코엑스 행사로 인해 강연시간대가 변경되어 진행됩니다. - 예매오픈 :
													7월 28일(목) 오후 3시 - 강연장소 : 메가박스 코엑스 - 강연시간 : 110분 ○ 도슨트 :
													미술사학자 안현배 파리 1 대학교에서 역사학과 프랑스 근대 정치 문화사를 전공했고, 아나키즘 주제로 석사
													학위를 받았다. 예술사학과에서 프랑스 근대 예술사로 전공을 바꾸고 석사 학위를 이어, 같은 분야 박사
													과정을 수료했다. 현재 예술의 전당 강사와 대학 강의를 맡아 서양 예술사와 문화를 소개하고 있다. 저서로는
													&ldquo;안현배의 예술수업, 모더니즘 편&rdquo; 과 &ldquo;미술관에 간 인문학자&rdquo;
													가 있다. 미술사학자로서 예술을 보다 넓은 컨텍스트 안에서 인문학적으로 접근하는 시야를 열고자 노력하고
													있다. *** 본 프로그램은 별도의 영상 상영 없이 진행되는 강연 프로그램입니다. *** 강연 일정은 강사
													사정에 따라 변동될 수 있습니다. ***강연 3일전 ~ 1일전 취소 및 환불시 수수료가 10% 발생되며,
													당일 취소는 불가 합니다.</p>
										</a></li>
										<li><a href="javascript:gfn_moveDetail('22047100');"
											title="영화상세 보기">
												<p class="bage classic">클래식소사이어티</p>
												<div class="img">
													<img
														src="https://img.megabox.co.kr/SharedImg/2022/08/03/LCMPxS5E7VSZTI3QhD6E2NIYgLro7GbI_230.jpg"
														alt="[2022 시네도슨트] 바티칸 미술관"
														onerror="this.src='${path }/resources/images/bg-noimage-main.png'" />
												</div>

												<p class="tit">[2022 시네도슨트] 바티칸 미술관</p>

												<p class="summary">스크린에서 만나는 세계의 미술관 2022 CINE DOCENT -
													Vatican Museums 메가박스 클래식 소사이어티의 시네 도슨트, 2022년 새롭게 돌아왔습니다.
													서유럽을 넘어 러시아와 북미까지. 세계의 미술관들이 품고 있는 문화와 예술사를 안현배 미술사학자의 풍부한
													해설과 함께 만나 보세요. [바티칸 - 바티칸 미술관] 종교의 총본산에서 만나는 예술에 담긴 인간의 모습.
													시스티나 천정 벽화, 피에타 등 사람들의 발길을 끊임없이 잇게 만드는 예술 작품 다시 보기. - 강연일시
													: 8월 22일(월) 오전 11시, 8월 23일(화) 오후 7시 30분 - 예매오픈 : 8월 4일(목)
													오후 3시 - 강연장소 : 메가박스 코엑스 - 강연시간 : 110분 ○ 도슨트 : 미술사학자 안현배 파리
													1 대학교에서 역사학과 프랑스 근대 정치 문화사를 전공했고, 아나키즘 주제로 석사 학위를 받았다.
													예술사학과에서 프랑스 근대 예술사로 전공을 바꾸고 석사 학위를 이어, 같은 분야 박사 과정을 수료했다.
													현재 예술의 전당 강사와 대학 강의를 맡아 서양 예술사와 문화를 소개하고 있다. 저서로는
													&ldquo;안현배의 예술수업, 모더니즘 편&rdquo; 과 &ldquo;미술관에 간 인문학자&rdquo;
													가 있다. 미술사학자로서 예술을 보다 넓은 컨텍스트 안에서 인문학적으로 접근하는 시야를 열고자 노력하고
													있다. *** 본 프로그램은 별도의 영상 상영 없이 진행되는 강연 프로그램입니다. *** 강연 일정은 강사
													사정에 따라 변동될 수 있습니다. ***강연 3일전 ~ 1일전 취소 및 환불시 수수료가 10% 발생되며,
													당일 취소는 불가 합니다.</p>
										</a></li>
										<li><a href="javascript:gfn_moveDetail('22041200');"
											title="영화상세 보기">
												<p class="bage classic">클래식소사이어티</p>
												<div class="img">
													<img
														src="https://img.megabox.co.kr/SharedImg/2022/08/04/RAANzvzBt9NNBJpTozJCTBEuiNH0YDTI_230.jpg"
														alt="[2022 잘츠부르크 페스티벌] 마술피리"
														onerror="this.src='${path }/resources/images/bg-noimage-main.png'" />
												</div>

												<p class="tit">[2022 잘츠부르크 페스티벌] 마술피리</p>

												<p class="summary">
													스크린으로 만나는 지상 최대 클래식 페스티벌, 그 세번째 무대 모차르트의 고향, 잘츠부르크에서 열리는
													모차르트 최후의 오페라
													<마술피리> [공연 정보] - 공연 명칭 : 2022 잘츠부르크 페스티벌 &ndash;
													마술피리 (오페라 공연으로 한글자막 제공) - 상영 일시 : 2022년 8월 21일(일) 19:00 *
													딜레이 중계 - 예매 오픈 : 2022년 7월 26일(화) 13:00 - 공연 시간 : 약 150분 /
													인터미션 없음 *** 본 상영은 위성 중계 상영작으로, 음향 및 화질이 고르지 못할 수 있습니다. ***
													현지 공연 사정 및 중계 상황에 따라 프로그램 및 러닝타임이 변경될 수 있습니다. [페스티벌 소개]
													1920년부터 시작한 잘츠부르크 페스티벌은 매년 여름 모차르트의 고향 오스트리아 잘츠부르크에서 열리는
													세계적인 클래식 음악 축제이다. 오페라, 연극, 콘서트 등 명실공히 세계 최고의 수준을 자랑하는 연주자와
													프로덕션이 모여 높은 인기를 자랑할 뿐 아니라 매해 음악계의 판도를 가늠하는 자리이기도 하다. 올해
													102번째 시즌을 맞은 잘츠부르크 페스티벌은 불확실한 세계 속 예술의 역할에 대해 논의한다. 다양한
													프로그램과 예술가들, 그리고 관객들을 통해 완성되는 축제는 시대와 개인의 나침반으로서 올바른 질문을 던지고
													새로운 해결책을 찾아나갈 것이다. [작품 소개] 모차르트 최후의 오페라인 <마술피리>는 화려한
													이탈리아 오페라와 독일의 소박한 전통 민중극 징슈필, 익살스러운 민요, 진지한 종교음악이 모두 섞여 있는
													종합선물 세트와 같다. 마법 오페라, 화려한 무대 효과를 사용한 코미디, 슈퍼 히어로 만화 같은 오페라 등
													다양한 수식어로 표현되는 만큼 오페라 역사에 있어서 다른 어떤 작품보다 자주 공연되고 회자되는 오페라다.
													민속적 요소, 프리메이슨 이념, 계몽사상 등 다양한 소재가 결합되어 현대적 매력과 고대의 신비로움을 모두
													내포하고 있다. 이 서사의 힘은 모차르트와 대본가 쉬카네더의 천부적인 풍부함과 상상력에서 나온다. 선과
													악을 나누는 이분법적 사고에서 벗어난 이야기 구조, 유기적으로 엮이는 등장인물의 관계와 다양한 음악적
													장르가 혼합되어 모차르트 사상이 집약된 작품이라고 할 수 있다. [시놉시스] 밤의 여왕은 이집트 왕자
													타미노에게 마술피리를 건네며 폭군에게 납치된 여왕의 딸 파미나를 구해달라고 부탁한다. 타미노는 새잡이
													파파게노와 함께 파미나 공주를 구하러 떠난다. 그리고 여왕은 밤중에 파미나를 찾아가 자라스트로를 죽이라고
													명령하지만 실패하고, 타미노는 자라스트로가 폭군이 아닌 의로운 철학자라는 사실을 알게 된다. 타미노가
													철학자 세계의 일원이 되기 위해 침묵 수행을 하고 이후 공주도 함께 물과 불의 시험을
													통과하는데&hellip; [제작] - 작곡: 볼프강 아마데우스 모차르트 Wolfgang Amadeus
													Mozart - 대본: 에마누엘 쉬카네더 Emanuel Schikaneder - 원작: 크리스토프 빌란트
													Christoph Martin Wieland - 연주: 빈 필하모닉 Vienna Philharmonic
													Orchestra - 무대 연출: 리디아 슈타이어 Lydia Steier - 장소: 잘츠부르크 대축전극장
													Gro&szlig;es Festspielhaus, Salzburg [출연] - 지휘 요아나 말비츠
													Joana Mallwitz - 자라스트로 Sarastro, 타레크 나즈미 Tareq Nazmi - 타미노
													Tamino, 마우로 피터 Mauro Peter - 밤의 여왕 The Queen of the Night,
													브렌다 래 Brenda Rae / 자스민 델프스 Jasmin Delfs - 파미나 Pamina, 레굴라
													뮐레만 Regula M&uuml;hlemann - 파파게노 Papageno, 미카엘 나글 Michael
													Nagl - 파파게나 Papagena, 마리아 나자로바 Maria Nazarova 
												</p>
										</a></li>
										<li><a href="javascript:gfn_moveDetail('22041100');"
											title="영화상세 보기">
												<p class="bage classic">클래식소사이어티</p>
												<div class="img">
													<img
														src="https://img.megabox.co.kr/SharedImg/2022/08/04/ZTybYDxIm1jRYjT2y18CrXMaMqvAWAd5_230.jpg"
														alt="[2022 잘츠부르크 페스티벌] 바렌보임&amp;랑랑 콘서트"
														onerror="this.src='${path }/resources/images/bg-noimage-main.png'" />
												</div>

												<p class="tit">[2022 잘츠부르크 페스티벌] 바렌보임&amp;랑랑 콘서트</p>

												<p class="summary">스크린으로 만나는 지상 최대 클래식 페스티벌, 그 두번째 무대
													모차르트의 고향, 잘츠부르크에서 열리는 지휘자 다니엘 바렌보임 & 피아니스트 랑랑 콘서트 [공연 정보] -
													공연 명칭 : 2022 잘츠부르크 페스티벌 &ndash; 바렌보임&랑랑 콘서트 - 상영 일시 : 2022년
													8월 14일(일) 19:00 * 딜레이 중계 - 예매 오픈 : 2022년 7월 19일(화) 13:00 -
													공연 시간 : 약 120분 / 인터미션 없음 *** 본 상영은 위성 중계 상영작으로, 음향 및 화질이
													고르지 못할 수 있습니다. *** 현지 공연 사정 및 중계 상황에 따라 프로그램 및 러닝타임이 변경될 수
													있습니다. *** 본 상영은 클래식음악 공연으로 자막이 제공되지 않습니다. [페스티벌 소개] 1920년부터
													시작한 잘츠부르크 페스티벌은 매년 여름 모차르트의 고향 오스트리아 잘츠부르크에서 열리는 세계적인 클래식
													음악 축제이다. 오페라, 연극, 콘서트 등 명실공히 세계 최고의 수준을 자랑하는 연주자와 프로덕션이 모여
													높은 인기를 자랑할 뿐 아니라 매해 음악계의 판도를 가늠하는 자리이기도 하다. 올해 102번째 시즌을 맞은
													잘츠부르크 페스티벌은 불확실한 세계 속 예술의 역할에 대해 논의한다. 다양한 프로그램과 예술가들, 그리고
													관객들을 통해 완성되는 축제는 시대와 개인의 나침반으로서 올바른 질문을 던지고 새로운 해결책을 찾아나갈
													것이다. [작품소개] 다니엘 바렌보임은 고전주의와 낭만주의 음악을 아우르는 폭넓은 레퍼토리의 권위자로,
													서동시집 오케스트라를 창단한 지휘자이자 피아니스트이다. 정확하고 유려한 테크닉을 보여주는 피아니스트 랑랑은
													각 나라의 정체성이 담긴 음악에 관심이 많은 연주자로 발매 앨범에 한국의 &lsquo;아리랑&rsquo;을
													수록하기도 하였다. 올해 페스티벌에서는 스페인 색채가 가득한 연주 프로그램으로 구성되어 잘츠부르크의 여름에
													활기를 더한다. [제작 및 출연] - 지휘: 다니엘 바렌보임 Daniel Barenboim - 오케스트라:
													서동시집 오케스트라 West-Eastern Divan Orchestra - 피아노: 랑랑 Lang Lang
													- 장소: 잘츠부르크 대축전극장 Grosses Festspielhaus [프로그램] - 모리스 라벨,
													스페인 광시곡 MAURICE RAVEL, Rapsodie espagnole for orchestra -
													마누엘 데 파야, 스페인 정원의 밤 MANUEL DE FALLA, Noches en los jardines
													de Espa&ntilde;a &ndash; Symphonic impressions for piano
													and orchestra - 클로드 드뷔시, 관현악을 위한 영상 &lsquo;이베리아&rsquo;
													CLAUDE DEBUSSY, &lsquo;Ib&eacute;ria&rsquo; from Images
													pour orchestre - 모리스 라벨, 볼레로 MAURICE RAVEL, Bol&eacute;ro</p>
										</a></li>
									</ul>

								</div>
								<!--// list-area -->

							</div>
							<!--// curation-area -->
						</div>
					</div>
					<!--// section main-curation : 큐레이션 -->

					<!-- section main-info : 메가박스 안내 -->
					<div id="main_section04" class="section main-info">

						<h2 class="tit">메가박스 안내</h2>

						<div class="swiper-container info-special">
							<div class="swiper-wrapper">
								<div class="swiper-slide special-cell">
									<a href="/specialtheater/dolby" title="DOLBY CINEMA 페이지로 이동"
										class="bg-dolby">DOLBY CINEMA</a>
								</div>
								<div class="swiper-slide special-cell">
									<a href="/specialtheater/boutique/private"
										title="THE BOUTIQUE PRIVATE 페이지로 이동" class="bg-private">THE
										BOUTIQUE PRIVATE</a>
								</div>
								<div class="swiper-slide special-cell">
									<a href="/specialtheater/boutique" title="THE BOUTIQUE 페이지로 이동"
										class="bg-boutique">THE BOUTIQUE</a>
								</div>
								<div class="swiper-slide special-cell">
									<a href="/specialtheater/mx" title="MX 페이지로 이동" class="bg-mx">MX</a>
								</div>
								<div class="swiper-slide special-cell">
									<a href="/specialtheater/comfort" title="COMFORT 페이지로 이동"
										class="bg-comfort">COMFORT</a>
								</div>
								<div class="swiper-slide special-cell">
									<a href="/specialtheater/puppy" title="PUPPY CINEMA 페이지로 이동"
										class="bg-puppy new">PUPPY CINEMA</a>
								</div>
								<div class="swiper-slide special-cell">
									<a href="/specialtheater/megakids" title="MEGABOX KIDS 페이지로 이동"
										class="bg-kids">MEGABOX KIDS</a>
								</div>
							</div>
						</div>

						<div class="special-control">
							<button type="button" class="special-prev"></button>
							<button type="button" class="special-next"></button>
						</div>
						<!-- info-notice -->
						<div class="info-notice">
							<div class="wrap">
								<p class="tit">지점</p>
								<p class="link">
									<a href="/support/notice/detail?artiNo=10647&bbsNo=9"
										title="공지사항 상세보기"> <strong> [고양스타필드] </strong> [고양스타필드] 8월
										10일 &#40;수&#41; 전기 안전검사실시 안내
									</a>
								</p>

								<p class="date">2022.08.05</p>

								<p class="more">
									<a href="/support/notice" title="전체공지 더보기">더보기 <i
										class="iconset ico-arr-right-gray"></i></a>
								</p>
							</div>
						</div>
						<!--// info-notice -->

						<!-- info-link -->
						<div class="info-link">
							<div class="table">
								<div class="cell">
									<a href="/support" title="고객센터 페이지로 이동"> <i
										class="iconset ico-main-customer"></i> <span>고객센터</span>
									</a>
								</div>

								<div class="cell">
									<a href="/support/faq" title="자주 묻는 질문 페이지로 이동"> <i
										class="iconset ico-main-faq"></i> <span>자주 묻는 질문</span>
									</a>
								</div>

								<div class="cell">
									<a href="/support/inquiry" title="1:1 문의 페이지로 이동"> <i
										class="iconset ico-main-qna"></i> <span>1:1 문의</span>
									</a>
								</div>

								<div class="cell">
									<a href="/support/rent" title="단체/대관문의 페이지로 이동"> <i
										class="iconset ico-main-group"></i> <span>단체/대관문의</span>
									</a>
								</div>

								<div class="cell">
									<a href="/support/lost" title="분실물 문의/접수 페이지로 이동"> <i
										class="iconset ico-main-lost"></i> <span>분실물 문의/접수</span>
									</a>
								</div>

								<div class="cell">
									<a href="/booking/privatebooking"
										title="더 부티크 프라이빗 대관예매 페이지로 이동"> <i
										class="iconset ico-main-boutique"></i> <span>더 부티크 프라이빗<br />대관예매
									</span>
									</a>
								</div>
							</div>
						</div>
						<!--// info-link -->
					</div>
					<!--// section main-info : 메가박스 안내 -->

					<!-- main-bottom-ad : 메인 하단 광고 영역 -->
					<div class="main-bottom-ad">
						<script data-id="K3I6ffWoQiqG93YqqRV0LA"
							name="megabox_p/main/main@main_bottom_1100x227?mlink=342"
							src="//cast.imp.joins.com/persona.js" async></script>
					</div>
					<!--// main-bottom-ad : 메인 하단 광고 영역 -->
				</div>
			</div>
			<!--// contents -->

		</div>
		<!--// container -->

		<!-- 		</div> -->




		<section id="saw_movie_regi" class="modal-layer">
			<input type="hidden" id="isLogin" />
			<div class="wrap">
				<header class="layer-header">
					<h3 class="tit">본 영화 등록</h3>
				</header>

				<div class="layer-con">
					<p class="reset">발권하신 티켓 하단의 거래번호 또는 예매번호를 입력해주세요.</p>

					<div class="pop-gray mt10 mb30">
						<label for="movie_regi" class="mr10">거래번호 또는 예매번호</label> <input
							type="text" id="movie_regi" class="input-text w280px numType"
							maxlength="20" placeholder="숫자만 입력해 주세요" title="티켓 거래번호 입력" />
						<button class="button gray ml05" id="regBtn">등록</button>
					</div>

					<div class="box-border v1 mt30">
						<p class="tit-box">이용안내</p>

						<ul class="dot-list">
							<li>극장에서 예매하신 내역을 본 영화(관람이력)로 등록하실 수 있습니다.</li>
							<li>예매처를 통해 예매하신 고객님은 극장에서 발권하신 티켓 하단의 온라인 예매번호 <BR>12자리를
								입력해주세요.(Yes24, 네이버, 인터파크, SKT, KT, 다음)
							</li>
							<li>본 영화 등록은 관람인원수 만큼 등록가능하며, 동일 계정에 중복등록은 불가합니다.</li>
							<li>상영시간 종료 이후 등록 가능합니다.</li>
							<li>본 영화로 수동 등록한 내역은 이벤트 참여 및 포인트 추후 적립이 불가합니다.</li>
						</ul>
					</div>
				</div>

				<div class="btn-group-fixed">
					<button type="button" class="button purple close-layer">닫기</button>
				</div>

				<button type="button" class="btn-modal-close">레이어 닫기</button>
			</div>
		</section>

		<div class="quick-area">
			<a href="" class="btn-go-top" title="top">top</a>
		</div>

		<!-- footer -->
		<footer id="footer">
			<!-- footer-top -->
			<div class="footer-top">
				<div class="inner-wrap">
					<ul class="fnb">
						<li><a href="/megaboxinfo" title="회사소개 페이지로 이동">회사소개</a></li>
						<li><a href="/recruit" title="인재채용 페이지로 이동">인재채용</a></li>
						<li><a href="/socialcontribution" title="사회공헌 페이지로 이동">사회공헌</a></li>
						<li><a href="#top" title="제휴/광고/부대사업문의 페이지로 이동">제휴/광고/부대사업문의</a></li>
						<li><a href="/support/terms" title="이용약관 페이지로 이동">이용약관</a></li>
						<li><a href="/support/lcinfo" title="위치기반서비스 이용약관 페이지로 이동">위치기반서비스
								이용약관</a></li>
						<li class="privacy"><a href="/support/privacy"
							title="개인정보처리방침 페이지로 이동">개인정보처리방침</a></li>
						<li><a href="https://jebo.joonganggroup.com/main.do"
							target="_blank" title="윤리경영 페이지로 이동">윤리경영</a></li>
					</ul>

					<a href="#layer_looking_theater" class="btn-looking-theater"
						title="극장찾기"><i class="iconset ico-footer-search"></i> 극장찾기</a>
				</div>
			</div>
			<!--// footer-top -->

			<!-- footer-bottom -->
			<div class="footer-bottom">
				<div class="inner-wrap">
					<div class="ci">MEGABOX : Life Theater</div>

					<div class="footer-info">
						<div>
							<address>서울특별시 마포구 월드컵로 240, 지상2층(성산동, 월드컵주경기장)</address>
							<p>ARS 1544-0070</p>
						</div>
						<p>대표자명 홍정인</p>
						<p>&middot; 개인정보보호책임자 공성진</p>
						<p>&middot; 사업자등록번호 211-86-59478</p>
						<p>&middot; 통신판매업신고번호 제 2020-서울마포-4545 호</p>
						<p class="copy">COPYRIGHT &copy; MegaboxJoongAng, Inc. All
							rights reserved</p>
					</div>

					<div class="footer-sns">
						<a href="https://www.youtube.com/onmegabox" target="_blank"
							title="MEGABOX 유튜브 페이지로 이동"><i class="iconset ico-youtubeN">유튜브</i></a>
						<a href="http://instagram.com/megaboxon" target="_blank"
							title="MEGABOX 인스타그램 페이지로 이동"><i
							class="iconset ico-instagramN">인스타그램</i></a> <a
							href="https://www.facebook.com/megaboxon" target="_blank"
							title="MEGABOX 페이스북 페이지로 이동"><i class="iconset ico-facebookN">페이스북</i></a>
						<a href="https://twitter.com/megaboxon" target="_blank"
							title="MEGABOX 트위터 페이지로 이동"><i class="iconset ico-twitterN">트위터</i></a>
					</div>
				</div>
			</div>
			<!--// footer-bottom -->
			<div id="layer_looking_theater" class="layer-looking-theater"></div>
		</footer>
		<!--// footer -->

		<!-- 모바일 때만 출력 -->
		<div class="go-mobile">
			<a href="#" data-url="https://m.megabox.co.kr">모바일웹으로 보기 <i
				class="iconset ico-go-mobile"></i></a>
		</div>
	</div>
	<form id="mainForm"></form>
</body>
</html>