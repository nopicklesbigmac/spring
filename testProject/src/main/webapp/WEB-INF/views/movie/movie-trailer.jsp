<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html lang="ko">
<!--<![endif]-->
<head>

<link rel="shortcut icon" href="/static/pc/images/favicon.ico">







<title>${movie.m_name}  주요정보 &lt; 영화 | MEET PLAY SHARE, 메가박스</title>
		<link rel="stylesheet" type="text/css"
			href="${path}/resources/css/style.css">
<link rel="stylesheet" href="${path}/resources/css/megabox.min.css"
	media="all">
<!-- Global site tag (gtag.js) - Google Analytics -->
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async=""
	src="https://www.googletagmanager.com/gtag/js?id=G-LKZN3J8B1J&amp;l=dataLayer&amp;cx=c"></script>
<script async=""
	src="https://www.googletagmanager.com/gtag/js?id=UA-30006739-3"></script>
<script>window.dataLayer = window.dataLayer || []; function gtag(){dataLayer.push(arguments);} gtag('js', new Date()); gtag('config', 'UA-30006739-3');</script>

<script src="${path}/resources/js/megabox.api.min.js"></script>
<script src="${path}/resources/js/lozad.min.js"></script>
<script src="${path}/resources/js/megabox.common.min.js"></script>
<script src="${path}/resources/js/megabox.netfunnel.min.js"></script>
<script src="${path}/resources/js/persona.js" async=""></script>
<script src="${path}/resources/js/ui.common.js"></script>
<script src="${path}/resources/js/front.js"></script>
<script src="${path}/resources/js/hmac-sha256.js"></script>
<script src="${path}/resources/js/enc-base64-min.js"></script>
<script src="${path}/resources/js/megabox-simpleBokd.js"></script>

					<script src="/js/Chart.js"></script>
					<script src="/js/utils.js"></script>
					<script src="/js/analyser.js"></script>

<script type="text/javascript">

  		
  		var reset = ''

  		if( reset == 'Y' || location.pathname == '/booking' ){
  			history.replaceState('','',location.href);
  		}

        var _init = {
            cache	: Date.now(),
            path	: '/static/pc/js/'
        };

        document.write(
            '<script src="'+_init.path+'ui.common.js?v='+_init.cache+'"><\/script>'+
            '<script src="'+_init.path+'front.js?v='+_init.cache+'"><\/script>'
        );

        //RedirectException 발생시 메시지 처리
        

        //링크 구분에 따라 url 이동을 한다.
        function fn_goMoveLink(link_gbn, link_url) {
            alert("준비중 입니다");
            return;
        }
    </script>

<script
	src="//cast.imp.joins.com/head/jPfCCh8tg1_Ef0ws5eBgkXfnqZnnRiRBtc-1kUGVmrmEAM4qWzAZAbZXeTd0VUJUOFJtV3JVWGlQbEZqaE5BAstB2Lie5Z8K6wPLQdi4nuWfCus.js?url=https%3A%2F%2Fwww.megabox.co.kr%2Fmovie-detail%3FrpstMovieNo%3D21084100&amp;ref=https%3A%2F%2Fwww.megabox.co.kr%2Fmovie"></script>
<style type="text/css">/* Chart.js */
/*
 * DOM element rendering detection
 * https://davidwalsh.name/detect-node-insertion
 */
@
keyframes chartjs-render-animation {from { opacity:0.99;
	
}

to {
	opacity: 1;
}

}
.chartjs-render-monitor {
	animation: chartjs-render-animation 0.001s;
}

/*
 * DOM element resizing detection
 * https://github.com/marcj/css-element-queries
 */
.chartjs-size-monitor, .chartjs-size-monitor-expand,
	.chartjs-size-monitor-shrink {
	position: absolute;
	direction: ltr;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	overflow: hidden;
	pointer-events: none;
	visibility: hidden;
	z-index: -1;
}

.chartjs-size-monitor-expand>div {
	position: absolute;
	width: 1000000px;
	height: 1000000px;
	left: 0;
	top: 0;
}

.chartjs-size-monitor-shrink>div {
	position: absolute;
	width: 200%;
	height: 200%;
	left: 0;
	top: 0;
}
</style>
</head>

<body class="vsc-initialized">

	<div class="skip" title="스킵 네비게이션">
		<a href="#contents" title="본문 바로가기">본문 바로가기</a> <a href="#footer"
			title="푸터 바로가기">푸터 바로가기</a>
	</div>

	<div class="body-wrap">









		<!--  ko_KR -->

		<!-- <script async defer src="https://connect.facebook.net/en_US/sdk.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script> -->

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

$(function(){
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


//패스워드 3개월 초과시 다음에 하기 버튼 누를경우 비밀번호 변경일자 오늘날자로 셋팅
//비번 재설정은 3개월 미변경시, 변경 안하면 로그인 할때마다 alert 나옴 20190507
function fn_updatePwdUptDt(sLoginId){
	var paramData = { loginId:sLoginId };
	$.ajaxMegaBox({
		url: "/on/oh/ohg/MbLogin/updateMbPwdReSet.rest",
		type: "POST",
		contentType: "application/json;charset=UTF-8",
		dataType: "json",
		data: JSON.stringify(paramData),
		success: function (data, textStatus, jqXHR) {
			//메인 화면으로 이동
			$(location).attr('href','/main');
		},
		error: function(xhr,status,error){
			var err = JSON.parse(xhr.responseText);
			alert(xhr.status);
			alert(err.message);
		}
	});
}

// 광고 쿠키 싱크 전달
function fn_adSetCookie(adMap){

	var adUrl = "https://ad.imp.joins.com/setcookie/megabox?gender=" + adMap.gender + "&birthday=" + adMap.birthday + "&genre=" + adMap.genre + "&theater=" + adMap.theater;
	if (document.domain.indexOf('t-') == -1){
		$.ajax({
			type: "get"
			, url: adUrl
			, data: ""
			, async : false
			, success: function(result) {
			console.log(result);
			}
			, error: function(err) {
			  console.log('error : ' + err.status);
			}
		});
	}

}

//로그인
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
		url: "/on/oh/ohg/MbLogin/selectMbLoginInfo.rest",
		data: JSON.stringify(paramData),
		//async: false,
		success: function (data, textStatus, jqXHR) {
			var revStr                 = data.revStr;
			var redisKey               = data.redisKey;
			var pwdErrCnt              = data.pwdErrCnt+1;
			var loginPwdLstUptDt       = data.loginPwdLstUptDt;
			var pwdUptDayco            = data.pwdUptDayco;
			var menuId                 = data.menuId;
			var mappingId              = data.mappingId;
			var marketRcvStr           = data.marketRcvStr
			var loginIdStar            = data.loginIdStar;

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
				gfn_alertMsgBoxSize('아이디 또는 비밀번호가 맞지 않습니다.\n로그인 정보를 다시 확인바랍니다.',400,250);	//msg.ch.ohg.ME031=아이디 또는 비밀번호가 맞지 않습니다.\\n로그인 정보를 다시 확인바랍니다.
				$("#btnLogin").attr("disabled", true);	//버튼비활성화
				sValidateLoginPwdAt ='N';
				return;
			}

		    if(typeof loginPopupCallScn === "undefined"){
		    	loginPopupCallScn = "";
		    }
// 		    console.log("this : "+loginPopupCallScn);
			//화면이동

			// 로그인시도 시 메가박스 쿠키싱크 전달
			fn_adSetCookie(data.adMap);
			if(menuId != "" && menuId != null){  //화면으로 띄웠을떄
				fn_mvPage(mappingId);
				return;
			}
			else {

				fn_loginSuccessEvent();

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

	function fn_loginSuccessEvent(){

		var bokdLoginAt = $('#loginForm input[name=bokdLoginAt]').val();
		var reloadYn = $('#loginForm input[name=reloadYn]').val();
		var validDataRevisnYn = $('#loginForm input[name=validDataRevisnYn]').val();				//데이터 보정 여부

		if(bokdLoginAt == "Y"){
			//예매로그인일경우
			//오입력값을 체크한다.
			$('.before').hide();
			$('.after').show();
			$('.after .notice').show();
			$('#layer_login_select button.btn-modal-close').trigger("click");
			fn_validDataRevisn(JSON.parse($('#loginForm input[name=bokdLoginParam]').val()));
		}
		else {
			if (reloadYn == "N") {

				$('.before').hide();
				$('.after').show();
				$('.after .notice').show();
				$('#layer_login_select button.btn-modal-close').trigger("click");
				if(validDataRevisnYn == "Y"){
					fn_validDataRevisn();
				}
			} else {

				//화면 리로드
				//location.reload();
				//post submit시 브라우저 경고창 관련
				window.document.location.href = window.document.URL;


				////////////////////////////////////////////
				// TODO 빵원쿠폰일 경우에만 처리되도록 수정 //
                ////////////////////////////////////////////
                $(".btn-modal-close").click();
                ////////////////////////////////////////////
                ////////////////////////////////////////////
			}
		}

		if (callback) {
			try {
				callback();
			} catch (e) {
				console.error(e);
			}
		}
	}

	//페이지 이동 submit
	function fn_mvPage(page){
// 		console.log("MbLoginScriptDV.fn_mvPage : "+page);

		var rtnParam = $("#loginForm [name=rtnParam]").val();

		if (rtnParam.trim() != ""){

			var arr;
			var html = '<input type="hidden" name="#1" value="#2" />';

			$.each(rtnParam.split(','), function(i, val){

				arr = val.split(':');
				arr[0] = arr[0].trim();
				arr[1] = arr[1].trim();
				arr[2] = '[name='+arr[0]+']';

				if ($("#loginForm").find(arr[2]).length > 0) {
					$("#loginForm").find(arr[2]).val(arr[1]);
				} else {
					$("#loginForm").append(html.replace('#1', arr[0]).replace('#2', arr[1]));
				}
			});
		}

		$("#loginForm").attr("method","post");
		$("#loginForm").attr("action",page);
		$("#loginForm input[name=preUrl]").val(document.location.pathname)
		$("#loginForm").submit();
	}
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

function fn_adTracking(url){
	$.ajax({
        type: "get"
        , url: url
        , data: ""
        , dataType: "json"
        , success: function(result) {

        }
        , error: function(err) {
            console.log('fn_adEventCall error : ' + err.status);
        }
    });
}

var callback = undefined;

/*호출 화면에 따른 분기처리*/
function fn_viewLoginPopup(viewId,deviceType,bokdLoginAt,bokdLoginParam,reloadYn,callbackFn){

  	//로그인 폼 호출시 광고영역 노출
    if( $("#Rw6jtk0hQTuOBSzFbvGGlw").html() == "" ){

    	$("#Rw6jtk0hQTuOBSzFbvGGlw").append('<a href="" target="_blank"><img id="pageBannerRnbImage" src="/static/pc/images/common/bg/bg-noimage-main.png" /></a>');

    	var header ={"typ": "JWT","alg": "HS256"}
        var data = {
            "device": {"devicetype": 2},
            "imp": [{"native": {"ext" : {"slots" : 1}}}],
            "site": {"name": "megabox"},
            "id": ""
        };
    	var secret = "Rw6jtk0hQTuOBSzFbvGGlw";

    	var stringifiedHeader = CryptoJS.enc.Utf8.parse(JSON.stringify(header));
        var encodedHeader = base64url(stringifiedHeader);
        var stringifiedData = CryptoJS.enc.Utf8.parse(JSON.stringify(data));
        var encodedData = base64url(stringifiedData);
        var signature = encodedHeader + "." + encodedData;
        signature = CryptoJS.HmacSHA256(signature, secret);
        signature = base64url(signature);
        var pram = encodedHeader+"."+encodedData+"."+signature;
        var adUrl = "https://cast.imp.joins.com/bid/"+secret+"/"+pram; //상용

    	$.ajax({
            type: "get"
            , url: adUrl
            , data: ""
            , success: function(result) {
                if(result) {
                    $("#pageBannerRnbImage").attr("src", result.image_file);
                    $("#pageBannerRnbImage").attr("alt", result.alternative_text);
                    $("#pageBannerRnbImage").attr("clickThrough", result.click_tracking);
                    $("#pageBannerRnbImage").parent().attr("href", result.click_through);



                    $("#pageBannerRnbImage").css("height", result.height);
                    $("#Rw6jtk0hQTuOBSzFbvGGlw").css("background-color", result.bgcolor);
                    fn_adTracking(result.impression_tracking);
                }
            }
            , error: function(err) {
                console.log('fn_getBannerAd error : ' + err.status);
            }
        });

    	//광고링크
   	    $("#pageBannerRnbImage").on("click", function() {
   	        var clickThrough = $(this).attr("clickThrough");
   	        if(clickThrough != undefined && clickThrough != '') {
   	        	fn_adTracking(clickThrough);
   	        }
   	    });
    }

	//
	$(".alert").html("");
	if(sCookieVal == ""){	//아이디 저장 체크 안했을경우
		$(".login-input-area #ibxLoginId").val("");			//아이디
	}
	$(".login-input-area #ibxLoginPwd").val("");		//비밀번호
	$(".no-member-login-table #ibxNonMbNm").val("");	//비회원 이름
	$(".no-member-login-table #ibxNonMbByymmdd").val("");	//비회원 생년월일
	$(".no-member-login-table #ibxNonMbTelno").val("");		//비회원 휴대폰 번호
	$(".no-member-login-table #mblpCharCertNo").val("");	//비회원 휴대폰인증번호
	$(".no-member-login-table #ibxNonMbPwd").val("");		//비회원 비밀번호
	$(".no-member-login-table #ibxNonMbPwdConfirm").val("");	//비회원 비밀번호확인
	$("input[name=chkNonMbBokdPersonInfoProc]").prop("checked",false);	//비회원 라디오버튼 해제
	if(typeof AuthTimer != 'undefined'){
	    AuthTimer.fnStop();
	    $('#timer').html("3:00");
	    $('#nonMbCertNoSend').html("인증요청");
	    sValidateMblpCertNoSuccess = "N";
	    $('#nonMbCertRow').show();
	    $('#mblpCharCertNo').val("");
	    $("#nonMbCertNoSend").removeClass("disabled");
	    $("#nonMbCertNoSend").attr("disabled", false);
	}
	fn_validateNonMbInputVal();

	$('#loginForm input[name=bokdLoginAt]').val("");				//예매 로그인 여부
	$('#loginForm input[name=bokdLoginParam]').val("");				//예매 로그인 파라메타
	$('#loginForm input[name=validDataRevisnYn]').val("");				//데이터 보정 여부
	fn_validateInputVal();

	if('pc' == deviceType){

		if('SimpleBokdM' == viewId) {
			var sBokdLoginAt = typeof bokdLoginAt == 'undefined' ? "" : bokdLoginAt;//예매 로그인 여부
			$('#layer_login_select .layer-con .tab-list').show();			//로그인 비회원로그인 선택창
			$('#layer_login_select .layer-con .tab-cont-wrap .login-member').removeClass('pt00');	//레이어 사이즈 줄임
			$("#loginPupupATag").attr("h-data",'556');	//높이값 변경
			$("#loginPupupATag").trigger("click");	//레이어띄움
			$('#loginForm input[name=bokdLoginAt]').attr('value',sBokdLoginAt);			//예매 로그인 여부 값 설정
			$('#loginForm input[name=bokdLoginParam]').attr('value',bokdLoginParam);	//예매 로그인 파라메타
			if(bokdLoginAt == "Y"){
				$('#loginForm input[name=nonMbCertRedisKey]').val("");
				$('#loginForm input[name=nonMbCertedMblpNo]').val("");
			}

		}
		else if('StoreDtlV' == viewId || 'MySbscDtlsL' == viewId) {
			$("#loginPupupATag").trigger("click");	//레이어띄움
			$("#mbPopLayer").show();		//회원 레이어
			$("#nonMbLogoLayer").hide();	//비회원 로고
			$("#nonMbPopLayer").hide();		//비회원 레이어
			$("#mbMbChoiLayer").hide();	//회원 비회원 선택

			$("#nonMbBokdCnfm").attr("style","display:none");
		}
		else if('BoutiqPrivateL' == viewId){	//부티크
			$('#layer_login_select .layer-con .tab-list li:eq(0) a').trigger("click");	//회원로그인만 클릭되도록
			$('#layer_login_select .layer-con .tab-list').hide();						//로그인 비회원로그인 선택창
			$('#layer_login_select .layer-con .tab-cont-wrap .login-member').addClass('pt00');	//레이어 사이즈 줄임
			$("#loginPupupATag").attr("h-data",'484');	//높이값 변경
			$("#loginPupupATag").trigger("click");	//레이어띄움

			$('#loginForm input[name=reloadYn]').attr('value',reloadYn); // 화면 리로드 설정
			$('#loginForm input[name=validDataRevisnYn]').val("Y");				//데이터 보정 여callbackFn부
		}
		else {
			var sReloadYn = typeof reloadYn == 'undefined' ? "" : reloadYn;// 화면 리로드 여부
			$('#layer_login_select .layer-con .tab-list li:eq(0) a').trigger("click");	//회원로그인만 클릭되도록
			$('#layer_login_select .layer-con .tab-list').hide();						//로그인 비회원로그인 선택창
			$('#layer_login_select .layer-con .tab-cont-wrap .login-member').addClass('pt00');	//레이어 사이즈 줄임
			$("#loginPupupATag").attr("h-data",'484');	//높이값 변경
			$("#loginPupupATag").trigger("click");	//레이어띄움

			$('#loginForm input[name=reloadYn]').attr('value',sReloadYn); // 화면 리로드 설정
		}

		callback = callbackFn;
	}
}

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


function $ComTimer(){
    //prototype extend
}

$ComTimer.prototype = {
    comSecond : ""
    , fnCallback : function(){}
    , timer : ""
    , domId : ""
    , fnTimer : function(){
        var m = Math.floor(this.comSecond / 60) + ":" + String((this.comSecond % 60)).lpad(2,"0");	// 남은 시간 계산
        this.comSecond--;					// 1초씩 감소
        this.domId.innerText = m;
        if (this.comSecond < 0) {			// 시간이 종료 되었으면..
            clearInterval(this.timer);		// 타이머 해제
            $('#nonMbCert-error-text').text('인증시간이 만료되었습니다. 인증번호를 재전송 후 입력바랍니다.');	//msg.ch.ohg.ME061	인증시간이 만료되었습니다. 인증번호를 재전송 후 입력바랍니다.
            $("#btnMblpCharCert").attr("disabled", true);	//인증확인버튼 비활성
			$("#btnMblpCharCert").addClass("disabled");		//인증확인버튼 비활성
        }
    }
    ,fnStop : function(){
        clearInterval(this.timer);
    }
}

</script>
		<script type="text/javascript">
var simpleLoginWithPopup;
var simpleLoginWith = function(lnkgTy){
    var url = "/on/oc/ocz/SimpleLogin/simpleLogin.do?lnkgTy=" + lnkgTy;
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
			<input type="hidden" name="redisKey" value=""> <input
				type="hidden" name="menuId" value=""> <input type="hidden"
				name="mappingId" value=""> <input type="hidden"
				name="rtnParam" value=""> <input type="hidden"
				name="certType" value=""> <input type="hidden" name="preUrl"
				value="">

			<!-- 좌석도 로그인 프로세스 여부PARAM-->
			<input type="hidden" name="bokdLoginAt" value=""> <input
				type="hidden" name="bokdLoginParam" value=""> <input
				type="hidden" name="nonMbCertRedisKey" value=""> <input
				type="hidden" name="nonMbCertedMblpNo" value=""> <input
				type="hidden" name="reloadYn" value=""> <input type="hidden"
				name="validDataRevisnYn" value="N">

		</form>







		<!--  ko_KR -->

		<!-- 로그인 레이어팝업 시작 -->
		<!-- 화면ID  M-ME-LO-01 -->
		<!-- 화면ID  M-ME-CC-01 -->
		<div style="display: none;">
			<a id="loginPupupATag" href="#layer_login_select"
				class="button active btn-modal-open" w-data="850" h-data="484"></a>
		</div>

		<section id="layer_login_select" class="modal-layer"
			style="z-index: 501;">
			<a href="" class="focus">레이어로 포커스 이동 됨</a><a href="#" class="focus"
				title="레이어로 포커스 이동 됨">레이어로 포커스 이동 됨<!--레이어로 포커스 이동 됨--></a>
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
							<a href="" class="ir"></a><a href="" class="ir" title="로그인"></a>

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
															href="https://www.sepay.org/spm/join?regSiteCode=XF&amp;ctgCode=1&amp;subCode=1"
															title="휴대폰 간편 로그인 선택" target="_blank"><span>휴대폰
																간편로그인<!--휴대폰 간편로그인-->
														</span> <em>광고<!--광고--></em></a>
													</div>
												</div>
											</div>
											<!--// chk-util -->

											<button id="btnLogin" type="button"
												class="button purple large btn-login" disabled="disabled">
												로그인
												<!--로그인-->
											</button>

											<div class="link">
												<a href="/user-find" title="ID/PW 찾기 선택">ID/PW 찾기<!--ID/PW 찾기--></a>
												<a href="/join" title="회원가입 선택">회원가입<!--회원가입--></a> <a
													href="/on/oh/ohg/MbLogin/viewNonMbLogin.rest"
													title="비회원 예매확인 선택">비회원 예매확인<!--비회원 예매확인--></a>
											</div>

											<div class="sns-login">
												<a href="javaScript:void(0)" lnkgty="FACEBOOK"
													title="페이스북으로 로그인 선택"><img
													src="../../../static/pc/images/member/ico-facebook.png"
													alt="페이스북">
												<!--페이스북--> 페이스북으로 로그인<!--페이스북으로 로그인--></a> <a
													href="javaScript:void(0)" lnkgty="NAVER"
													title="네이버로 로그인 선택"><img
													src="../../../static/pc/images/member/ico-naver.png"
													alt="네이버">
												<!--네이버--> 네이버로 로그인<!--네이버로 로그인--></a> <a
													href="javaScript:void(0)" lnkgty="KAKAO"
													title="카카오톡으로 로그인 선택"><img
													src="../../../static/pc/images/member/ico-kakao.png"
													alt="카카오톡">
												<!--카카오톡--> 카카오톡으로 로그인<!--카카오톡으로 로그인--></a> <a
													href="javaScript:void(0)" lnkgty="PAYCO"
													title="페이코로 로그인 선택"><img
													src="../../../static/pc/images/member/ico-payco.png"
													alt="페이코">
												<!--페이코--> 페이코로 로그인<!--페이코로 로그인--></a>
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
							<a href="" class="ir"></a><a href="" class="ir" title="비회원 로그인"></a>

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
															placeholder="이름" class="input-text">
														<!--이름--></td>
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
															class="input-text">
														<!--비밀번호(숫자 4자리)--></td>
													</tr>
													<tr>
														<th scope="row"><label for="ibxNonMbPwdConfirm">비밀번호<!--비밀번호-->확인<!--확인--></label>
														</th>
														<td><input maxlength="4" id="ibxNonMbPwdConfirm"
															type="password" placeholder="비밀번호(숫자 4자리) 확인"
															class="input-text">
														<!--비밀번호(숫자 4자리) 확인-->
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
													<dd class="ismsimp">관람 또는 취소 후 7일 이내</dd>
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
										class="button purple" disabled="disabled">확인</button>
									<a id="aNonMbLogin" href="#layer_no_member_chk"
										class="button purple btn-modal-open" w-data="600" h-data="320"
										style="display: none;"></a>
								</div>
							</div>
						</div>
						<!--// tab 비회원 로그인 -->
					</div>
					<!--// tab-cont-wrap -->
				</div>

				<button type="button" class="btn-modal-close">
					레이어 닫기
					<!--레이어 닫기-->
				</button>
			</div>
		</section>

		<section id="layer_no_member_chk" class="modal-layer">
			<a href="" class="focus">레이어로 포커스 이동 됨</a>
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
								<col style="width: 80px;">
								<col>
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
						class="button purple small" disabled="disabled">확인</button>
				</div>

				<button id="btnNonMbModalClose" type="button"
					class="btn-modal-close">레이어 닫기</button>
			</div>
		</section>
		<!--  ko_KR -->


		<script type="text/javascript">
    $(function(){
        
            
                $('#header .right-link .before').show();
                $('#header .right-link .after').hide();
                //session 관련 처리를 위한 부분
                $.ajaxMegaBox({
                    url: '/sessionChk.do',
                    success: function(data) {
                        var loginYn = data.loginYn;
                        if(loginYn == 'Y'){
                            $('.right-link .before').hide();
                        $('.right-link .after').show();
                        }else{
                            $('.right-link .before').show();
                        $('.right-link .after').hide();
                        }
                     }
               });
            
            
        

        // 웹에서만 실행 -> facebook을 로드하지 않는 템플릿에서 반복적인 오류 발생으로 hreader로 이전
        if(!MegaboxUtil.Common.isMobile() && !MegaboxUtil.Common.isApp())
            MegaboxUtil.Share.init();
    });

    //로그인 버튼
    $(document).on('click', '#moveLogin', function() {

        fn_viewLoginPopup('default','pc');

    });

    var sysCd = 'ON';

  	//넷퍼넬 스킨 타입 지정
	NetfunnelChk.setting( sysCd, MegaboxUtil.Common.isApp() );

</script>

		<!-- 베네피아 배너 접근 시 노출 -->


		<!-- 메인에만 광고영역 노출 -->

		<!-- 메인 영화에만 광고영역 노출 -->

		<div class="header-add-area" style="display: none;">
			<div class="cont">
				<script data-id="U2ACFQVBQ0mneJSt6aNkaA"
					name="megabox_p/sub/sub@sub_top_1100x80?mlink=343"
					src="//cast.imp.joins.com/persona.js" async=""></script>
				<script
					src="//cast.imp.joins.com/body/U2ACFQVBQ0mneJSt6aNkaA/jPfCCh8tg1_Ef0ws5eBgkXfnqZnnRiRBtc-1kUGVmrmEAM4qWzAZAbZXeTd0VUJUOFJtV3JVWGlQbEZqaE5BAstB2Lie5Z8K6wPLQdi4nuWfCus.js"></script>
				<div id="U2ACFQVBQ0mneJSt6aNkaA">
					<iframe
						src="//ad.imp.joins.com/html/megabox_p/sub/sub@sub_top_1100x80?_cid=U2ACFQVBQ0mneJSt6aNkaA&amp;_uid=jPfCCh8tg1_Ef0ws5eBgkXfnqZnnRiRBtc-1kUGVmrmEAM4qWzAZAbZXeTd0VUJUOFJtV3JVWGlQbEZqaE5BAstB2Lie5Z8K6wPLQdi4nuWfCus&amp;_ref=https%3A%2F%2Fwww.megabox.co.kr%2Fmovie-detail%3FrpstMovieNo%3D21084100"
						title="영화상세 상단 배너영역" height="80px" width="100%" name="mliframe"
						scrolling="no" frameborder="0" topmargin="0" leftmargin="0"
						marginwidth="0" marginheight="0"></iframe>
				</div>
			</div>
			<button type="button" class="btn-del">광고영역 닫기</button>
		</div>


				<%@ include file="/WEB-INF/views/header.jsp"%>

		<!-- 		<div id="bodyContent"> -->








		<script type="text/javascript">
var localeCode = "kr";			   //한영 구분 코드
$(function(){
});

function fn_setMeta(scnDiv) {
	var paramData = null;

	if( scnDiv == undefined ){

		switch(tmpData.tabIndx){

		case 0: //영화별
			url = location.protocol + '//' + document.domain + '/booking/timetable';
			paramData = {
					'scnTitle'         : '영화별 상영시간표 < 상영시간표 | MEET PLAY SHARE, 메가박스'
					, 'metaTagTitle'   : '영화별상영시간표 < 상영시간표 | MEET PLAY SHARE, 메가박스'
					, 'metaTagDtls'    : '메가박스의 영화별 상영시간표를 알려드립니다.'
					, 'metaTagKeyword' : ''
					, 'metaTagUrl'     : url
				};
				break;

		case 1: //극장별
			url = location.protocol + '//' + document.domain + '/booking/timetable';
			paramData = {
					'scnTitle'         : '극장별 상영시간표 < 상영시간표 | MEET PLAY SHARE, 메가박스'
					, 'metaTagTitle'   : '극장별상영시간표 < 상영시간표 | MEET PLAY SHARE, 메가박스'
					, 'metaTagDtls'    : '메가박스의 극장별 상영시간표를 알려드립니다.'
					, 'metaTagKeyword' : ''
					, 'metaTagUrl'     : url
				};
				break;

		case 2: //특별관
			url = location.protocol + '//' + document.domain + '/booking/timetable';
			paramData = {
					'scnTitle'         : '특별관 상영시간표 < 상영시간표 | MEET PLAY SHARE, 메가박스'
					, 'metaTagTitle'   : '특별관상영시간표 < 상영시간표 | MEET PLAY SHARE, 메가박스'
					, 'metaTagDtls'    : '메가박스의 특별관 상영시간표를 알려드립니다.'
					, 'metaTagKeyword' : ''
					, 'metaTagUrl'     : url
				};
				break;
		}

	}else{
		url = location.protocol + '//' + document.domain + '/booking';
		paramData = {
				'scnTitle'         : '빠른예매 < 예매 | MEET PLAY SHARE, 메가박스'
				, 'metaTagTitle'   : '빠른예매 < 예매 | MEET PLAY SHARE, 메가박스'
				, 'metaTagDtls'    : '메가박스에서 영화를 간편하고 빠르게 예약해보세요.'
				, 'metaTagKeyword' : ''
				, 'metaTagUrl'     : url
			};
	}

	//이전버튼을 위한 현재 메타태그 정보 저장
	saveCurrentMeta();

	//URL 변경
	history.replaceState( null, null, url );

	//메타태그 설정
	settingMeta(paramData);
}



//좌석도로 파라메타 전달
function fn_setSmapParam(param) {

	NetfunnelChk.script("BOOK_STEP2",function(){

		//param : 좌석도 화면 구동에 필요한 상영스케줄번호
		//scnDiv : 네비게이션 표시를 위한 진입화면 구분 playTime : 예매 > 상영시간표, brch : 극장, spclBrch : 특별관
		var frameBokdMSeatBodyObj    = $('#frameBokdMSeat').get(0).contentWindow.document.body;	//좌석도 프레임 바디 오브젝트
		var framePayBookingBodyObj   = $('#framePayBooking').get(0).contentWindow.document.body;	//결제화면 프레임 바디 오브젝트
		var frameBokdMSeatContentObj = $('#frameBokdMSeat').get(0).contentWindow;
		var innerHtml = "<span>Home</span>";
		var smapPlaySchdlNo = param[0];
		var scnDiv = param[1];
		var brchNo = param[2];

		fn_setMeta(scnDiv);

		if("default" == scnDiv){
			innerHtml += "<a href=\"/booking\" title=\"/예매 페이지로 이동\">예매</a>";
			innerHtml += "<a href=\"/booking\" title=\"/빠른예매 페이지로 이동\">빠른예매</a>";
		}
		else if("playTime" == scnDiv){
			innerHtml += "<a href=\"/booking\" title=\"/예매 페이지로 이동\">예매</a>";
			innerHtml += "<a href=\"/booking/timetable\" title=\"/상영시간표 페이지로 이동\">상영시간표</a>";
		}
		else if("brch" == scnDiv){
			innerHtml += "<a href=\"/theater/list\" title=\"/극장 페이지로 이동\">극장</a>";
			innerHtml += "<a href=\"/theater/list\" title=\"/예매 페이지로 이동\">전체극장</a>";
			innerHtml += "<a href=\"\" title=\"/극장정보\">극장정보</a>";
		}
		else if("TBQ" == scnDiv){
			innerHtml += "<a href=\"/theater/list\" title=\"/극장 페이지로 이동\">극장</a>";
			innerHtml += "<a href=\"/on/oh/ohc/BrchSpecial/mainPage.do\" title=\"/특별관 페이지로 이동\">특별관</a>";
			innerHtml += "<a href=\"/on/oh/ohc/BrchSpecial/boutqInfoPage.do\" title=\"/부티크 페이지로 이동\">부티크</a>";
		}
		else if("MX" == scnDiv){
			innerHtml += "<a href=\"/theater/list\" title=\"/극장 페이지로 이동\">극장</a>";
			innerHtml += "<a href=\"/on/oh/ohc/BrchSpecial/mainPage.do\" title=\"/특별관 페이지로 이동\">특별관</a>";
			innerHtml += "<a href=\"/on/oh/ohc/BrchSpecial/mxInfoPage.do\" title=\"/MX 페이지로 이동\">MX</a>";
		}
		else if("CFT" == scnDiv){
			innerHtml += "<a href=\"/theater/list\" title=\"/극장 페이지로 이동\">극장</a>";
			innerHtml += "<a href=\"/on/oh/ohc/BrchSpecial/mainPage.do\" title=\"/특별관 페이지로 이동\">특별관</a>";
			innerHtml += "<a href=\"/on/oh/ohc/BrchSpecial/comfortInfoPage.do\" title=\"/COMFORT 페이지로 이동\">COMFORT</a>";
		}
		else if("MKB" == scnDiv){
			innerHtml += "<a href=\"/theater/list\" title=\"/극장 페이지로 이동\">극장</a>";
			innerHtml += "<a href=\"/on/oh/ohc/BrchSpecial/mainPage.do\" title=\"/특별관 페이지로 이동\">특별관</a>";
			innerHtml += "<a href=\"/on/oh/ohc/BrchSpecial/kidsInfoPage.do\" title=\"/MEGABOX KIDS 페이지로 이동\">MEGABOX KIDS</a>";
		}
		else if("TFC" == scnDiv){
			innerHtml +="<a href=\"/theater/list\" title=\"/극장 페이지로 이동\">극장</a>";
			innerHtml +="<a href=\"/on/oh/ohc/BrchSpecial/mainPage.do\" title=\"/특별관 페이지로 이동\">특별관</a>";
			innerHtml +="<a href=\"/on/oh/ohc/BrchSpecial/firstClubInfoPage.do\" title=\"/THE FIRST CLUB 페이지로 이동\">THE FIRST CLUB</a>";
		}
		else if("BCY" == scnDiv){
			innerHtml +="<a href=\"/theater/list\" title=\"/극장 페이지로 이동\">극장</a>";
			innerHtml +="<a href=\"/on/oh/ohc/BrchSpecial/mainPage.do\" title=\"/특별관 페이지로 이동\">특별관</a>";
			innerHtml +="<a href=\"/on/oh/ohc/BrchSpecial/balconyInfoPage.do\" title=\"/BALCONY 페이지로 이동\">BALCONY</a>";
		}

		$('#bokdContainer .inner-wrap .location').html(innerHtml);	//네비게이션 표시
		$(frameBokdMSeatBodyObj).find(".quick-reserve h2").html('');	//좌석도 타이틀 숨김
		$(framePayBookingBodyObj).find(".quick-reserve h2").html('');	//결제   타이틀 숨김

		$('#bokdContainer').show();		//좌석도, 결제 컨테이너 보임
		$('#schdlContainer').hide();	//상영시간표 컨테이너 숨김
		$('#bokdMSeat').show();			//좌석도 보임
		$(frameBokdMSeatBodyObj).find('#playSchdlNo').val(smapPlaySchdlNo);
		$(frameBokdMSeatBodyObj).find('#brchNo').val(brchNo);
		frameBokdMSeatContentObj.fn_search();	//좌석도 좌석조회

	// 	$('#frameBokdMSeat').attr('src','/on/oh/ohz/PcntSeatChoi/selectPcntSeatChoi.do?playSchdlNo='+obj.attr("play-schdl-no"));
	// 	$('#frameBokdMSeat').attr('src','/main');
	});
}

//좌석도에서 이전 버튼 클릭
function fn_goPrePagePcntSeatChoi() {
	var frameBokdMSeatContentObj = $('#frameBokdMSeat').get(0).contentWindow;
	$('#bokdContainer').hide();		//좌석도, 결제 컨테이너 보임
	$('#schdlContainer').show();	//상영시간표 컨테이너 숨김

	//결제에서 예매이동 처리 추가
	$('#bokdMSeat').hide();			//좌석도 숨김
	$('#bokdMPayBooking').hide();
	$('#frameBokdMSeat').attr("src", "/on/oh/ohz/PcntSeatChoi/selectPcntSeatChoi.do"); //좌석도 화면초기화
	$('#framePayBooking').attr("src", "/on/oh/ohz/PayBooking/completeSeat.do"); //결제화면 초기화

	//이전 메타태그 정보로 설정 (preMetaFormat:전역변수)
	settingMeta(preMetaFormat);
	//URL 변경
	history.replaceState( null, null, preMetaFormat.metaTagUrl );
}

//좌석도에서 다음 버튼 클릭
function fn_goNextPagePcntSeatChoi(param) {
	//로그인 여부 체크
	fn_validLoginAt(param);
	//데이터 보정 체크
	//fn_validLoginAt();
	//오입력 체크
	//블랙리스트 체크
	//결제로이동
}


//결제화면으로로 파라메타 전달 및 화면 이동
function fn_setBookingParamMove(options) {

	NetfunnelChk.script("BOOK_STEP3",function(){

		var framePayBookingBodyObj    = $('#framePayBooking').get(0).contentWindow.document.body;	//결제화면 프레임 바디 오브젝트
		var framePayBookingContentObj = $('#framePayBooking').get(0).contentWindow;

		//좌석도에서 세팅한 param 값
		var playSchdlNo   = options.playSchdlNo;	//상영스케쥴
		var seatOccupText = options.seatOccupText;	//좌석/티켓 상세정보
		var totalAmt      = options.totalAmt;		//총금액

		$(framePayBookingBodyObj).find('#playSchdlNo').val(playSchdlNo);
		$(framePayBookingBodyObj).find('#seatOccupText').val(seatOccupText);
		$(framePayBookingBodyObj).find('#totalAmt').val(totalAmt);

		framePayBookingContentObj.completeSeat();
		$('#bokdMPayBooking').show();
		//프레임 높이 자동 조정
		calcFrameHeight($('#bokdMPayBooking'), $('#framePayBooking'));

		$('#bokdMSeat').hide();  //좌석도 숨김

	});
}

//결제화면에서 이전 버튼 클릭
function fn_goPrePagePayBooking() {
	var framePayBookingContentObj = $('#framePayBooking').get(0).contentWindow;
	var frameBokdMSeatContentObj = $('#frameBokdMSeat').get(0).contentWindow;
	$('#bokdMPayBooking').hide();
	$('#framePayBooking').attr("src", "/on/oh/ohz/PayBooking/completeSeat.do"); //결제화면 초기화
	$('#bokdMSeat').show();	//좌석도 표시
	$("html,body").scrollTop(0);

	frameBokdMSeatContentObj.fn_display_init();
}

//결제화면에서 이전 버튼 클릭 및 블랙리스트 팝업
function fn_altBlackgoPrePagePayBooking(blackListParam) {
	var framePayBookingContentObj = $('#framePayBooking').get(0).contentWindow;
	var frameBokdMSeatContentObj = $('#frameBokdMSeat').get(0).contentWindow;
	$('#bokdMPayBooking').hide();
	$('#framePayBooking').attr("src", "/on/oh/ohz/PayBooking/completeSeat.do"); //결제화면 초기화
	$('#bokdMSeat').show();	//좌석도 표시
	$("html,body").scrollTop(0);

	frameBokdMSeatContentObj.fn_display_init();

	frameBokdMSeatContentObj.shwoBlackListPopup(blackListParam);
}

//결제화면에서 오류 발생시 좌석도로 이동(기선점 존재, 시간 초과 등)
function fn_goPrePageInitSeat(msg) {
	var framePayBookingContentObj = $('#framePayBooking').get(0).contentWindow;
	$('#bokdMPayBooking').hide();
	$('#framePayBooking').attr("src", "/on/oh/ohz/PayBooking/completeSeat.do"); //결제화면 초기화

	//좌석도 초기화
	var frameBokdMSeatContentObj = $('#frameBokdMSeat').get(0).contentWindow;
	frameBokdMSeatContentObj.fn_search('N');  //새로 조회 및 최초진입 팝업 띄우지 않음
	$('#bokdMSeat').show();	//좌석도 표시
	$("html,body").scrollTop(0);

	if (msg != null && msg != "") {
		gfn_alertMsgBox("결제가능 시간이 초과되어<br/> 좌석선택부터 다시 진행바랍니다.");
	}

	frameBokdMSeatContentObj.fn_display_init();
}

//프레임 height 자동조정 : 결제만 적용가능
function calcFrameHeight(divObj, frameObj) { //div obj, frame obj
	var frameBodyObj = $(frameObj).get(0).contentWindow.document.body;	//프레임 바디 오브젝트
	var height = $(frameObj).contents().find('.inner-wrap').outerHeight();
	$(divObj).height(height + 130);
	$(frameObj).height(height + 130);
}

//로그인여부 체크
function fn_validLoginAt(param){
	$.ajaxMegaBox({
        url    : "/on/oh/ohg/MbLogin/selectLoginSession.do",
        //data   : JSON.stringify(paramData),
        success: function(result){
        	var loginAt = result.resultMap.result;	//로그인 여부

        	//비로그인 상태
			if(loginAt  == "N"){
				//로그인 팝업 표시
				fn_viewLoginPopup('SimpleBokdM','pc','Y',JSON.stringify(param));
			}
        	//로그인 상태
			else {
				//데이터 보정 체크
				fn_validDataRevisn(param);
			}
        }
    });
}

//데이터 보정 체크
function fn_validDataRevisn(param){

	fn_vlaidBlackList(param);

// 	$.ajaxMegaBox({
//         url    : "/on/oh/ohg/MbLogin/selectDataRevisn.do",
//         //data   : JSON.stringify(paramData),
//         success: function(result){
//         	var dataRevisnAt = result.resultMap.result;	//로그인 여부
//         	//자료보정대상
// 			if(dataRevisnAt  == "Y"){
// 				//자료 보정 안내 메세지 표시
// 				var arguments=result.resultMap.birthDe+' / '+result.resultMap.mblpTelno;
// 				var frameBokdMSeatContentObj = $('#frameBokdMSeat').get(0).contentWindow;	//좌석도 프레임 컨텐츠 오브젝트
// 				frameBokdMSeatContentObj.shwoDataRevisnPopup(arguments,param);
//  			}
//  			//자료보정대상아님
//  			else {
//  				//블랙리스트 체크
// 				fn_vlaidBlackList(param);
//  			}
//         }
//     });
}

//블랙리스트 체크
function fn_vlaidBlackList(param){


	var paramData = { BokdCnt : param.bokdCnt
					, BokdBrch : param.brchNo
					};

// 	//좌석수 param
	$.ajaxMegaBox({
        url    : "/on/oh/ohg/MbLogin/selectBlackList.do",
        data   : JSON.stringify(paramData),
        success: function(result){
        	var dataBlackListAt = result.resultMap.result;
        	//블랙리스트 대상
			if(dataBlackListAt  == "Y"){
				//블랙리스트 안내 메세지 표시
				var frameBokdMSeatContentObj = $('#frameBokdMSeat').get(0).contentWindow;
				var blackListParam = { bokdAbleBrch: result.resultMap.bokdAbleBrch
									, bokdAbleCnt: result.resultMap.bokdAbleCnt
									, bokdAbleQty: result.resultMap.bokdAbleQty
									 }
				frameBokdMSeatContentObj.shwoBlackListPopup(blackListParam);
			}
			//블랙리스트 비 대상
			else {
				//결제로 이동
 				fn_setBookingParamMove(param);
			}
        }
    });
}

//페이지 이동
function fn_mvPage(page){
	$("#bokdMForm").attr("method","post");
	$("#bokdMForm").attr("action",page);
	$("#bokdMForm").submit();
}

//언어변환
function setLangChg(){
    if(localeCode == "en"){
        location.href="/booking?megaboxLanguage=kr";
    }
    else {
        location.href="/booking?megaboxLanguage=en";
    }
}


//페이지 리로드
function fn_bokdReload(page){
	fn_goPrePagePcntSeatChoi();
}

</script>
		<form id="bokdMForm">
			<input type="hidden" name="returnURL" value="info">
		</form>
		<!-- container -->
		<div id="bokdContainer" class="container area-ad"
			style="padding-bottom: 200px; display: none">
			<input type="hidden" id="playDe" name="playDe" value="">
			<div class="page-util off">
				<div class="inner-wrap">
					<div class="location"></div>

				</div>
			</div>

			<div id="bokdMSeat"
				style="overflow: hidden; display: none; height: 736px;">
				<iframe id="frameBokdMSeat"
					src="/on/oh/ohz/PcntSeatChoi/selectPcntSeatChoi.do?megaboxLanguage=kr"
					title="관람인원선택 프레임" scrolling="no" frameborder="0"
					class="reserve-iframe" style="width: 100%; height: 736px;"></iframe>
			</div>

			<div id="bokdMPayBooking"
				style="overflow: hidden; display: none; height: 736px;">
				<iframe id="framePayBooking"
					src="/on/oh/ohz/PayBooking/completeSeat.do?megaboxLanguage=kr"
					title="예매 결제" scrolling="no" frameborder="0" class="reserve-iframe"
					style="width: 100%; height: 736px;"></iframe>
			</div>

		</div>
		<!--// container -->

		

		<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
</style>

		<script type="text/javascript">
$(function() {
    // 탭 버튼
    

    // 특별관 클릭
    $('.splBtn').on('click', function(e) {
        e.preventDefault();

        var cd = $(this).data('cd');
        var url = '';

        if(cd == 'btq') url = '/on/oh/ohc/BrchSpecial/boutqInfoPage.do'; // 부티크
        else if(cd == 'mx') url = '/on/oh/ohc/BrchSpecial/mxInfoPage.do'; // MX
        else url = '/on/oh/ohc/BrchSpecial/balconyInfoPage.do'; // 발코니

        location.href = url;
    });

     // 보고싶어 이벤트
    $('.btn-util .btn-like').on('click', function() {
        var idx = $('.movie-list-info .btn-see .heart').index(this);

        $.ajaxMegaBox({
            url: '/on/oh/oha/Movie/mergeMovieHeart.do',
            data: JSON.stringify({
                rpstMovieNo: $(this).attr("rpst-movie-no")
            }),
            sessionAt:true,
            success: function (data) {
                var resultMap = data.resultMap;

                if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');

                var s_intrstCnt = '';
                if (resultMap.intrstCnt > 999) {
                	s_intrstCnt = Math.floor((resultMap.intrstCnt/1000) * 10)/10  + 'k';
                } else {
                	s_intrstCnt = resultMap.intrstCnt;
                }

                if(resultMap.rowStatCd == 'D') {
                    $(this).attr('title', '보고싶어 안함');
                    $('.btn.btn-like').removeClass('on');
                    $('#btnlike2').removeClass('on');
                    $('#intrstCnt').html(s_intrstCnt);
                    $('#intrstCnt2').html(s_intrstCnt);
                } else {
                    $(this).attr('title', '보고싶어 함');
                    $('.btn.btn-like').addClass('on');
                    $('#btnlike2').addClass('on');
                    $('#intrstCnt').html(s_intrstCnt);
                    $('#intrstCnt2').html(s_intrstCnt);
                }
            }
        });
    });

    // 초기 탭 불러오기
    var url = '';

});

/**
* 탭메뉴 설정
*/
function setTab( idx ){
    switch( idx ) {
        default :
            url 	= location.protocol + "//" + document.domain + "/movie-detail?rpstMovieNo=${movie.m_num}";
            metaFormat = {
                    'scnTitle'			: "(${movie.m_name}) 주요정보 < 영화 | MEET PLAY SHARE, 메가박스"
                    , 'metaTagTitle'	: "(${movie.m_name}) 주요정보 < 영화 | MEET PLAY SHARE, 메가박스"
                    , 'metaTagDtls'		: $("#movieSynopCn").val()
                    , 'metaTagKeyword'	: "${movie.m_name}, , , "
                    , 'metaTagUrl'		: url
                };
            $('#boxoInfoContent').show();
            break;
        case 1 :
            url 	= location.protocol + "//" + document.domain + "/movie-detail/comment?rpstMovieNo=${movie.m_num}";
            metaFormat = {
                    'scnTitle'			: "(${movie.m_name}) 한줄평 < 영화 | MEET PLAY SHARE, 메가박스"
                    , 'metaTagTitle'	: "(${movie.m_name}) 한줄평 < 영화 | MEET PLAY SHARE, 메가박스"
                    , 'metaTagDtls'		: "${movie.m_name} | 영화에 대해 이야기 나누어 보세요."
                    , 'metaTagUrl'		: url

                };
            $('#boxoInfoContent').hide();
            break;
        case 2 :
            url 	= location.protocol + "//" + document.domain + "/movie-detail/moviepost?rpstMovieNo=${movie.m_num}";
            metaFormat = {
                    'scnTitle'			: "(${movie.m_name}) 무비포스트 < 영화 | MEET PLAY SHARE, 메가박스"
                    , 'metaTagTitle'	: "(${movie.m_name}) 무비포스트 < 영화 | MEET PLAY SHARE, 메가박스"
                    , 'metaTagDtls'		: "${movie.m_name} | 무비포스트로 영화에 대한 감동을 더욱 깊게 남겨보세요."
                    , 'metaTagUrl'		: url

                };
            $('#boxoInfoContent').hide();
            break;
        case 3 :
            url 	= location.protocol + "//" + document.domain + "/movie-detail/trailer?rpstMovieNo=${movie.m_num}";
            metaFormat = {
                    'scnTitle'			: "(${movie.m_name}) 예고편/스틸컷 < 영화 | MEET PLAY SHARE, 메가박스"
                    , 'metaTagTitle'	: "(${movie.m_name}) 예고편/스틸컷 < 영화 | MEET PLAY SHARE, 메가박스"
                    , 'metaTagDtls'		: "${movie.m_name} | 예고편/스틸컷으로 영화를 미리 확인해보세요."
                    , 'metaTagUrl'		: url

                };
            $('#boxoInfoContent').hide();
            break;
    }

    //URL 변경
    if (url.indexOf('megabox.co.kr') != -1){
    	history.replaceState( null, null, url );
    }

    //메타태그 설정
    settingMeta(metaFormat);
}

// 예매페이지 이동
function fn_bookingForm(rpstMovieNo, type) {
    $('#movieForm').append("<input type='hidden' name='rpstMovieNo' value='" + rpstMovieNo + "' />");
    //$('#movieForm').append("<input type='hidden' name='theabKindCd1' value='" + type + "' />");

    if (type == 'MX') {
        $('#movieForm').append("<input type='hidden' name='theabKindCd1' value='" + type + "' />");
    }

    $('#movieForm').attr('method', 'post');
    $('#movieForm').attr('action', '/booking');
    $('#movieForm').submit();
};
</script>

		<form id="movieForm" method="post"></form>

		<input type="hidden" id="currentPage" value="1"> <input
			type="hidden" id="recordCountPerPage" value="8"> <input
			type="hidden" id="MovieNo" value="${movie.m_num}"> <input
			type="hidden" id="movieSynopCn"
			value="‘${movie.m_name}’: 재난 상황에 직면한 항공기가 더 이상 정상적인 운항이 불가능하여,<br>무조건적인 착륙을 요청하는 비상사태를 뜻하는 항공 용어<br><br>베테랑 형사 팀장 인호(송강호)는 비행기 테러 예고 영상 제보를 받고 사건을 수사하던 중<br>용의자가 실제로 KI501 항공편에 타고 있음을 파악한다.<br><br>딸의 치료를 위해 비행 공포증임에도 불구하고 하와이로 떠나기로 한 재혁(이병헌)은<br>주변을 맴돌며 위협적인 말을 하는 낯선 이가 신경 쓰인다.<br><br>인천에서 하와이로 이륙한 KI501 항공편에서 원인불명의 사망자가 나오고,<br>비행기 안은 물론 지상까지 혼란과 두려움의 현장으로 뒤바뀐다.<br><br>이 소식을 들은 국토부 장관 숙희(전도연)는 대테러센터를 구성하고<br>비행기를 착륙시킬 방법을 찾기 위해 긴급회의를 소집하는데…">

		<!-- container -->
		<div id="schdlContainer" class="container area-ad no-padding-bottom">
			<div class="page-util off">
				<div class="inner-wrap">
					<div class="location">
						<span>Home</span> <a href="/movie" title="영화 페이지로 이동">영화</a> <a
							href="/movie" title="전체영화 페이지로 이동">전체영화</a> <a href="/movie"
							title="박스오피스 페이지로 이동">박스오피스</a>
					</div>
				</div>
			</div>

			<!-- contents -->
			<div id="contents" class="no-padding">










				<script type="text/javascript">
$(function(){

	//포스터 다운로드버튼 : 원본 다운로드
	$('.btn-poster-down').on('click', function(){
		if ($(this).data('no') == '') {
			gfn_alertMsgBox('잘못된 접근입니다.');
			return false;
		} else {
			gfn_fileDown( '/on/coc/FileUpload/downloadFile.do?fileNo=' + $(this).data('no') + '&fileSn=' + $(this).data('sn') );
		}
	});
});

</script>


				<form id="movieForm"></form>

				<input type="hidden" id="currentPage" name="currentPage" value="1">
				<input type="hidden" id="recordCountPerPage"
					name="recordCountPerPage" value="8"> <input type="hidden"
					id="totalCnt" name="totalCnt" value="0"> <input
					type="hidden" id="rpstMovieNo" name="rpstMovieNo" value="21084100">

				<!-- movie-detail -->
				<div class="movie-detail-page">
					<div class="bg-img"
						style="background-image: url('${movie.m_poster }');"></div>
					<div class="bg-pattern"></div>
					<div class="bg-mask"></div>

					<!-- movie-detail-cont -->
					<div class="movie-detail-cont">



						<!-- 개봉 예매가능-->





						<p class="contents-type"></p>
						<p class="title">${movie.m_name}</p>
						<p class="title-eng"><!-- 영어제목 --></p>









						<div class="btn-util">
							<button type="button" title="보고싶어 안함" class="btn btn-like"
								rpst-movie-no="21084100">
								<i class="iconset ico-heart-line"></i> <span title="보고싶어 한 명수"
									id="intrstCnt"> ${movie.m_like } </span>
							</button> 
							



							<div class="sns-share">
								<a href="#" class="btn btn-common-share" title="공유하기"> <i
									class="iconset ico-sns-line"></i> 공유하기 <!-- 공유하기 -->



								</a>

								<div class="btn-sns-share-wrap">
									<div class="cont-area">
										<div class="btn-sns-share-group">
											<!-- <button type="button" title="카카오톡 공유하기" class="btn btnSns kakao">카카오톡 </button> 카카오톡 -->
											<button type="button" title="페이스북 공유하기"
												class="btn btnSns face">
												페이스북
												<!-- 페이스북 -->
											</button>
											<button type="button" title="밴드 공유하기" class="btn btnSns band">
												밴드
												<!-- 밴드 -->
											</button>
											<button type="button" title="트위터 공유하기"
												class="btn btnSns twitter">
												트위터
												<!-- 트위터 -->
											</button>
											<button type="button" title="링크 공유하기" class="btn btnSns link">
												링크공유
												<!-- 링크공유 -->
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>










						<!-- info -->



						<div class="info">
						<c:if test="${movie.m_avg!=0 }">
							<div class="score">
								<p class="tit">실관람 평점</p>
								<div class="number gt" id="mainMegaScore">
									<!--  <div class="number lt" id="mainMegaScore">
					<p title="관람 전 점수" class="before"><em>0</em><span class="ir">점</span></p>
					<p title="관람 후 점수" class="after"><em>7.9</em><span class="ir">점</span></p> -->
					
									<p title="실관람 평점" class="before">
										<em><script>
								var str ='${movie.m_avg }';
								var str0 = str.substr(0,1);
								var str1 = str.substr(1);
								document.write(str0+'.'+str1);
								</script></em><span class="ir">점</span>
									</p>
									
								</div>
							</div>
								</c:if>
							

							<div class="audience ">
								<div class="tit ">
									<span class="m-tooltip-wrap ">누적관객수 <!-- 2019-09-11 툴팁 보기 수정 -->
										<em class="m-tooltip ml05"> <i
											class="iconset ico-tooltip-gray">툴팁보기</i>
											<div class="m-detail-tooltip">
												<div class="bg-arr bottom"></div>
												<div class="cont-area">
													<p class="reset a-c">
														누적관객 및 전일관객은 영화진흥 위원회<br> 영화관 입장권 통합전산망제공 기준입니다.<br>
														(2022.08.03기준)
													</p>
												</div>
											</div>
									</em>
									</span>
								</div>
								<p class="cont">
									<em>${movie.m_attendance }</em> 명
								</p>
							</div>

						</div>
						<!--// info -->

						<div class="poster">
							<div class="wrap">


									<c:if test="${movie.m_age == '등급미정'}">
									<p class="movie-grade age-no">,</p>
									</c:if>
									<c:if test="${movie.m_age == '전체관람가'}">
									<p class="movie-grade age-all">,</p>
									</c:if>
									<c:if test="${movie.m_age == '청소년관람불가'}">
									<p class="movie-grade age-19">,</p>
									</c:if>
									<c:if test="${movie.m_age == '15세이상관람가'}">
									<p class="movie-grade age-15">,</p>
									</c:if>
									<c:if test="${movie.m_age == '12세이상관람가'}">
									<p class="movie-grade age-12">,</p>
									</c:if>



								<img
									src="${movie.m_poster }"
									onerror="noImg(this)" alt="${movie.m_name}"> <a href="#"
									class="btn-poster-down" title="포스터 다운로드" data-no="1107245"
									data-sn="1">포스터 다운로드</a>
							</div>
						</div>








						<div class="reserve screen-type col-1">
							<div class="reserve">
								

								<a href="javascript:fn_bookingForm('${movie.m_num }','basic');"
									class="btn reserve" title="영화 예매하기">예매</a> 
									
							</div>
						</div>
					</div>
					<!--// movie-detail-cont -->
				</div>
				<!--// movie-detail -->

				<div id="contentData">









					<script type="text/javascript">
var selectCIdx;
var selectPIdx;
var totalPoint = 0;
var gOnelnEvalNo = "";

var gExpeAt = 'N';
var gPrevAt = 'N';
var gMbAdmisAt = 'N';
var gMbPostAt = 'N';


$(function() {
    // 무비포스트 좋아요
    $(".movie-post-list").on('click','.postLikeBtn', function(){
        fn_addLike(this);
    });

    // 한줄평 등록 버튼
//     $('.story-write').on('click', function(e) {
//         e.preventDefault();

//         mbLayer.toggle({ id:'layer_regi_reply_review' });
//     });

    // 무비포스트 클릭
    $('.moviePostBtn').on('click', function(e) {
        e.preventDefault();
        /* $('#movieForm').append('<input type="hidden" name="moviePostNo" value="' + $(this).data('no') + '">');
        $('#movieForm').append('<input type="hidden" name="rowNum" value="9999999">');
        $('#movieForm').append('<input type="hidden" name="totCnt" value="0">');
        $('#movieForm').attr('action', '/moviepost/detail');
        $('#movieForm').attr('method', 'get');
        $('#movieForm').submit(); */

        //레이어 팝업 띄우기로 변경
		fn_postDetail($(this).data('no'),'post', 'movie-detail');

    });

 //   =2&=10&ibxMovieNmSearch=&pageType=&onairYn=&tabType=my


    // 무비포스트 댓글 클릭
    $('.post-detailRlyPopup').on('click', function(e) {
        e.preventDefault();
      //레이어 팝업 띄우기로 변경
		fn_postDetail($(this).data('no'),'rly', 'movie-detail');

      	/* $('#movieForm').append('<input type="hidden" name="moviePostNo" value="' + $(this).data('no') + '">');
        $('#movieForm').append('<input type="hidden" name="rowNum" value="9999999">');
        $('#movieForm').append('<input type="hidden" name="totCnt" value="0">');
        $('#movieForm').attr('action', '/moviepost/detail#rly');
        $('#movieForm').attr('method', 'get');
        $('#movieForm').submit(); */
    });

    // 무비포스트 아이디 클릭
    $('.moviePostId').on('click', function(e) {
        e.preventDefault();

        $('#movieForm').append('<input type="hidden" name="moviePostId" value="' + $(this).data('id') + '">');
        $('#movieForm').attr('action', '/moviepost/all');
        $('#movieForm').attr('method', 'post');
        $('#movieForm').submit();
    });


    // 무비포스트 더보기 클릭
    $('#goMoviePost').on('click', function(e) {
        e.preventDefault();

        $('#movieForm').append('<input type="hidden" name="ibxMovieNmSearch" value="' + $(this).data('nm') + '">');
        $('#movieForm').attr('action', '/moviepost/all');
        $('#movieForm').attr('method', 'post');
        $('#movieForm').submit();
    });


    // 무비포스트 등록
    $('.moviePostWitBtn').on('click', function(e) {
        e.preventDefault();

		if (gMbAdmisAt != 'Y') {
			gfn_alertMsgBox("무비포스트는 실관람객만 작성하실 수 있습니다. 현장에서 예매하신 경우 '나의 메가박스 > 나의 무비스토리'에서 본영화 등록 후 이용하실 수 있습니다.");
			return;
		} else if (gMbPostAt == 'Y') {
			gfn_alertMsgBox("이미 작성된 무비포스트가 있습니다.");
			return;
		}

        $('#movieForm').append('<input type="hidden" name="rpstMovieNo" value="${movie.m_num}">');
        $('#movieForm').append('<input type="hidden" name="backScreen" value="movie-detail">');
        $('#movieForm').attr('action', '/moviepost/write');
        $('#movieForm').attr('method', 'post');
        $('#movieForm').submit();
    });

    // 한줄평 별점 마우스 이벤트
    $('.box-star-score .star button').on('mouseover', function() {
        var cIdx = $(this).index();
        var pIdx = $(this).parent().index();

        fn_bindStart(cIdx, pIdx);
    }).on('mouseout', function() {
        $('.box-star-score .star button').removeClass('on');

        fn_bindStart(selectCIdx, selectPIdx);
    }).on('click', function() {
        selectCIdx = $(this).index();
        selectPIdx = $(this).parent().index();

        fn_bindStart(selectCIdx, selectPIdx);
    });

    // 기대포인트 클릭
    $('.point .box button').on('click', function() {
        if($(this).attr('class').indexOf('on') == -1) {
            $('.point .txt').text('(최대 2개 선택가능)');

            if($('.point .box button.on').length == 0  ){ //1개 선택 시 문구 변경
                $('.point .txt').removeClass('font-gblue');
                $('.point .txt').text('(한 가지 더 고르실 수 있어요.)');
            }

            if($('.point .box button.on').length >= 1){ //2개 선택 시 문구 변경
                $('.point .txt').addClass('font-gblue');
                $('.point .txt').text('(선택완료 하셨습니다.)');
            }
            if($('.point .box button.on').length >= 2) { //3개째 선택하면 선택했던거 초기화
                $('.point .box button.on').removeClass('on');
                $('.point .txt').removeClass('font-gblue');
                $('.point .txt').text('(최대 2개 선택가능)');
                return;
            }

            $(this).addClass('on');

        } else {
            $(this).removeClass('on');

        }
    });

    // 한줄평 내용 길이 체크
    $('#textarea').on('keyup', function() {
        if(this.value.length > 100) this.value = this.value.substr(0, 100);

        $('.textarea .count span').html(this.value.length);
    });

    // 한줄평 등록 버튼
    $('#regOneBtn').on('click', function() {
        var title = $(this).text();
        $('#regOneBtn').css({"pointer-events":"none"});

        var dirtorScore = $('.point .box button').eq(0).attr('class').indexOf('on') > -1 ? 1 : 0;
        var storyScore = $('.point .box button').eq(1).attr('class').indexOf('on') > -1 ? 1 : 0;
        var videoScore = $('.point .box button').eq(2).attr('class').indexOf('on') > -1 ? 1 : 0;
        var actorScore = $('.point .box button').eq(3).attr('class').indexOf('on') > -1 ? 1 : 0;
        var ostScore = $('.point .box button').eq(4).attr('class').indexOf('on') > -1 ? 1 : 0;

        var $this = $(this);
        var $btn  = $('.btn-modal-open.oneWrtBtn');
        var s_onelnEvalDivCd = $btn.data('cd');

        if ($this.text() == '수정') {
            s_onelnEvalDivCd = $this.attr('data-cd');
        }

		if(totalPoint == null) totalPoint = 0;
        if(totalPoint == 0) {
            $('.errText').html('이 영화에 대한 별점을 선택해주세요.');
            $('.errText').show();
        } else if( gfn_isEmpty($('#textarea').val()) ) {
            $('.errText').html('이 영화에 대한 ' + title + '을 작성해주세요.');
            $('.errText').show();
   //     } else if($('.point .box button').attr('class').indexOf('on') ==-1 ){
        } else if(dirtorScore + storyScore + videoScore + actorScore + ostScore < 1){
            $('.errText').html('이 영화에 대한 '+'포인트를 1개 이상 선택해주세요.'); //TO-DO : 이 영화에 대한 (관람/기대)포인트를 1개 이상 선택해주세요
            $('.errText').show();
        } else if( $.trim($('#textarea').val()).length < 10 ){
            $('.errText').html('관람평을 최소 10글자 이상 입력해주세요');
	        $('.errText').show();
        } else {
            for(var i = 0; i < $("#textarea").val().length; i++){
            	var temp = $("#textarea").val();
            	if (temp[i] == temp[i+1]){
            		if(temp[i] == temp[i+2]){
                		if(temp[i] == temp[i+3]){
                    		if(temp[i] == temp[i+4]){
								$('.errText').html('동일문자를 5자이상 연속해서 입력하실 수 없습니다.');
								$('.errText').show();
                                $('#regOneBtn').css({"pointer-events":"auto"});
								return;
                    		}
                		}
            		}
            	}
            }
            $('.errText').hide();
            //$('.btn-modal-close').click();

            $.ajaxMegaBox({
                url: '/on/oh/oha/Movie/insertOneLn.do',
                data: JSON.stringify({
                    onelnEvalDivCd: s_onelnEvalDivCd,
                    onelnEvalCn: $('#textarea').val(),
                    movieNo: $this.attr('data-mno'),
                    onelnEvalNo: gOnelnEvalNo, //$(this).data('no'),
                  //  updateAt: $(this).data('id') ? 'Y' : 'N',
                    spointScore: totalPoint,
                    dirtorScore: dirtorScore,
                    storyScore:  storyScore,
                    videoScore: videoScore,
                    actorScore: actorScore,
                    ostScore: ostScore
                }),
                clickLmtChk: true, //중복클릭 방지 실행
                success: function(d) {

                    var s_nm = "";
                    if (s_onelnEvalDivCd == 'EXPE') {
                        s_nm = "기대평";
                        gExpeAt = 'Y';
                        $('.btn-modal-open.oneWrtBtn').attr({'href' : 'javaScript:void(0)'});
                    } else {
                        s_nm = "관람평";
                        gPrevAt = 'Y';
                        $('.btn-modal-open.oneWrtBtn').attr({'href' : 'javaScript:void(0)'});
                    }

                    if(d.msg == 'already') {
                        gfn_alertMsgBox('이미 작성된 ' + s_nm + '이 있습니다.');
                    }

                    if(d.msg == 'auth') {
                        gfn_alertMsgBox('권한이 없습니다.');
                    }

                    var oneLineMsg = "실 관람평이 등록되었습니다.";

					if(d.oneLnReAt == "0000"){
						oneLineMsg = "관람일 기준으로 7일 이내 실관람평이 등록되어 포인트가 적립되었습니다.";
					}
					//20190905 한줄평, 댓글 작성시 메세지 불필요
					gfn_alertMsgBox({ msg: oneLineMsg, callback: fn_oneEndAction(title,'Y') });

                    //fn_oneEndAction(title, 'Y');

                    if($('.oneContentTag').eq(0).prev().length > 0)
                        $('.oneContentTag').eq(0).hide();
                },complete: function(xhr){

                	clearLmt(); //중복제한 초기화

                    if( xhr.status == 200){
                        $('.btn-modal-close').click();
                    }

                }
            });
        }
        $('#regOneBtn').css({"pointer-events":"auto"});
    });

    $('.story-write').off(); // 오루로 인해 front.js 소스 이벤트 제거

    // 로그인 툴팁 활성화
    $('.oneWrtNonMbBtn').on('click', function() {
        $(this).next().css({ left: $('.oneWrtNonMbBtn').position().left - 50, top: '-62px' });
    });

    // 툴팁에서 로그인 클릭시 툴팁 닫기
    $('.loginTagClick').on('click', function() {
        $(this).parent().prev().click();
    });

    // 한줄평 등록 팝업 호출시 데이터 초기화
    $('.oneWrtBtn').on('click', function() {
        if(gMbAdmisAt == 'N') {
        	gfn_alertMsgBox("한줄평은 실관람 이후 작성 가능합니다.\n메가박스에서 관람하신 경우 [본 영화]등록 후 이용하실 수 있습니다.");
			return;
        } else if(gMbAdmisAt == 'Y' && gPrevAt == 'Y') {
			gfn_alertMsgBox("이미 작성된 관람평이 있습니다.");
            //중복으로 팝업 뜨는것 막기
            $('.btn-modal-open.oneWrtBtn').attr({'href' : 'javaScript:void(0)'});
			return;
        } else {
            fn_bindStart(0, -1);
            var cd = $(this).data('cd');

            if(cd == 'PREV') { // 관람평
                $('.oneTitle').html('관람평');
                $('.oneText').html('관람');
            } else { // 기대평
                $('.oneTitle').html('기대평');
                $('.oneText').html('기대');
            }

            $('#textarea').val('');
            $('.textarea .count span').html(0);
            $('.point .box button.on').removeClass('on');
            $('#regOneBtn').html('등록');
            $('#regOneBtn').attr('data-no', '');
            $('#regOneBtn').attr('data-cd', cd);
            $('.point .txt').text('(최대 2개 선택가능)');
            $('.errText').hide();

            gOnelnEvalNo = "";
        }

    });

    // 한줄평 타입 검색 버튼
    $('.sortBtn').on('click', function() {
        $('.sortBtn.on').removeClass('on');
        $(this).addClass('on');

        fn_selectOneList($(this).data('cd'));
    });

    // 한줄평 정렬 검색 버튼
    $('.orderBtn').on('click', function() {
        $('.orderBtn.on').removeClass('on');
        $(this).addClass('on');

        fn_selectOneList($(this).data('cd'));
    });

    var btn_movie_reserve = $('.movie-detail-page div.reserve').offset().top;
    var tab_top = $('.tab-list.fixed').offset().top;

    $(document).find('.page-util').addClass('off'); // 일단 로케이션 숨기기
    $(document).find('.page-util .sns-share').hide();

    // 영화 상세 내용 고정 시키기, 로케이션 보이고 고정시키기
    /* $(window).on('scroll', function() {
        if($(window).scrollTop() > btn_movie_reserve - 47) {
            $(document).find('.movie-detail-page').addClass('fixed');
            $(document).find('#contents').addClass('movie-fixed');
            $(document).find('.page-util').removeClass('off').addClass('fixed');
        } else {
            $(document).find('.movie-detail-page').removeClass('fixed');
            $(document).find('#contents').removeClass('movie-fixed');
            $(document).find('.page-util').addClass('off').removeClass('fixed');
        }

        if($(window).scrollTop() > tab_top - 192) {
            $(document).find('.tab-list.fixed').addClass('movie');
            $(document).find('#contents').addClass('tab-fixed-movie');
        } else {
            $(document).find('.tab-list.fixed').removeClass('movie');
            $(document).find('#contents').removeClass('tab-fixed-movie');
        }
    }); */

    $('.movie-post-list').masonry({
        itemSelector : '.grid-item',
        columnWidth : 230,
        gutter : 60
    });

    // 무대인사 > 열기닫기
    $('.movie-greeting').on('click', '.btn-more .btn', function() {

        var $this = $('.movie-greeting');

        // 닫힌상태
        if ($this.hasClass('off')) {

            $this.removeClass("off").find('span').html('닫기');
            $this.find('li:eq(0)').nextAll().show();

        } else {
            $this.addClass("off").find('span').html('전체일정보기');
            $this.find('li:eq(0)').nextAll().hide();
        }
    });

    // 무대인사 > 바로예매
    $('.movie-greeting').on('click', 'a.button:not(.soldOutBtn)', function(e) {
        e.preventDefault();

        var $this = $(this);
        var sampleObj = new Object();

        sampleObj['brch-no']       = $this.attr('brch-no');       //지점번호
        sampleObj['play-schdl-no'] = $this.attr('play-schdl-no'); //상영일정번호
        sampleObj['rpst-movie-no'] = $this.attr('rpst-movie-no'); //대표영화번호
        sampleObj['theab-no']      = $this.attr('theab-no');      //상영관번호
        sampleObj['play-de']       = $this.attr('play-de');       //상영일자
        sampleObj['play-seq']      = $this.attr('play-seq');      //상영회차

        // megabox-simpleBokd.js
        fn_mainValidAndPopup(sampleObj, 'brch');
    });

    // 무대인사 닫기 노출변경
    if ($('.movie-greeting li').length <= 1) {
        $('.movie-greeting').find('.btn-more').hide();
    }

    fn_selectChartData(); // 차트 데이터 조회
    fn_hideStoryMoreCheck(); // 줄거리 더보기 버튼 비활성화 체크
});

// 줄거리 더보기 버튼 비활성화 체크
function fn_hideStoryMoreCheck() {
    var beforeHeight = $('.movie-summary .txt').height();
    $('.movie-summary .btn-more button').click();
    var affterHeight = $('.movie-summary .txt').height();
    $('.movie-summary .btn-more button').click();

    if(beforeHeight >= affterHeight) { // 더보기 할 줄거리가 없을시
        $('.movie-summary .btn-more').hide();
    }
};

// 차트 데이터 조회
function fn_selectChartData() {
    $.ajaxMegaBox({
        url: '/on/oh/oha/Movie/selectMovieGrapList.do',
        data: JSON.stringify({
            movieNo: '${movie.m_num}',
            rpstMovieNo: '${movie.m_num}',
            kofRpstMovieCd: '20196410'
        }),
        success: function(d) {

        	//d = {"statCd":0,"msg":"정상적으로 조회되었습니다.","bokdRt":{"bokdRt":9.7,"bokdRt10":1.9,"bokdRt20":10.8,"bokdRt30":45.9,"bokdRt40":38.7,"bokdRt50":2.7},"bokdDayList":[{"adncCnt":632735,"boxoDe":"20191122"},{"adncCnt":1662674,"boxoDe":"20191123"},{"adncCnt":1536149,"boxoDe":"20191124"},{"adncCnt":353856,"boxoDe":"20191125"}],"expeAllPointList":[{"topScorePoint":"영상미","score":3,"cd":"VIDEO"},{"topScorePoint":"스토리","score":2,"cd":"STORY"},{"topScorePoint":"OST","score":2,"cd":"OST"},{"topScorePoint":"배우","score":2,"cd":"ACTOR"},{"topScorePoint":"감독","score":1,"cd":"DIRTOR"}],"prevAllPointList":[{"topScorePoint":"배우","score":2,"cd":"ACTOR"},{"topScorePoint":"영상미","score":1,"cd":"VIDEO"},{"topScorePoint":"OST","score":1,"cd":"OST"},{"topScorePoint":"감독","score":0,"cd":"DIRTOR"},{"topScorePoint":"스토리","score":0,"cd":"STORY"}]};
        	//d = {"statCd":0,"msg":"정상적으로 조회되었습니다.","bokdRt":{"bokdRt":9.7,"bokdRt10":1.9,"bokdRt20":10.8,"bokdRt30":45.9,"bokdRt40":38.7,"bokdRt50":2.7},"bokdDayList":[{"adncCnt":20000,"boxoDe":"20191122"},{"adncCnt":20000,"boxoDe":"20191123"},{"adncCnt":60000,"boxoDe":"20191124"},{"adncCnt":50000,"boxoDe":"20191125"}],"expeAllPointList":[{"topScorePoint":"영상미","score":3,"cd":"VIDEO"},{"topScorePoint":"스토리","score":2,"cd":"STORY"},{"topScorePoint":"OST","score":2,"cd":"OST"},{"topScorePoint":"배우","score":2,"cd":"ACTOR"},{"topScorePoint":"감독","score":1,"cd":"DIRTOR"}],"prevAllPointList":[{"topScorePoint":"배우","score":2,"cd":"ACTOR"},{"topScorePoint":"영상미","score":1,"cd":"VIDEO"},{"topScorePoint":"OST","score":1,"cd":"OST"},{"topScorePoint":"감독","score":0,"cd":"DIRTOR"},{"topScorePoint":"스토리","score":0,"cd":"STORY"}]};

            var expeAllPointList = d.expeAllPointList; // 기대평 포인트
            var prevAllPointList = d.prevAllPointList; // 관람평 포인트
            var bokdRt = d.bokdRt; // 예매률
            var bokdDayList = d.bokdDayList; // 일자별 관객수
            var bokdRtData = [];
            var bokdDayData = [];
            var labelArr = [];
            var dataArr = [];

            // 기대포인트 그래프 생성
            fn_chartByStar(d);

            var bokdRtNo = bokdRt && bokdRt.bokdRt ? bokdRt.bokdRt : 0;

            var s_rfilmDe = '${movie.m_date}';

            if (!gfn_isEmpty(s_rfilmDe)) {
	            $('#rkTag').html(bokdRtNo + '&#37;'); // 총 예매률
            }

            // 예매률 데이터 생성
            if(bokdRt) {
                bokdRtData[0] = bokdRt.bokdRt10 != 0 ? bokdRt.bokdRt10.toFixed(1) : 0;
                bokdRtData[1] = bokdRt.bokdRt20 != 0 ? bokdRt.bokdRt20.toFixed(1) : 0;
                bokdRtData[2] = bokdRt.bokdRt30 != 0 ? bokdRt.bokdRt30.toFixed(1) : 0;
                bokdRtData[3] = bokdRt.bokdRt40 != 0 ? bokdRt.bokdRt40.toFixed(1) : 0;
                bokdRtData[4] = bokdRt.bokdRt50 != 0 ? bokdRt.bokdRt50.toFixed(1) : 0;
            }

            //fn_chartByBar(bokdRtData); // 예매률 그래프 생성

            // 일자별 관객수 데이터 생성
            if(bokdDayList.length > 0) {
                $.each(bokdDayList, function(i, v) {
                    labelArr.push(v.boxoDe.format("XXXX.XX.XX").substring(5));
                    dataArr.push(v.adncCnt);
                });
            }

            fn_chartByLine(labelArr, dataArr); // 일자별 관객수 그래프 생성
        }
    });

    fn_selectOneList(); // 한줄평 조회
};

// 한줄평 버튼 이벤트
function fn_bindOneBtnEvent() {
    // 한줄평 신고
    $('.maskOne').off().on('click', function() {
        /* var isLogin = '' ? false : true;

        if(isLogin) return gfn_alertMsgBox('로그인후 이용 가능한 서비스입니다.'); */

        fn_preDecl($(this).data('no')); //신고하기 전처리 이동

    });

    // 한줄평 좋아요
    $('.oneLikeBtn').off().on('click', function() {
        /* var isLogin = '' ? false : true;

        if(isLogin) return gfn_alertMsgBox('로그인후 이용 가능한 서비스입니다.'); */

        //if($(this).data('is') == "Y") return; // 본인은 좋아요 불가


        $.ajaxMegaBox({
            url: '/on/oh/oha/Movie/mergeMoviePostHeart.do',
            data: JSON.stringify({
                artiNo: $(this).data('no'),
                artiDivCd: 'ONELN',
                rcmmAt: $(this).find('.ico-like-gray').length > 0 ? 'Y' : 'N'
            }),
            sessionAt: true,
            success: function(d) {

            	if (d.resultMap.msg == 'sessionFail') {
            		gfn_alertMsgBox('로그인후 이용 가능한 서비스입니다.');
            	} else {
                    fn_oneEndAction('좋아요');
            	}
            }
        });
    });

    // 한줄평 삭제
    $('.deleteOne').off().on('click', function() {

        var s_onelnEvalDivNm = "";

        var $this = $(this);
        var s_onelnEvalDivCd = $(this).data('cd');

        if (s_onelnEvalDivCd == 'EXPE') {
            s_onelnEvalDivNm = "기대평";
        } else {
            s_onelnEvalDivNm = "관람평";
        }

        gfn_confirmMsgBox('삭제 시 관람평 작성으로 지급받으신 포인트가 차감되며, 재 지급되지 않습니다.\n삭제 하시겠습니까?', function() {

            $.ajaxMegaBox({
                url: '/on/oh/oha/Movie/deleteOneLn.do',
                data: JSON.stringify({
                    onelnEvalNo   : $this.data('no'),
                    movieNo       : $this.data('mno'),
                    onelnEvalDivCd: $this.data('cd')
                }),
                sessionAt: true,
                success: function(d) {
                    if($('.oneContentTag').eq(0).prev().length > 0)
                        $('.oneContentTag').eq(0).show();

                    if(d.msg == 'auth') {
                        gfn_alertMsgBox('권한이 없습니다.');
                    }

                    if (s_onelnEvalDivCd == 'EXPE') {
                        gExpeAt = 'N';
                    } else {
                        $this.data('cd', 'EXPE');
                        gPrevAt = 'N';
                    }

                    if ((gMbAdmisAt == 'N') || (gMbAdmisAt == 'Y' && gPrevAt == 'N')) {
                        $('.btn-modal-open.oneWrtBtn').attr({'href' : '#layer_regi_reply_review'});
                    }

                    //20190905 한줄평, 댓글 작성시 메세지 불필요  gfn_alertMsgBox({ msg: '삭제 되었습니다.', callback: fn_oneEndAction('삭제') });
                    fn_oneEndAction('삭제', 'Y');
                }
            });
        });
    });

    // 한줄평 수정 클릭시 레이어 데이터 초기화
    $('.updateOne').off().on('click', function() {
        $('#regOneBtn').html('수정');

        var pTarget = $(this).parents('.story-cont');
        //var cn = pTarget.find('.story-txt').text();
        var cn = $(this).data('cn');

        $('#textarea').val(cn);
        $('.regi-reply-score .count span').html($('#textarea').val().length);
        $('#layer_regi_reply_review .point .box button.on').removeClass('on');

        var score = $(this).data('score');
        selectCIdx = Math.floor(score / 2);
        selectPIdx = score % 2;

        fn_bindStartShow(selectCIdx, selectPIdx, score);

        $.each(pTarget.find('.story-recommend em'), function(i, v) {
            if($(v).text() == '연출') $('#layer_regi_reply_review .point .box button').eq(0).click();
            if($(v).text() == '스토리') $('#layer_regi_reply_review .point .box button').eq(1).click();
            if($(v).text() == '영상미') $('#layer_regi_reply_review .point .box button').eq(2).click();
            if($(v).text() == '배우') $('#layer_regi_reply_review .point .box button').eq(3).click();
            if($(v).text() == 'OST') $('#layer_regi_reply_review .point .box button').eq(4).click();
        });

        var cd = $(this).next().data('cd');

        if(cd == 'PREV') { // 관람평
            $('.oneTitle').html('관람평');
            $('.oneText').html('관람');
        } else { // 기대평
            $('.oneTitle').html('기대평');
            $('.oneText').html('기대');
        }


        $('#regOneBtn').attr('data-no', $(this).data('no'));
        $('#regOneBtn').attr('data-cd', $(this).next().data('cd'));
        $('.errText').hide();

        gOnelnEvalNo = $(this).data('no');

    });
};

//신고하기 전처리
function fn_preDecl(dataNo){

	var options = {};
		gfn_confirmMsgBox("해당 댓글을 신고하시겠습니까?", function(){
			options.confirmFn  = fn_Decl(dataNo); //신고하기
	});
}

// 신고하기 처리
function fn_Decl(dataNo){
	$.ajaxMegaBox({
	    url: '/on/oh/oha/Movie/insertDecl.do',
	    data: JSON.stringify({
	        artiNo: dataNo,
	        artiDivCd: 'ONELN',
	        artiInspItemCd: 'SPOL'
	    }),
	    sessionAt: true,
	    success: function(d) {
			if (d.resultMap.msg == 'dataFail') {
		    	gfn_alertMsgBox('이미 신고 되었습니다.');
			} else {
		    	gfn_alertMsgBox('신고 되었습니다.');
			}

	       // $('.balloon-space').attr("style", "display:none");
	    	fn_oneEndAction('신고'); //완료후 처리함수

	    }
	});

}

// 한줄평 액션 완료 후 실햄 함수
function fn_oneEndAction(str, isRePointInfo) {

    fn_selectOneList();

    if (isRePointInfo == 'Y') {
        fn_selectPointInfo();
    }
};

//메가스코어
function fn_selectPointInfo(){

    var paramData = {'rpstMovieNo' : $('#rpstMovieNo').val()};

    $.ajaxMegaBox({
        url      : '/on/oh/oha/Movie/selectMoviePointInfo.do',
        data     : JSON.stringify(paramData),
        success  : function (data, textStatus, jqXHR) {

            var addCss = 'equal';
            var delCss = 'equal gt lt';

            if (data.dtlMap.admisNSpoint > data.dtlMap.admisYSpoint) {
                //addCss = 'gt';
            }

            if (data.dtlMap.admisNSpoint < data.dtlMap.admisYSpoint) {
                //addCss = 'lt';
            }

            if (data.dtlMap.admisYSpoint == 0) {
                $('#subMegaScore .graph').show();
                $('#subMegaScore .graph').next().hide();
            } else {
                $('#subMegaScore .graph').hide();
                $('#subMegaScore .graph').next().show();
            }

            // 한줄평 스코어 변경
            $('#subMegaScore .middle  em').html(data.dtlMap.admisYSpoint);

            // 영화정보 스코어 변경
            $('#mainMegaScore .before em').html(data.dtlMap.admisNSpoint);
            $('#mainMegaScore .after  em').html(data.dtlMap.admisYSpoint);
            $('#mainMegaScore').removeClass(delCss).addClass(addCss);

            // 기대포인트 그래프 생성
            fn_selectChartData();
        }
    });
}

// 한줄평 목록 조회
function fn_selectOneList(onelnEvalDivCd) {
    $.ajaxMegaBox({
        url: '/on/oh/oha/Movie/selectOneLnList.do',
        data: JSON.stringify({ movieNo: '${movie.m_num}', onelnEvalDivCd: onelnEvalDivCd, currentPage:'1' }),
        success: function(d) {
            var list = d.list;
            var target = $('.movie-idv-story ul');
            var html;
            var isEq, isEqAt, isEqClass, storyClass, storyLikeClass, balloonClass, onClass, regDt, spointScore;

            target.find('.oneContentTag').remove();

            $.each(list, function(i, v) {
                isEq = '' == v.mbNo ? true : false;
                isEqAt = '' == v.mbNo ? 'Y' : 'N';
                isEqClass = isEq ? ' my' : '';
                balloonClass = isEq ? ' writer' : 'user';
                storyClass = v.onelnEvalDivCd == 'PREV' ? 'review' : 'preview';
                onClass= v.viewType == 'TYPE02' && v.onelnEvalDivCd == 'PREV' ? ' on' : '';
                storyLikeClass = v.rcmmAt != 'Y' ? 'gray' : v.onelnEvalDivCd == 'PREV' ? 'purple' : 'blue';
                spointScore = v.spointScore || 0;

                if((v.viewType == 'TYPE02' && v.onelnEvalDivCd == 'EXPE') || v.viewType == 'TYPE01') {
                    html = '';
                    html += '<li class="' + v.viewType.toLowerCase() + ' oneContentTag">';
                    html += '    <div class="story-area">';
                    html += '        <div class="user-prof' + isEqClass + '">';
                    html += '            <div class="prof-img"><img src="' + d.imgSvrUrl + v.profileImgPath +'" alt="프로필 사진" title="프로필 사진" onerror="noImg(this, \'human\')"></div>';
                    html += '            <p class="user-id">' + v.loginId + '</p>';
                    html += '        </div>';
                    html += '        <div class="story-box">';

                    regDt = v.fstRegDt;
                }

                html += '            <div class="story-wrap ' + storyClass + onClass + '">';

                if(v.viewType == 'TYPE02') {
                    html += '<div class="tit"><button type="button" title="' + v.onelnEvalDivNm + '">' + v.onelnEvalDivNm + '</button></div>';
                } else {
                    html += '<div class="tit">' + v.onelnEvalDivNm + '</div>';
                }

             // 스포일러 신고 글
                if(v.maskAt == 'Y') {
                    html += '<div class="warning">';
                    html += '    <div class="table">';
                    html += '        <div class="inner-text">';
                    html += '            <i class="iconset ico-ping-triangle"></i>';
                    switch(v.maskResnCd){ //가림사유

                    case "SPOL":
                        html += '            <p>영화 내용에 대한 스포일러가 포함되어 있어 내용을 표시하지 않습니다.</p>';
                        break;
                    case "SLAN":
                        html += '            <p>비방,욕설,선정적 내용이 포함되어 있어 내용을 표시하지 않습니다.</p>';
                        break;
                    case "ADVT":
                        html += '            <p>광고, 홍보성 내용이 포함되어 있어 내용을 표시하지 않습니다.</p>';
                        break;
                    case "NOTA":
                        html += '            <p>작성된 내용이 무의미한 문자의 나열로 구성되어 내용을 표시하지 않습니다.</p>';
                        break;
                    case "ETC":
                        html += '            <p>관리자가 내용의 표시를 차단했습니다.</p>';
                        break;

                    }
                    html += '        </div>';
                    html += '    </div>';
                    html += '</div>';
                }


                html += '                <div class="story-cont">';
                html += '                    <div class="story-point">';
                html += '                        <span>' + spointScore + '</span>';
                html += '                    </div>';
                html += '                    <div class="story-recommend">';

                //$.each(v.moviePointList, function(si, sv) {
                //    html += '<em>' + sv.topScorePoint + '</em>';
                //});
				html += gfn_charToHtml(replaceAll(v.topScorePoint, 'span', 'em'));

				html += '                    </div>';
                html += '                    <div class="story-txt">' + v.onelnEvalCn + '</div>';  //v.onelnEvalCn.replaceAll('\n', '<br>')

                html += '                    <div class="story-like">';
                html += '                        <button type="button" class="oneLikeBtn" title="댓글 추천" data-no="' + v.onelnEvalNo + '" data-is="' + isEqAt + '"><i class="iconset ico-like-' + storyLikeClass + '"></i> <span>' + v.rcmmCnt + '</span></button>';
                html += '                    </div>';
                html += '                    <div class="story-util">';
                html += '                        <div class="post-funtion">';
                html += '                            <div class="wrap">';
                html += '                                <button type="button" class="btn-alert">옵션보기</button>';
                html += '                                <div class="balloon-space ' + balloonClass + '">';
                html += '                                    <div class="balloon-cont">';

                if(isEq) { // 글쓴이 본인일때 나오는 창
                    html += '<div class="writer">';
                    html += '    <a href="#layer_regi_reply_review" title="수정" class="btn-modal-open updateOne" w-data="500" h-data="680" data-score="' + v.spointScore + '" data-no="' + v.onelnEvalNo + '" data-cn="' + v.onelnEvalCn + '">수정  <i class="iconset ico-arr-right-green"></i></a>';
                    html += '    <button type="button" class="deleteOne" data-no="' + v.onelnEvalNo + '" data-mno="21084100" data-cd="' + v.onelnEvalDivCd + '">삭제 <i class="iconset ico-arr-right-green"></i></button>';
                    html += '</div>';
                } else { // 일반사용자일때 나오는 창
                    html += '<div class="user">';
                    html += '    <p class="reset a-c">스포일러 및 욕설/비방하는<br />내용이 있습니까?</p>';
                    html += '    <button type="button" class="maskOne" data-no="' + v.onelnEvalNo + '">댓글 신고 <i class="iconset ico-arr-right-green"></i></button>';
                    html += '</div>';
                }

                html += '                                            <div class="btn-close"><a href="#" title="닫기"><img src="/static/pc/images/common/btn/btn-balloon-close.png" alt="닫기" /></a></div>';
                html += '                                        </div>';
                html += '                                    </div>';
                html += '                                </div>';
                html += '                            </div>';
                html += '                        </div>';
                html += '                    </div>';
                html += '                </div>';



                if(v.viewType == 'TYPE01') {
                     html += '            </div>';
                    html += '        </div>';
                    html += '        <div class="story-date">';
                    html += '            <div class="' + storyClass + ' on">';
                    if(v.lstUptDt!=='') {
                        html += '                <span>' + v.lstUptDt + '</span>';
                    }
                    else {
                        html += '                <span>' + v.fstRegDt + '</span>';
                    }
                    html += '            </div>';
                    html += '        </div>';
                } else if(v.viewType == 'TYPE02' && v.onelnEvalDivCd == 'PREV') {
                     html += '            </div>';
                    html += '        </div>';
                    html += '        <div class="story-date">';
                    html += '            <div class="preview">';
                    html += '                <span>' + regDt + '</span>';
                    html += '            </div>';
                    html += '            <div class="review on">';
                    if(v.lstUptDt!=='') {
                        html += '                <span>' + v.lstUptDt + '</span>';
                    }
                    else {
                        html += '                <span>' + v.fstRegDt + '</span>';
                    }
                    html += '            </div>';
                    html += '        </div>';
                }

                if((v.viewType == 'TYPE02' && v.onelnEvalDivCd == 'PREV') || v.viewType == 'TYPE01') {
                    html += '</li>';
                    target.append(html);
                }

            });

            fn_bindOneBtnEvent();
        }
    });
};

// 한줄평 별점 설정
function fn_bindStart(cIdx, pIdx) {
    totalPoint = 0;

    $('.box-star-score .star button').removeClass('on');

    for(var i = 0; i <= pIdx; ++i) {
        if(i < pIdx) {
            $('.box-star-score .group').eq(i).find('button').addClass('on');

            totalPoint += 2;
        } else if(i >= pIdx) {
            for(var j = 0; j <= cIdx; ++j) {
                $('.box-star-score .group').eq(i).find('button').eq(j).addClass('on');

                totalPoint += 1;
            }
        }
    }

    $('.box-star-score .num em').html(totalPoint);
};

//한줄평 별점 설정
function fn_bindStartShow(cIdx, pIdx, score) {
    totalPoint = score;

    $('.box-star-score .star button').removeClass('on');

    for(var i = 0; i < cIdx; ++i) {
        if(i < cIdx) {
            $('.box-star-score .group').eq(i).find('button').addClass('on');
        }
    }

    for(var j = 0; j < pIdx; ++j) {
        $('.box-star-score .group').eq(cIdx).find('button').eq(j).addClass('on');
    }


    $('.box-star-score .num em').html(totalPoint);
};

//스킬컷 생성 후 페이지 설정
function fn_checkStilPage() {
    var currentPage = $('#currentPage').val();
    var recordCountPerPage = $('#recordCountPerPage').val();
    var pageNo = Number($('#currentPage').val());
    var pageTotalCnt = Math.ceil($('.font-gblue').text() / recordCountPerPage);

    if(pageNo >= pageTotalCnt) {
        $('.stair-slide-list .btn-more').hide();
    } else {
        $('#currentPage').val(pageNo + 1);
    }
}

// 차트 초기화
function fn_chartInit() {
    window.onload = function() {
        var ctx = document.getElementById('chartByStart').getContext('2d');
        var radar = new Chart(ctx, undefined);
    };
}

// 막대 그래프 생성
function fn_chartByBar(data) {
    if(data.length == 0) {
        $('#chartByBar').hide();
        $('#chartByBar').next().show();

        return;
    }

    var barChartData = {
        labels: ['10대', '20대', '30대', '40대', '50대'],
        datasets: [{
            label: '예매율',
            backgroundColor: '#33a1b8',
            data: data
        }]
    };

    var ctx = document.getElementById('chartByBar').getContext('2d');
    myBar = new Chart(ctx, {
        type: 'bar',
        data: barChartData,
        options: {
        	layout: {
                padding: {
                    left: 0,
                    right: 0,
                    top: 0,  //15,
                    bottom: 0
                }
            },
            borderColor : "#FFFFFF",
            legend : { display: false },
            maintainAspectRatio: false,
            label: {
                display: false,
            },
            tooltips: {
                mode: 'index',
                intersect: false
            },
            responsive: true,
            scales: {
                xAxes: [{
                	barPercentage: 0.9,
                    gridLines : {
                        drawBorder: false,
                        display : false
                    }
                }],
                yAxes: [{
                    gridLines: {
                        //offsetGridLines : true,
                        drawBorder: false,
                        color    : "#FFFFFF",
                        zeroLineColor : "#8B8B8B",
                        zeroLineWidth : 1
                    },
                    ticks:{ display : false, beginAtZero:true },
                    scaleLabel: {
                        display: true
                    },
                }]
            },
            events: false,
            tooltips: {
                enabled: false
            },
            hover: {
                animationDuration: 2
            },
            animation: {
                duration: 1,
                onComplete: function () {
                    var chartInstance = this.chart;
                    ctx = chartInstance.ctx;
                    ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'bottom';
                    this.data.datasets.forEach(function (dataset, i) {
                        var meta = chartInstance.controller.getDatasetMeta(i);
                        meta.data.forEach(function (bar, index) {
                            var data = dataset.data[index];

                           // ctx.fillText(data, bar._model.x, bar._model.y - 2); 그래프 % 표시 삭제,  20190830 김민영과장
                        });
                    });
                }
            }
        }
    });
}

// 라인형 그래프 생성
function fn_chartByLine(labels, datas) {
    if(datas.length == 0) {
        $('#chartByLine').hide();
        $('#chartByLine').next().show();

        return;
    }

    // 속도 설정
    //Samples.utils.srand(20);

    new Chart('chartByLine', {
        type: 'line',
        data: {
                labels: labels,
                datasets: [
                    {
                    	label: '일별 관객수',
                    	fill: false,
                        lineTension: 0.1,
                        data: datas,
                        backgroundColor: 'rgba(53, 31, 102, 0.2)',
                        borderColor : 'rgba(114, 196, 215, 1)',
                        borderWidth : 1,
                    }
                ],
                fill: false,
        },
    	options: {
            layout: {
                padding: {
                    left: -20,
                    right: 0,
                    top: 0,
                    bottom: 0
                }
            },
    		//maintainAspectRatio:false,
    		responsive: false,
    		legend: {
                display: false
            },
            scales: {
    			xAxes: [{
    				display: true,
    				gridLines: {
    			        color: "black",
    			        borderDash: [2, 5],
    			   	},
    			   	position: 'bottom'
    			}],
    			yAxes: [{
    				display: true,
    				gridLines: {
                        display:false
                    },
                    ticks: {suggestedMin: 0},
    				afterTickToLabelConversion : function(q){
    			        for(var tick in q.ticks){
    			           q.ticks[tick] = "";
    			        }
    			    }
    			}]
    		}
    	}
    });
}

// 스타형 그래프 생성
function fn_chartByStar(data) {

    var expeData    = [];
    var prevData    = [];
    var topPoinInfo = {};

    // 기대평 포인트 데이터 생성
    $.each(data.expeAllPointList, function(i, v) {
        if(v.cd == 'DIRTOR') expeData[0] = v.score + 2;
        if(v.cd == 'ACTOR' ) expeData[1] = v.score + 2;
        if(v.cd == 'OST'   ) expeData[2] = v.score + 2;
        if(v.cd == 'VIDEO' ) expeData[3] = v.score + 2;
        if(v.cd == 'STORY' ) expeData[4] = v.score + 2;
    });

    // 관람평 포인트 데이터 생성
    $.each(data.prevAllPointList, function(i, v) {
        if(v.cd == 'DIRTOR') prevData[0] = v.score + 2;
        if(v.cd == 'ACTOR' ) prevData[1] = v.score + 2;
        if(v.cd == 'OST'   ) prevData[2] = v.score + 2;
        if(v.cd == 'VIDEO' ) prevData[3] = v.score + 2;
        if(v.cd == 'STORY' ) prevData[4] = v.score + 2;
    });

    // 상위 기대/관람 포인트 2개
   	/* if (false) {
        topPoinInfo = {tit : '기대포인트', val : ''};
        $.each(data.expeTopPointList, function(i, v) {
           topPoinInfo.val += (i==0? '' : '&middot;') + v.topScorePoint;
        });
    } else {
        topPoinInfo = {tit : '관람포인트', val : ''};
        $.each(data.prevTopPointList, function(i, v) {
            topPoinInfo.val += (i==0? '' : '&middot;') + v.topScorePoint;
        });
    }*/

    topPoinInfo = {tit : '관람포인트', val : ''};
    $.each(data.prevTopPointList, function(i, v) {
        topPoinInfo.val += (i==0? '' : '&middot;') + v.topScorePoint;
    });

    // 데이터 없을시 이미지로 대체
    //if(expeData.length == 0 && prevData.length == 0) {
    if(prevData.length == 0) {
    	$('#chartByStart').parent().css('bottom', '0px');
        $('#chartByStart').hide();
        $('#chartByStart').next().show();
        $('#charByPoint').html('&nbsp;');
        $('#charByPoint').prev().html(topPoinInfo.tit);
        return;
    } else {
        $('#chartByStart').parent().css('bottom', '29px');
        $('#chartByStart').show();
        $('#chartByStart').next().hide();
        $('#charByPoint').html(topPoinInfo.val);
        $('#charByPoint').prev().html(topPoinInfo.tit);
    }

    var config = {
        type: 'radar',
        data: {
            labels: ['연출', '배우', 'OST', '영상미', '스토리'],
            datasets: [{
                label: '관람포인트',
                borderColor: chartColors.purple,
                pointBackgroundColor: chartColors.purple,
                pointBorderWidth: 1,
                pointRadius: 0,
                fill: false,
                data: prevData
            }]
        },
        options: {
            legend : false,
            title : { display: true },
            scale : {
                gridLines : { color : "#BFBFBF"},
                angleLines : { color : "#BFBFBF"},
                ticks : { maxTicksLimit: 5 , display: false , stepSize: 3 }
            }
        }
    };

    var ctx = document.getElementById('chartByStart').getContext('2d');
    var radar = new Chart(ctx, config);
}

// 보고싶어 저장
function fn_addHeart(obj){
    var idx = $('.movie-list-info .btn-see .heart').index(obj);

    $.ajaxMegaBox({
        url: '/on/oh/oha/Movie/mergeMovieHeart.do',
        data: JSON.stringify({
            rpstMovieNo: $(obj).attr("rpst-movie-no")
        }),
        sessionAt:true,
        success: function (data) {
            var resultMap = data.resultMap;

            if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');

            if(resultMap.rowStatCd == 'D') {
                $(obj).attr('title', '보고싶어 안함');
                $('.btn.btn-like').removeClass('on');
                $('#btnlike2').removeClass('on');
                $('#intrstCnt').html(resultMap.intrstCnt.format());
                $('#intrstCnt2').html(resultMap.intrstCnt.format());
            } else {
                $(obj).attr('title', '보고싶어 함');
                $('.btn.btn-like').addClass('on');
                $('#btnlike2').addClass('on');
                $('#intrstCnt').html(resultMap.intrstCnt.format());
                $('#intrstCnt2').html(resultMap.intrstCnt.format());
            }
        }
    });
}

// 좋아요 저장
function fn_addLike(obj) {
    var idx = $('.postLikeBtn').index(obj);

    $.ajaxMegaBox({
        url: '/on/oh/oha/Movie/mergeMoviePostHeart.do',
        data: JSON.stringify({
            artiNo: $(obj).attr("data-no"),
            artiDivCd: 'MOPO'
        }),
        sessionAt:true,
        success: function (data) {
            var resultMap = data.resultMap;

            if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');

            var target = $(obj).find('i');

            if(resultMap.rowStatCd == 'D') {
                target.attr('title', '좋아요 설정 안함');
                target.removeClass('on');
            } else {
                target.attr('title', '좋아요 설정 함');
                target.addClass('on');
            }

            $(obj).find('.none').text(resultMap.likeCnt);
        }
    });
}

// 무비포스트 상세페이지 이동
function fn_moviePostDetail(moviePostNo) {
    $('#movieForm').append("<input type='hidden' name='moviePostNo' value='" + moviePostNo + "' />");
    $('#movieForm').attr('method', 'post');
    $('#movieForm').attr('action', '/moviepost/detail');
    $('#movieForm').submit();
}

// 예매페이지 이동
function fn_bookingForm(rpstMovieNo, type) {
    $('#movieForm').append("<input type='hidden' name='rpstMovieNo' value='" + rpstMovieNo + "' />");
    //$('#movieForm').append("<input type='hidden' name='theabKindCd1' value='" + type + "' />");

    if (type != 'basic') {
        $('#movieForm').append("<input type='hidden' name='theabKindCd1' value='" + type + "' />");
    }

    $('#movieForm').attr('method', 'post');
    $('#movieForm').attr('action', '/booking');
    $('#movieForm').submit();
}

// 스틸컷 페이지 이동
function fn_movieStil() {
    $('#movieForm').append("<input type='hidden' name='rpstMovieNo' value='" + $('#rpstMovieNo').val() + "' />");
    $('#movieForm').attr('method', 'post');
    $('#movieForm').attr('action', '/on/oh/oha/Movie/selectMovieStillPage.do');
    $('#movieForm').submit();
}

</script>
					<div class="inner-wrap"  >
						<div class="tab-list fixed">
							<ul>
								<li><a
									href="movie-detail?rpstMovieNo=${movie.m_num }" title="주요정보 탭으로 이동">주요정보</a></li>
								<li><a href=""
									title="실관람평 탭으로 이동">실관람평</a></li>
								<li><a href=""
									title="무비포스트 탭으로 이동">무비포스트</a></li>
								<li  class="on"><a href="movie-detail?rpstMovieNo=${movie.m_num }"
									title="예고편/스틸컷 탭으로 이동">예고편/스틸컷</a></li>
							</ul>
						</div>
											
<div class="pb100">
      <div class="movie-list-util mt40">
         <div class="movie-sorting">
            <span>예고편</span>
         </div>
      </div>
      <!-- slide-title -->
      
         <!-- stillcut-slide -->
         <div class="stillcut-slide" id="tab1">
            <div class="slide-title">
               <!-- 하단 thumb-list 에있는 img 에alt 값이 span속의 글귀가 자동으로 들어가고 desc 속의 내용은 제목부분으로 자동으로 작성이됨 -->
               <h2 class="tit">
                  <span id="movieTitle">${movie.m_name } 예고편</span>
               </h2>

               <!-- 2019-01-29 마크업 변경 -->
               <div class="slide-btn">
                  <a href=""class="videoBtn btn-prev swiper-button-prev swiper-button-disabled">
                     
                     <span></span>
                  </a>

                  <a lass="videoBtn btn-next swiper-button-next">
                     
                     <span></span>
                  </a>
               </div>

               <!-- slide-list -->
               <div class="swiper-container gallery-top swiper-container-fade swiper-container-initialized swiper-container-horizontal">
                  <div class="swiper-wrapper">
                        <div class="swiper-slide swiper-slide-active" style="width: 800px; opacity: 1; transform: translate3d(0px, 0px, 0px);"><div class="vsc-controller"></div>
                           <%-- <iframe width="560" height="315" src="${movie.m_trailer }" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> --%>
                           <iframe id="my_frame" width="800" height="400" src="https://www.youtube.com/embed/${movie.m_trailer }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                  </div>
               <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
               <!--// slide-list -->

               </div><!--// slide-title -->

         </div><!--// stillcut-slide -->
   
      <!-- layer-stillcut-view -->
      <div class="layer-stillcut-view">
         <div class="layer-wrap">

            <div class="movie-detail-cont">
               <!-- 영화 이미지 배경이미지로 출력 -->
               <div class="bg-img" style="background-image:url('../../../static/pc/images/movie/img-movie-detail.jpg');"></div>
               <div class="bg-pattern"></div>
               <div class="bg-mask"></div>

         </div>
      </div>
      <!--// layer-stillcut-view -->
   </div>
         
					</div>
				
</div>
					<!--// inner-wrap -->











					<script type="text/javascript">

var detailPopup = {
	mbNo : "",
	moviePostNo : "",
	backScreen  : "",
	movieNo : ""
};

var moviePostRlyNo;

$(function() {

	// 구독하기 버튼
	$('#subscribe').on('click', function() {


		$.ajaxMegaBox({
	        url: '/on/oh/oha/Movie/mergeMoviePostSubscribe.do',
            data: JSON.stringify({
				mbNo : detailPopup.mbNo
            }),
            sessionAt:true,
	        success: function (data) {
				var resultMap = data.resultMap;

				if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');

				if(resultMap.moviePostSbscAt == 'Y' || resultMap.moviePostSbscAt == 'C') {
					gfn_alertMsgBox('구독 신청이 완료 되었습니다.', function(){

						// 영화 > 무비포스트 > 구독중인포스트 : 재조회
						if($('[data-type=subscribe].on').length == 1){
							$('[data-type=subscribe].on').click();
						}
						// 나의 무비스토리  > 구독중인포스트 : 재조회
						else if($('[data-type=mySubscribe].on').length == 1){
							$('[data-type=mySubscribe].on').click();
						}
					});
					$('#subscribe').text('구독중');
				} else if(resultMap.moviePostSbscAt == 'N') {
					gfn_alertMsgBox('구독이 해제 되었습니다.', function(){
						// 나의 무비스토리  > 구독중인포스트 : 재조회
						if ($('[data-type=mySubscribe].on').length == 1) {
							$('[data-type=mySubscribe].on').click();

						}

						// 영화 > 무비포스트 > 구독중인포스트 : 재조회
						else if($('[data-type=subscribe].on').length == 1){
							$('[data-type=subscribe].on').click();

						}
					});
					$('#subscribe').text('구독하기');
				} else {
					$('#subscribe').text('구독하기');
				}

	        }
	    });
	});

	// 좋아요 버튼
	$(".layer-con").on('click', '.count .btn', function() {
		fn_addHeart(this);
	});

	// 댓글 등록
	$(".layer-con").on('click', '#btnPostRly', function() {
		var postRlyCn = $('#postRlyCn').val();

		if(gfn_isEmpty(postRlyCn)) return gfn_alertMsgBox('내용을 입력하세요');

		fn_insertPostRlyPre();
	});

	// 더보기 버튼
	$('#btnAddMovie').on('click', function() {
		fn_moviePostRlySearch('add');
	});



	// 댓글 사이즈
	$('#postRlyCn').on('keyup', function(e) {
		var postRlyCn = $('#postRlyCn').val();

		if(postRlyCn.length < 101) $('.text-count').text(postRlyCn.length);
	});

	// 공유하기
	$('.btn-post-share button').off().on('click', function(e) {
		e.preventDefault();

		var classStr = $(this).attr('class');

		if(classStr.indexOf('kakao') > -1) { // 카카오톡
			if(!MegaboxUtil.Common.isMobile() && !MegaboxUtil.Common.isApp())
				MegaboxUtil.Common.alert('앱에서만 사용 가능합니다.');
			else
				MegaboxUtil.Common.alert('준비중입니다.');
		} else if(classStr.indexOf('face') > -1) { // 페이스북
			MegaboxUtil.Share.facebook();
		} else if(classStr.indexOf('band') > -1) { // 밴드
			MegaboxUtil.Share.band();
		} else if(classStr.indexOf('twitter') > -1) { // 트위터
			MegaboxUtil.Share.twitter();
		} else { // 링크 공유
			MegaboxUtil.Share.copyUrl();
		}

		$('.tooltip-layer, .tipPin').css({ 'opacity': 0, 'z-index': 0 });
	});

	// 예매 클릭
    $('#bokdLinkBtn').off().on('click', function(e) {
      e.preventDefault();

      var form = MegaboxUtil.Form.createForm();
      form.append($('<input>').attr({ 'type': 'hidden', 'name': 'rpstMovieNo', 'value': $(this).data('no') }));
      form.attr('action', '/booking');
      form.submit();
    });


});





/*댓글목록 가져오기*/
function fn_moviePostRlySearch(searchtype, moviePostNo, viewDiv){

	var moviePostNo = moviePostNo;
	//var currentPage = $("#currentPage").val();
	//var recordCountPerPage = $("#recordCountPerPage").val();

	if(searchtype == "search"){
		//currentPage = "1";
	}else if(searchtype == "add"){
		//currentPage = parseInt(currentPage) + 1;
	}
	//$("#currentPage").val(currentPage+"");
	//var paramData = { moviePostNo: moviePostNo, currentPage:currentPage + "", recordCountPerPage:recordCountPerPage};
	var paramData = { moviePostNo: moviePostNo};

	$.ajax({
        url: "/on/oh/oha/Movie/selectMoviePostRlyList.do",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
		data: JSON.stringify(paramData),
        success: function (data) {
        	if(searchtype == "search"){
        		$("#commentList").empty();
        	}

        	$("#commentList").append(data);


        	if(viewDiv == "rly"){ //댓글아이콘 눌러서 상세 볼 경우
        		console.log(viewDiv);

        		$('#postRlyCn').focus();
        		$('.comment-box')[0].scrollIntoView(false); //댓글로 포커스


        	}else if($('#layer_post_detail .bg-modal-dim').length > 0) {
        		// 그림, 텍스트 눌러서 포스트 상세 볼 경우
        		console.log(viewDiv);
        		$('#layer_post_detail .bg-modal-dim')[0].scrollIntoView(true); // 레이어팝업 헤더에 포커스

        	}

        	//$(".link.btn-modal-open2.post-detailRlyPopup").each(function(idx){
        	$(".btn-modal-open2.post-detailRlyPopup").each(function(idx){
       			var hdnMoviePostNo = $('#hdnMoviePostNo').val();
       			if($.trim($(this).data('no')) == hdnMoviePostNo){
       				var totCnt = $('#rlyCntTop').val();
       				$(this).html("<i class='iconset ico-reply'>댓글 수</i> "+totCnt);
       			}
       		});
        }
    });

}

/*좋아요 저장*/
function fn_addHeart(obj){

	var artiNo = $(obj).attr("arti-no");

	if (artiNo == null) return ;

	var allData = { artiNo:artiNo, artiDivCd: 'MOPO' };

	$.ajaxMegaBox({
        url: "/on/oh/oha/Movie/mergeMoviePostHeart.do",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
		data: JSON.stringify(allData),
		sessionAt:true,
        success: function (data, textStatus, jqXHR) {
			var resultMap = data.resultMap;

			if(resultMap.msg == "sessionFail"){
				gfn_alertMsgBox("로그인 후 이용가능한 서비스입니다.");
				return;
			}
			var text = "";
			$(obj).html('');
			if(resultMap.rowStatCd == "D"){
				text = "<i title=\"좋아요 설정 함\" class=\"iconset ico-like\"></i>"+resultMap.likeCnt;
				var artiNo = $(obj).attr("arti-no");

				$(".btn-like.listBtn").each(function(idx){
					if($.trim($(this).data('no')) == artiNo){
						var oriVal = $(this).find('span').html();	//좋아요 수
						var toVal = Number(oriVal)-1;				//좋아요 -1
						$(this).find('span').html(toVal);			//태그 적용
						$(this).find('i').removeClass('on');		//온클래스 제거
					}
				});
			}else{
				text = "<i title=\"좋아요 설정 안함\" class=\"iconset ico-like on\"></i>"+resultMap.likeCnt;
				var artiNo = $(obj).attr("arti-no");

				$(".btn-like.listBtn").each(function(idx){
					if($.trim($(this).data('no')) == artiNo){
						var oriVal = $(this).find('span').html();	//좋아요 수
						var toVal = Number(oriVal)+1;				//좋아요 +1
						$(this).find('span').html(toVal);			//태그 적용
						$(this).find('i').addClass('on');			//온클래스 추가
					}
				});
			}
			$(obj).append(text);
        }
    });
}


/*댓글저장 전처리*/
function fn_insertPostRlyPre(){
	var postRlyCn = $("#postRlyCn").val();

 	var fn_complete = function(list){
	      if ( list.length > 0 ) {
	          //alert(list.join(","));
	          gfn_alertMsgBox('허용되지 않는 단어가 포함되어 있습니다.'); //허용되지 않는 단어가 포함되어 있습니다.
	      } else {
	    	  fn_insertPostRly();
	      }
	 }

 	gfn_chkPrhword(postRlyCn,fn_complete);
}

/*댓글저장*/
function fn_insertPostRly(){

	var moviePostNo = detailPopup.moviePostNo;
	var postRlyCn = $("#postRlyCn").val();
	var allData = { moviePostNo:moviePostNo, postRlyCn:postRlyCn};

/* 	if(!confirm("등록 하시겠습니까?")){
		return;
	}
 */
//20190905 한줄평, 댓글 작성시 메세지 불필요  gfn_confirmMsgBox("등록 하시겠습니까?", function(){
 		$.ajaxMegaBox({
	        url: "/on/oh/oha/Movie/insertPostRly.do",
	        type: "POST",
	        contentType: "application/json;charset=UTF-8",
	        dataType: "json",
			data: JSON.stringify(allData),
			sessionAt:true,
            clickLmtChk: true, //중복클릭 방지 실행
	        success: function (data, textStatus, jqXHR) {
				var resultMap = data.resultMap;

				if(resultMap.msg == "sessionFail"){
					gfn_alertMsgBox("로그인 후 이용가능한 서비스입니다.");
					return;
				}

				if(resultMap.msg == 'already') return gfn_alertMsgBox('이미 작성된 댓글이 있습니다.');

				//20190905 한줄평, 댓글 작성시 메세지 불필요  gfn_alertMsgBox("댓글이 등록 되었습니다.");
				$(".text-count").text("0");
				$("#postRlyCn").val("");
				fn_moviePostRlySearch("search", moviePostNo, "rly");
            },complete: function(xhr){
            	clearLmt(); //중복제한 초기화

            }
	    });
	/////});
}



/*댓글 수정화면 취소버튼*/
function fn_writeCancel(moviePostRlyNo){
	$("#rlyWri"+moviePostRlyNo).hide();
	$("#rlyTxt"+moviePostRlyNo).show();
}

/*댓글 사이즈(수정화면)*/
function fn_postRlyCnValChk(moviePostRlyNo){
	var postRlyCn = $("#postRlyCn"+moviePostRlyNo).val();
	if(postRlyCn.length < 101){
		$("#textCount"+moviePostRlyNo).text(postRlyCn.length);
	}
}


/*******************************************************************
 * 무비포스트 상세 레이어팝업 관련 	*
 *******************************************************************/
 function fn_moviePostList(){
	//콜백함수
	 fn_moviePostRlySearch('search', detailPopup.moviePostNo);

}


 function fn_postDetail(moviePostNo, viewDiv, backScreen){
	console.log("MoviePostViewLayerPM.jsp");
	//console.log(moviePostNo);
	detailPopup.moviePostNo = moviePostNo;
	detailPopup.backScreen = backScreen;

	//댓글창 초기화
	$('.comment-function .reset .text-count').text(0);
	$('#postRlyCn').val('');
	$('#subscribe').css("display", "block");
	$('.balloon-space').removeClass('on');


	$.ajaxMegaBox({
		url: '/moviepost/layerDetail',
		type: "POST",
		contentType: "application/json;charset=UTF-8",
		dataType: "json",
		data: JSON.stringify({
			moviePostNo: moviePostNo
		}),
		success: function (data) {

			var detailInfo = data.postList[0];
			$('.post-detail .tit').html(detailInfo.moviePostMovieTitle); //무비포스트 제목
			$('.user-id').html(detailInfo.loginId);
			$('.user-write-time').html(detailInfo.fstRegDe);
			$('.user-post-box .user-info .photo').html('<img src="'+data.imgSvrUrl+detailInfo.profileImgPath+'" alt="'+detailInfo.loginId+'님의 무비포스트" onerror="noImg(this)"/>');
			$('.user-write-time').html(detailInfo.fstRegDe);
			detailPopup.mbNo = detailInfo.mbNo;
			detailPopup.movieNo = detailInfo.movieNo;

			if ((detailInfo.movieStatCd == 'MSC01' || detailInfo.movieStatCd == 'MSC02') && detailInfo.bokdAbleYn == 'Y') {
				$('#bokdLinkBtn').show();
				$('#bokdLinkBtn').data('no', detailInfo.movieNo);
				$('#bokdLinkBtn').attr('title', detailInfo.movieNm +' 예매하기');
			} else {
				$('#bokdLinkBtn').hide();
			}

			if('' != detailInfo.mbNo){ //무비포스트 쓴 회원과 홈페이지 접속한 회원이 같지 않은 경우

				$('.count .btn').attr('arti-no', moviePostNo); //좋아요 버튼에 무비포스트번호 셋팅

				//포스트 옵션 말풍선
				$('.balloon-space').removeClass('writer').addClass('user');
				var html ="";
				html += '<div class="user">';
			    html += '<p class="reset a-c">광고성 내용 및 욕설/비방하는<br />내용이 있습니까?</p>';
			    html += '<button type="button" data-no3="' + moviePostNo + '">포스트 신고 <i class="iconset ico-arr-right-green"></i></button>';
			    html += '</div>';
				html += '<div class="btn-close"><a href="#" title="닫기"><img src="../../../static/pc/images/common/btn/btn-balloon-close.png" alt="닫기" /></a></div>';
			    $('.balloon-space.mpost .balloon-cont').html(html);

				if(detailInfo.moviePostSbscAt == 'Y'){ //무비포스트구독여부가 Y면
					$('#subscribe').text('구독중');
				}else{
					$('#subscribe').text('구독하기');
				}
			}else {
				$('.count .btn').attr('arti-no', moviePostNo); //좋아요 버튼에 무비포스트번호 셋팅

				//포스트 옵션 말풍선
				$('.balloon-space').removeClass('user').addClass('writer');
				var html="";
				html += '<div class="writer layer-pop-detail">';
			    html += '<button type="button" data-no1="'+ moviePostNo +'" data-no2="'+ detailInfo.movieNo +'">수정</button>';
			    html += '<button type="button" data-no1="'+ moviePostNo +'">삭제</button>';
			    html += '</div>';
			    html += '<div class="btn-close"><a href="#" title="닫기"><img src="../../../static/pc/images/common/btn/btn-balloon-close.png" alt="닫기" /></a></div>';

			    $('.balloon-space.mpost .balloon-cont').html(html);

				$('#subscribe').css("display", "none");
			}

			//포스트 내용
		 	if(data.postList.length > 0){

		 		var metaTagImg = "";	//메타태그 이미지
		 		var htmlTxt = "";
		 		var img_Path = "";
		 		for(var i=0; i<data.postList.length; i++){
		 			if( i == 0 ){
		 				metaTagImg = data.imgSvrUrl + data.postList[i].imgPath
		 			}
					if(data.postList[i].moviePostImgDivCd == 'MIK01'){ //스틸컷(포스터)
						img_Path = nvl(data.postList[i].imgPath).posterFormat('_600');
						htmlTxt += '<div class="section">' ;
						htmlTxt += '<img src="'+ data.imgSvrUrl + img_Path + '"';
						htmlTxt += 'alt="" />';
						htmlTxt +='<p class="p-caption">';
						htmlTxt += data.postList[i].moviePostImgDesc.replaceAll('\n', '<br>');
						htmlTxt +='</p></div>';
					}
					else if(data.postList[i].moviePostImgDivCd == 'MIK02'){ //스틸컷
						img_Path = nvl(data.postList[i].imgPath).posterFormat('_648');
						htmlTxt += '<div class="section">';
						htmlTxt += '<img src="'+ data.imgSvrUrl+ img_Path + '"';
						htmlTxt += 'alt="" />';
						htmlTxt += '<p class="p-caption">';
						htmlTxt += data.postList[i].moviePostImgDesc.replaceAll('\n', '<br>');
						htmlTxt += '</p></div>';
					}
					else if(data.postList[i].moviePostImgDivCd == 'MIK03'){ //예고편동영상
						img_Path = nvl(data.postList[i].imgPath).posterFormat('_648');
						htmlTxt += '<div class="section">';
						htmlTxt += '<video controls poster="'+ data.imgSvrUrl + img_Path + '"';
						htmlTxt += '<source src="'+data.postList[i].moviePostVodUrl +'" type="video/mp4" ></video></video>';
						htmlTxt +=  '<p class="p-caption">';
						htmlTxt += data.postList[i].moviePostImgDesc.replaceAll('\n', '<br>');
						htmlTxt += '</p></div>';

					}
					else if(data.postList[i].moviePostImgDivCd == 'MOVIEPOST'){ //내사진
						htmlTxt += '<div class="section">';
						htmlTxt += '<img src="'+ data.imgSvrUrl + data.postList[i].imgPath+ '"';
						htmlTxt += 'alt="" />';
						htmlTxt +=  '<p class="p-caption">';
						htmlTxt += data.postList[i].moviePostImgDesc.replaceAll('\n', '<br>');
						htmlTxt += '</p></div>';

					}
					else{
						htmlTxt += '<div class="section">';
						htmlTxt += '<img src="'+ data.imgSvrUrl + data.postList[i].imgPath+ '"';
						htmlTxt += 'alt="" />';
						htmlTxt +=  '<p class="p-caption">';
						htmlTxt += data.postList[i].moviePostImgDesc.replaceAll('\n', '<br>');
						htmlTxt += '</p></div>';

					}
				}

		 		$('.post-cont-area .section-area').html(htmlTxt);

			}

			//좋아요 아이콘
			if(detailInfo.likeYn == "Y"){ //좋아요 Y

				var txt="";

				txt += '<i title="좋아요 설정 함" class="iconset ico-like on"></i>';
				txt += ' ' + detailInfo.likeCnt;

				$('.count .btn').html(txt);

			}else{ //좋아요 N

				var txt ="";

				txt += '<i title="좋아요 설정 안함" class="iconset ico-like"></i>';
				txt += ' '+ detailInfo.likeCnt;

				$('.count .btn').html(txt);

			}

			//댓글
			fn_moviePostRlySearch('search', moviePostNo, viewDiv);

			//무비포스트 상세 메타태그 설정
			fn_setMetaTag( detailInfo, moviePostNo, metaTagImg );

		}
	});
}

function fn_setMetaTag( detailInfo, moviePostNo, metaTagImg ){

	var attr	= "";
	if( moviePostNo != null && moviePostNo != '' )				attr = '?moviePostNo=' + moviePostNo;

	var url		= location.pathname + attr;
	if( detailPopup != null && detailPopup.backScreen != '' )	url  = '/moviepost/all' + attr;

 	metaFormat = {
			'scnTitle'			: '(' + gfn_charToHtml(detailInfo.moviePostMovieTitle) + ') 무비포스트 상세 | MEET PLAY SHARE, 메가박스'
			, 'metaTagTitle'	: '(' + gfn_charToHtml(detailInfo.moviePostMovieTitle) + ') 무비포스트 상세'
			, 'metaTagDtls'		: '메가박스의 다양한 무비포스트를 확인해보세요.'
			, 'metaTagImg'		: metaTagImg
			, 'metaTagUrl'		: url
 	};

 	//URL 변경
 	history.replaceState( null, null, location.origin + url );

 	//메타태그 설정
 	settingMeta(metaFormat);
}
</script>

					<!--################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
					<section id="layer_post_detail" class="modal-layer2">
						<div class="wrap">
							<header class="layer-header">
								<h3 class="tit">무비포스트 상세</h3>
							</header>

							<div class="layer-con">

								<div class="post-detail">
									<div class="tit-area mb30">
										<p class="tit"></p>

										<div class="direct-link">
											<a id="bokdLinkBtn" data-no="" href="" style="display: none;"
												title="">예매하기</a>
										</div>
									</div>


									<div class="user-post-box mb40">
										<div class="user-post-case">
											<!-- post-top-area -->
											<div class="post-top-area">

												<div class="user-info">
													<p class="photo">
														<img
															src="../../../static/pc/images/movie/img-P-MO-PO0101-user-img01.png"
															alt="userid80**님의 무비포스트">
													</p>

													<p class="user-id">
														<a href="" title="ID"></a>
													</p>

													<p class="user-write-time"></p>
												</div>


												<div class="btn-util">
													<!-- 구독하기 전 -->
													<button type="button" class="button x-small gray-line"
														id="subscribe"></button>
												</div>

												<!-- post-funtion -->
												<div class="post-funtion">
													<div class="wrapper">
														<button type="button" class="btn-alert mp">옵션보기</button>
														<!--
												유저 일때
												<div class="balloon-space user">

												작성자 일때
												<div class="balloon-space writer">
												-->
														<div class="balloon-space mpost">
															<div class="balloon-cont"></div>
														</div>
														<!--// 말풍선 -->
													</div>
												</div>
												<!--// post-funtion -->
											</div>
											<!--// post-top-area -->

											<div class="post-cont-area">
												<!-- post 내용  -->
												<div class="section-area"></div>
												<!--// post 내용 -->
											</div>

											<!-- comment count -->
											<div class="count">
												<button type="button" class="btn" arti-no="">
													<i title="좋아요 설정 안함" class="iconset ico-like"></i>
												</button>

												<!-- 코멘트 등록 영역으로 이동 -->

											</div>
											<!--// comment count -->



										</div>
									</div>


									<!-- share -->
									<div class="btn-post-share">
										<!-- 								<button type="button" title="카카오톡 공유하기" class="btn kakao">카카오톡</button> -->
										<button type="button" title="페이스북 공유하기" class="btn face">페이스북</button>
										<button type="button" title="밴드 공유하기" class="btn band">밴드</button>
										<button type="button" title="트위터 공유하기" class="btn twitter">트위터</button>
										<button type="button" title="링크 공유하기" class="btn link">링크공유</button>
									</div>
									<!--// share -->

									<!-- comment input -->
									<div class="comment-write mb40" id="rly">
										<div class="comment-util mb20">
											<p>
												<span id="rlyCnt">댓글 </span>
											</p>
											<input type="hidden" id="rlyCntTop" value=""> <input
												type="hidden" id="hdnMoviePostNo" value="">
										</div>

										<div class="comment" id="input-comment">
											<textarea class="input-textarea" cols="5" rows="5"
												id="postRlyCn" title="댓글 입력" name="postRlyCn"
												maxlength="100"></textarea>

											<div class="comment-function">
												<p class="reset">
													<span class="text-count">0</span> / 100
												</p>
												<div class="btn">
													<button type="button" id="btnPostRly">등록</button>
												</div>
											</div>
										</div>
									</div>
									<!--// comment input-->

									<!-- comment list -->
									<div class="comment-list" id="commentList"></div>
									<!--// comment list -->

									<div class="mb50"></div>

								</div>
							</div>
							<button type="button" class="btn-modal-close2">레이어 닫기</button>
						</div>
					</section>
					<!-- // ################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
					<!-- //무비포스트 상세 레이어팝업 -->

					<!--// 레이어 : 관람평 등록 -->
				</div>

				<div class="add-area infoContent" id="boxoInfoContent" style="">
					<!--   <script data-id="rCtUfvdfQ9GXwkbPpeGpWg" name="megabox_p/sub/sub@sub_bottom_1100x227?mlink=345" src="//cast.imp.joins.com/persona.js" async></script>-->
					<script data-id="QZQTH4gyTeSwib9iz79Vig"
						name="megabox_p/sub/sub@sub_bottom_1100x80?mlink=431"
						src="//cast.imp.joins.com/persona.js" async=""></script>
					<script
						src="//cast.imp.joins.com/body/QZQTH4gyTeSwib9iz79Vig/jPfCCh8tg1_Ef0ws5eBgkXfnqZnnRiRBtc-1kUGVmrmEAM4qWzAZAbZXeTd0VUJUOFJtV3JVWGlQbEZqaE5BAstB2Lie5Z8K6wPLQdi4nuWfCus.js"></script>
					<div id="QZQTH4gyTeSwib9iz79Vig">
						<iframe
							src="//ad.imp.joins.com/html/megabox_p/sub/sub@sub_bottom_1100x80?_cid=QZQTH4gyTeSwib9iz79Vig&amp;_uid=jPfCCh8tg1_Ef0ws5eBgkXfnqZnnRiRBtc-1kUGVmrmEAM4qWzAZAbZXeTd0VUJUOFJtV3JVWGlQbEZqaE5BAstB2Lie5Z8K6wPLQdi4nuWfCus&amp;_ref=https%3A%2F%2Fwww.megabox.co.kr%2Fmovie-detail%3FrpstMovieNo%3D21084100"
							title="영화상세 하단 배너영역" height="80px" width="100%" name="mliframe"
							scrolling="no" frameborder="0" topmargin="0" leftmargin="0"
							marginwidth="0" marginheight="0"></iframe>
					</div>
				</div>


			</div>
			<!--// contents -->
		</div>
		<!--// container -->
		<!-- 		</div> -->




		<section id="saw_movie_regi" class="modal-layer">
			<a href="" class="focus">레이어로 포커스 이동 됨</a> <input type="hidden"
				id="isLogin">
			<div class="wrap">
				<header class="layer-header">
					<h3 class="tit">본 영화 등록</h3>
				</header>

				<div class="layer-con">
					<p class="reset">발권하신 티켓 하단의 거래번호 또는 예매번호를 입력해주세요.</p>

					<div class="pop-gray mt10 mb30">
						<label for="movie_regi" class="mr10">거래번호 또는 예매번호</label> <input
							type="text" id="movie_regi" class="input-text w280px numType"
							maxlength="20" placeholder="숫자만 입력해 주세요" title="티켓 거래번호 입력">
						<button class="button gray ml05" id="regBtn">등록</button>
					</div>

					<div class="box-border v1 mt30">
						<p class="tit-box">이용안내</p>

						<ul class="dot-list">
							<li>극장에서 예매하신 내역을 본 영화(관람이력)로 등록하실 수 있습니다.</li>
							<li>예매처를 통해 예매하신 고객님은 극장에서 발권하신 티켓 하단의 온라인 예매번호 <br>12자리를
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

		<%@ include file="/WEB-INF/views/footer.jsp"%>
		<div id="layer_looking_theater" class="layer-looking-theater"></div>
		</footer>
		<!--// footer -->

		<!-- 모바일 때만 출력 -->
		<div class="go-mobile" style="display: none;">
			<a href="#" data-url="https://m.megabox.co.kr">모바일웹으로 보기 <i
				class="iconset ico-go-mobile"></i></a>
		</div>
	</div>
	<form id="mainForm"></form>

	<div class="normalStyle"
		style="display: none; position: fixed; top: 0; left: 0; background: #000; opacity: 0.7; text-indent: -9999px; width: 100%; height: 100%; z-index: 100;">닫기</div>
	<div class="alertStyle"
		style="display: none; position: fixed; top: 0px; left: 0px; background: #000; opacity: 0.7; width: 100%; height: 100%; z-index: 5005;"></div>
</body>
</html>