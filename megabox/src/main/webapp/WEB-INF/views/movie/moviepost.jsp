<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<c:set var="path" value="${pageContext.request.contextPath}" />
<html lang="ko">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=yes">
<link rel="shortcut icon" href="/static/pc/images/favicon.ico">





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
<title>모든영화 &lt; 무비포스트 | MEET PLAY SHARE, 메가박스</title>
<meta property="name" id="metaTagTitle" content="무비포스트">
<meta property="description" id="metaTagDtls"
	content="메가박스의 다양한 무비포스트를 확인해보세요.">
<meta property="keywords" id="metaTagKeyword"
	content="메가박스,megabox,영화,영화관,극장,티켓,박스오피스,상영예정작,예매,오페라,싱어롱,큐레이션,필름소사이어티,클래식소사이어티,이벤트,Movie,theater,Cinema,film,Megabox">

<meta property="fb:app_id" id="fbAppId" content="546913502790694">


<meta property="og:site_name" id="fbSiteName" content="메가박스">
<meta property="og:type" id="fbType" content="movie">
<meta property="og:url" id="fbUrl" content="/moviepost/all">
<meta property="og:title" id="fbTitle" content="무비포스트">
<meta property="og:description" id="fbDtls"
	content="메가박스의 다양한 무비포스트를 확인해보세요.">
<meta property="og:image" id="fbImg"
	content="https://img.megabox.co.kr/SharedImg/metaTag/2020/02/04/gFfTzMwwiCxhBwcUV5TRGMFX9Cmoj64W.jpg">



<style type="text/css">
.scrollLock {
	overflow: hidden;
}

.swal-icon {
	/* background-color: #503396; */
	
}

.swal-button {
	background-color: #503396;
}

.shadow {
	position: fixed;
	left: 0;
	top: 0;
	background: rgba(0, 0, 0, 0.52);
	width: 100%;
	height: 100vh;
	display: none
}
</style>
<div class="shadow"></div>


<title>모든영화 &lt; 무비포스트 | MEET PLAY SHARE, 메가박스</title>





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
<script src="${path}/resources/js/hmac-sha256.js"></script>
<script src="${path}/resources/js/enc-base64-min.js"></script>
<%-- <script src="${path}/resources/js/front.js"></script> --%>
<script src="${path}/resources/js/ui.common.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>




<script type="text/javascript">
var msg = '${msg}';
if(msg != "") {
	alert(msg);
}
  		
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
<script src="/static/pc/js/ui.common.js?v=1661365096294"></script>
<script
	src="//cast.imp.joins.com/head/ADVFHKFdlgh7cMQ5BnY0P4326WpTHDFaXUk_O8U2CsyEAM4qWzAZAbZfZjZmZ3BnYlF1T1dLMEZDV1VPUW5nAstB2MGGWPOo9gPLQdjBhljzqPY.js?url=https%3A%2F%2Fwww.megabox.co.kr%2Fmoviepost%2Fall&amp;ref=https%3A%2F%2Fwww.megabox.co.kr%2F"></script>
<script src="/static/pc/js/front.js?v=1661365096294"></script>
</head>

<body class="vsc-initialized">

	<div class="skip" title="스킵 네비게이션">
		<a href="#contents" title="본문 바로가기">본문 바로가기</a> <a href="#footer"
			title="푸터 바로가기">푸터 바로가기</a>
	</div>

	<div class="body-wrap">










		<!-- <script async defer src="https://connect.facebook.net/en_US/sdk.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script> -->
		<script src="/static/mb/js/hmac-sha256.js"></script>
		<script src="/static/mb/js/enc-base64-min.js"></script>
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
function layer_close(){
	//레이어 닫기
	var data22 = $('.wrap > div > .target').attr("data-no");
	var data23 = $('post-detailPopup btn-modal-open2 target').attr("data-no");
	//alert(data22);
	
	$(".wrap > div > a").removeClass("target");
	$('#layer_post_detail').removeClass('on');
	//$(".shadow").hide();
	const body = document.getElementsByTagName('body')[0];
	body.classList.remove('scrollLock');
}
$(function(){
	$("#postdelete").click(function(){	var post = $(this).attr("post-no");
	var userid = $(this).attr("userid");
	var s_id = '${sessionScope.loginId}'
	if (userid != s_id) return gfn_alertMsgBox('작성자 아닙니다.');
		swal('무비포스트를  삭제 하시겠습니까 ?', '', '', {
    		closeOnClickOutside: false,
        	closeOnEsc: false,
       		buttons : {
            confirm : {
            	text : 'Yes',
            	value : true,
            	className : 'btn btn-outline-primary'
            	}
			,
			  cancle : {
                	text : 'No',
                	value : false,
                	className : 'btn btn-outline-primary'
                	}
    	}
    	}).then((result) => {
    		if(result){
    		
    			location.href='${path}'+'/postdelete?p_num='+post;	
    		}else{
    			//취소 눌렀을때 
    			}
    	});
	});
	$(".wrap > div > #aclick").click(function(){
		//$(".shadow").show();
		var post = $(this).attr("post-no");
		var movie = $(this).attr("movie-no");
		var user_num = $(this).attr("user-no");
		$('#layer_post_detail').addClass('on');
		
		var imgPath = $(this).attr("data-url");
		var postdate = $(this).attr("post-date");
		var userid = $(this).attr("data-id");
		var m_name = $(this).attr("alt");
		var postcon = $(this).find('div').text();
		
		//var m_name = $(this).find('img').attr("alt");
		//var imgPath = $(this).find('img').attr("src");
		//alert("포스트번호 : "+post +"\n"+"영화번호 : "+movie+"\n"+"이미지경로 : "+postcon);
		if (user_num == 'sessionScope.loginNum'){
			data = "";
		}else{
			data = "";
		}
		$(".section-area > div > img").attr("src",imgPath);
		$("#postRlyCn").attr("post-no",post);
		$("#postRlyCn").attr("userid",userid);
		$("#postdelete").attr("post-no",post);
		$("#postdelete").attr("userid",userid);
		$("#posttitle").text(m_name);
		$("#postdate").text(postdate);
		$("#postcontent").text(postcon);
		$("#userid").text(userid);
		const body = document.getElementsByTagName('body')[0];
		body.classList.add('scrollLock');
		
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
													alt="페이스북"> <!--페이스북--> 페이스북으로 로그인<!--페이스북으로 로그인--></a> <a
													href="javaScript:void(0)" lnkgty="NAVER"
													title="네이버로 로그인 선택"><img
													src="../../../static/pc/images/member/ico-naver.png"
													alt="네이버"> <!--네이버--> 네이버로 로그인<!--네이버로 로그인--></a> <a
													href="javaScript:void(0)" lnkgty="KAKAO"
													title="카카오톡으로 로그인 선택"><img
													src="../../../static/pc/images/member/ico-kakao.png"
													alt="카카오톡"> <!--카카오톡--> 카카오톡으로 로그인<!--카카오톡으로 로그인--></a> <a
													href="javaScript:void(0)" lnkgty="PAYCO"
													title="페이코로 로그인 선택"><img
													src="../../../static/pc/images/member/ico-payco.png"
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



		<%@ include file="/WEB-INF/views/header.jsp"%>

		<!-- 		<div id="bodyContent"> -->




		<!-- <script src="/static/pc/js/front.js"></script> -->
		<script type="text/javascript">
var msnry;
var scrollTop = '';
var currentPage = '';
var recordCountPerPage = '';

$(function(){
	/*최신순, 공감순 sort 탭*/
	$("#sortTab").on("click","button", function(){
		var sortType = "";
		$(".btn").removeClass("on");
		$(this).addClass("on");
		$("#pageType").val($(this).attr("sort-type"));

		recordCountPerPage = 12;

		fn_moviePostSerach();
	});

	// 상단 탭 클릭
	$('.tab-sorting button').on('click', function() {
		$('.tab-sorting button.on').removeClass('on');
		$(this).addClass('on');
		$('#tabType').val($(this).data('type'));

		recordCountPerPage = 12;

		$("#moviePostId").val('');

		fn_moviePostSerach();
	});

	/*검색 버튼*/
	$("#btnSearch").click(function(){
		fn_moviePostSerach();
	});

	/*더보기 버튼*/
	$("#btnAddMovie").click(function(){
		fn_moviePostSerach(true);
	});

	/*개봉작만보기*/
	$("#btnOnAir").click(function(){
		var onairYn = $("#onairYn").val();

		if(onairYn == "N"){
			$("#onairYn").val("Y");
		}else{
			$("#onairYn").val("N");
		}
		$("#moviePostId").val('');
		fn_moviePostSerach();
	});

	$(document).on('click','.good .btn', function(){
		fn_addHeart(this);
	});

	/* 검색 input enter key 이벤트 */
	$("#ibxMovieNmSearch").on("keydown", function(e){
		var keycode = (e.keyCode ? e.keyCode : e.which);
		if(keycode == 13){
			$("#moviePostId").val('');
			fn_moviePostSerach();
		}
	});

	// TOP5 무비포스트 이동
	$('.top5Btn').on('click', function(e) {
		e.preventDefault();

		$("#ibxMovieNmSearch").val($(this).data('no'));
		$("#moviePostId").val('');
		fn_moviePostSerach();
		//fn_moviePostDetail($(this).data('no'));
	});

	// 나의 무비포스트 모아보기
	$('.myPostBtn').on('click', function(e) {
		//e.preventDefault();
		//fn_myMoviePostDetail($(this).data('no'));
		$("#moviePostId").val('');
		fn_mypageMoviePost();
	});

	// 무비포스트 작성 클릭
	$('.add-post a').on('click', function(e) {
		var userid ='${sessionScope.loginId}';
		if(userid==""|| userid == null){
			//gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');
			swal('로그인 후 이용 가능한 서비스 입니다.', '', '', {
        		closeOnClickOutside: false,
            	closeOnEsc: false,
           		buttons : {
                confirm : {
                	text : '확인',
                	value : true,
                	className : 'btn btn-outline-primary'
                	}
				,
				  cancle : {
	                	text : '취소',
	                	value : false,
	                	className : 'btn btn-outline-primary'
	                	}
        	}
        	}).then((result) => {
        		if(result){
        			//확인 눌렀을떄 로그인으로 보내기  
        			//location.href='../login';
        			
        		}else{
        			//취소 눌렀을때 
        			
        			}
        	});
		}else{
			 location.href = '${path }/write';
		}
	});

	/*무비포스트 목록 가져오기*/
	//fn_moviePostSerach(false, '');

});

// 페이지 이동
function fn_mvPage() {
	fn_viewLoginPopup('MbLoginMainV','pc');
}

/*무비포스트 가져오기*/
function fn_moviePostSerach(paging, moviePostNo){
	if(paging) {
		currentPage = parseInt(currentPage) + 1;
		recordCountPerPage = 12;
	} else {
		currentPage = 1;
		if(recordCountPerPage) {
			recordCountPerPage = currentPage > 1 ? recordCountPerPage * currentPage : recordCountPerPage;
		} else {
			recordCountPerPage = 12;
		}
	}

	$("#currentPage").val(currentPage + "");

	var paramData = {
		currentPage: currentPage + '',
		recordCountPerPage: recordCountPerPage + '',
		pageType: $("#pageType").val(),
		ibxMovieNmSearch: $("#ibxMovieNmSearch").val(),
		onairYn: $("#onairYn").val(),
		tabType: $("#tabType").val(),
		moviePostId : $("#moviePostId").val(),
		position: 'moviePostPaging',
		json: true
	};

	gfn_logdingModal();

	$.ajaxMegaBox({
        url: "/on/oh/oha/Movie/selectMoviePostList.do",
		data: JSON.stringify(paramData),
        success: function (d) {
        	var list = d.moviePostList;
        	var target = $('.movie-post-list');
        	var totalCnt = 0;
        	var option = {
       			data: list,
       			imgSvrUrl: d.imgSvrUrl,
       			loginId: '',
       			moviePostNo: moviePostNo,
       			moreTarget: 'addMovieDiv'
        	};

        	if(list.length > 0) {
        		totalCnt = list.length > 0 ? list[0].totCnt : 0;
    	        target.show();

        		// 무비포스트 리스트 생성
            	MegaboxUtil.MoviePost.createMoviePostList(target, option, paging, '');

        		var pageNo = Math.ceil(totalCnt / recordCountPerPage);
				if(currentPage < pageNo) $('.btn-more').show();
				else $('.btn-more').hide();


            	$('.no-moviepost').hide();
        	} else {
        		if (totalCnt < 1) {
        	        target.hide();
                	$('.btn-more').hide();
        		}
        		$('.no-moviepost').show();
        	}

        	$('.result-count-cnt').html(Number(totalCnt).format());

        	if(scrollTop > 0) {
        		$(document).scrollTop(scrollTop);
        	}

        	setTab(  );

        	//파라미터 존재시 상세 노출
        	$('.target img').click();

        	gfn_logdingModal();
        }
    });
}

/**
* 탭메뉴 설정
*/
function setTab( moviePostNo ){

	var attr = "";
	if( moviePostNo != null && moviePostNo != ''){
		attr = '?moviePostNo=' + moviePostNo;
	}

	switch( $("#tabType").val() ) {
		default :
			url 	= '/moviepost/all' + attr;
			metaFormat = {
				'scnTitle'			: '모든영화 < 무비포스트 | MEET PLAY SHARE, 메가박스'
				, 'metaTagTitle'	: '무비포스트'
				, 'metaTagDtls'		: '메가박스의 다양한 무비포스트를 확인해보세요.'
				, 'metaTagUrl'		: url
				};
			break;
		case "live"  :
			url 	= '/moviepost/showing' + attr;
			metaFormat = {
				'scnTitle'			: '현재상영작 < 무비포스트 | MEET PLAY SHARE, 메가박스'
					, 'metaTagTitle'	: '무비포스트'
					, 'metaTagDtls'		: '메가박스의 다양한 무비포스트를 확인해보세요.'
					, 'metaTagUrl'		: url
					};
			break;
		case "seen"  :
			url 	= '/moviepost/seen' + attr;
			metaFormat = {
				'scnTitle'			: '내가 본 영화 < 무비포스트 | MEET PLAY SHARE, 메가박스'
					, 'metaTagTitle'	: '무비포스트'
					, 'metaTagDtls'		: '메가박스의 다양한 무비포스트를 확인해보세요.'
					, 'metaTagUrl'		: url
					};
			break;
		case "subscribe"  :
			url 	= '/moviepost/subscribe' + attr;
			metaFormat = {
				'scnTitle'			: '구독중인포스트 < 무비포스트 | MEET PLAY SHARE, 메가박스'
					, 'metaTagTitle'	: '무비포스트'
					, 'metaTagDtls'		: '메가박스의 다양한 무비포스트를 확인해보세요.'
					, 'metaTagUrl'		: url
					};
			break;
	}

	//URL 변경
	history.replaceState( null, null, location.origin + url );

	//메타태그 설정
	settingMeta(metaFormat);
}

/*좋아요 저장*/
function fn_addHeart(obj){
	var artiNo = $(obj).attr("arti-no");
	var allData = { artiNo:artiNo, artiDivCd: 'MOPO' };
	var idx = $(".good .btn").index(obj);

	if( !sessionAllow( {sessionAt:true} ) ) return

	$.ajaxMegaBox({
        url: "/on/oh/oha/Movie/mergeMoviePostHeart.do",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
		data: JSON.stringify(allData),
		sessionAt: true,
        success: function (data, textStatus, jqXHR) {
			var resultMap = data.resultMap;

			if(resultMap.msg == "sessionFail"){
				gfn_alertMsgBox("로그인 후 이용가능한 서비스입니다.");
				return;
			}
			if(resultMap.rowStatCd == "D"){
				$(obj).find("i").attr('title', '좋아요 설정 안함');
				$(obj).find("i").removeClass("on");

			}else{
				$(obj).find("i").attr('title', '좋아요 설정 함');
				$(obj).find("i").addClass("on");
			}
        },
        error: function(xhr,status,error){
        	 var err = JSON.parse(xhr.responseText);
        	 alert(xhr.status);
        	 alert(err.message);
        }
    });
}

//마이페이지 이동 - 무비포스트
function fn_mypageMoviePost(){
	var contentUrl = "/mypage/moviestory";
	$("#moviePostForm").append("<input type='hidden' name='cd' value='mp' />");
	$("#moviePostForm").attr("method","post");
	$("#moviePostForm").attr("action",contentUrl);
	$("#moviePostForm").submit();
}


//무비포스트 상세페이지 이동
function fn_moviePostDetail(moviePostNo){
	var contentUrl = "/moviepost/detail";
	$("#moviePostForm").append("<input type='hidden' name='moviePostNo' value='" + moviePostNo + "' />");
	$("#moviePostForm").attr("method","get");
	$("#moviePostForm").attr("action",contentUrl);
	$("#moviePostForm").submit();
}

//무비포스트 나의 모아보기 페이지 이동
function fn_myMoviePostDetail(mbNo){
	var contentUrl = "/on/oh/oha/Movie/selectCollectMoviePostDetail.do";
	$("#moviePostForm").append("<input type='hidden' name='mbNo' value='" + mbNo + "' />");
	$("#moviePostForm").attr("method","get");
	$("#moviePostForm").attr("action",contentUrl);
	$("#moviePostForm").submit();
}

// 무비포스트 등록 페이지 이동
function fn_moviePostWrite(){
	$.ajax({
        url: "/on/oh/oha/Movie/loginChk.do",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
// 		data: JSON.stringify(allData),
		sessionAt:true,
        success: function (data, textStatus, jqXHR) {
			var resultMap = data.resultMap;

			if(resultMap.msg == "sessionFail"){
				gfn_alertMsgBox({ msg: '로그인 후 이용가능한 서비스입니다.', callback: fn_moveLoginPage });

				return;
			}

			var contentUrl = "/moviepost/write";
			$("#moviePostForm").attr("method","post");
			$("#moviePostForm").attr("action",contentUrl);
			$("#moviePostForm").submit();
        },
        error: function(xhr,status,error){
        	 var err = JSON.parse(xhr.responseText);
        	 alert(xhr.status);
        	 alert(err.message);
        }
    });
}

// 로그인 페이지 이동
function fn_moveLoginPage() {
	$('[name=menuId]').val('MoviePistV');
	$('[name=mappingId]').val(location.pathname);

	var form = $('#moviePostForm');
	form.attr('action', '/on/oh/ohg/MbLogin/viewMbLoginMainPage.rest');
	form.submit();
}

</script>


		<form id="moviePostForm" method="post">
			<input type="hidden" name="menuId"> <input type="hidden"
				name="mappingId">
		</form>
		<input type="hidden" id="currentPage" name="currentPage" value="1">
		<input type="hidden" id="recordCountPerPage" name="recordCountPerPage"
			value="10"> <input type="hidden" id="pageType"
			name="pageType" value="">
		<!-- date -->
		<input type="hidden" id="tabType" name="tabType" value="all">
		<!-- all -->
		<input type="hidden" id="onairYn" name="onairYn" value="">
		<!-- N -->

		<div class="container">
			<!-- page-tit-area -->
			<div class="page-util">
				<div class="inner-wrap">
					<div class="location">
						<span>Home</span> <a href="/movie" title="영화 페이지로 이동">영화</a> <a
							href="/moviepost/all" title="무비포스트 페이지로 이동">무비포스트</a>
					</div>


				</div>
			</div>
			<!--// page-tit-area -->

			<div id="contents" class="pt00">
				<!-- post lank  -->
				<div class="post-lank-box" height="90px">
					<div class="inner-wrap">
						<h2 class="tit">무비포스트</h2>
						<!-- post-lank -->
						<ol class="post-lank" style="display: none;">


							<li><a href="#" class="top5Btn" data-no="범죄도시 2"
								title="범죄도시 2 무비포스트 보기">
									<p class="lank">1</p>

									<div class="post-count">
										<p class="tit">POST</p>
										<p class="count">1,018</p>
									</div>

									<p class="img">
										<img
											src="https://img.megabox.co.kr/SharedImg/2022/05/23/oZfETtpEvKGpdY2JQo2Z6wFL0S4cpKy5_150.jpg"
											onerror="noImg(this)" alt="범죄도시 2">
									</p>
							</a></li>




						</ol>
						<!--// post-lank -->














						<!-- mypost-box -->
						<div class="mypost-box" style="display: none;">


							<!-- 로그인 후 포스터가 0개 일때 -->
							<div class="after">
								<p class="lank">My</p>
								<div class="post-count">
									<p class="tit">MY POST</p>
									<p class="count">0</p>
								</div>
								<div class="txt-info">
									작성된 포스트가<br> 없습니다.
								</div>
							</div>



						</div>
						<!--// mypost-box -->

						<!-- add-post -->
						<div class="add-post">
							<a href="#" class="button purple" title="무비포스트 작성">무비포스트 작성</a>
						</div>
						<!--// add-post -->
					</div>
				</div>
				<!--// post lank -->

				<!--content:Start -->
				<div class="inner-wrap mt30">
					<div class="tab-sorting mb40">
						<button type="button" class="on" data-type="all">모든영화</button>
						<!-- <button type="button" data-type="live">현재상영작</button>


						<button type="button" data-type="seen">내가 본 영화</button>
						<button type="button" data-type="subscribe">구독중인 포스트</button> -->

					</div>

					<div class="board-list-util">
						<p class="result-count">
							<strong>전체 <b class="result-count-cnt">${fn:length(list) }</b>건
							</strong>
						</p>

						<!-- <div class="sorting" id="sortTab">
							<span><button type="button" class="btn on"
									sort-type="date">최신순</button></span> <span><button
									type="button" class="btn" sort-type="like">공감순</button></span>
						</div> -->

						<!-- <div class="board-search">
							<input type="text" id="ibxMovieNmSearch" name="ibxMovieNmSearch"
								title="검색어를 입력해 주세요." placeholder="제목, 장르, 감독, 배우, 아이디"
								class="input-text" value=""> <input type="hidden"
								id="moviePostId" name="moviePostId" value="">
							<button type="button" class="btn-search-input" id="btnSearch">검색</button>
						</div> -->
					</div>

					<!-- 2019-04-19 : 무비 포스트 완전 바뀜. 재작업 -->
					<!-- movie-post-list -->

					<div class="movie-post-list" id="moviePostList"
						style="position: relative; height: 2611.59px;">

						<c:forEach var="list" items="${list }" varStatus="status">
							<div class="grid-item"
								style="position: absolute; left:${status.index % 4 * 270}px; top: ${Math.floor(status.index / 4 )*408}px;">
								<div class="wrap">
									<div class="img">
										<a id="aclick" title="무비포스트 상세보기"
											class="post-detailPopup btn-modal-open2" w-data="850"
											h-data="auto" post-no="${list.p_num}" data-id="${list.u_id }" user-no="${list.u_num }"
											movie-no="${list.m_num}" data-row="${status.count}"
											post-date="${list.p_time }" alt="${map[list.m_num].m_name}"
											data-url="${path }/resources/img/upload/${list.p_image }">
											<img src="${path }/resources/img/upload/${list.p_image }"
											alt="${map[list.m_num].m_name}"> /&gt;
											<div style="display: none;">${list.p_content }</div>
										</a>
									</div>
									<div class="cont">
										<div class="writer">
											<a href="#" title="${list.u_id }님의 무비포스트 보기"
												class="moviePostId" data-id="${list.u_id }">${list.u_id }</a>
											<c:if test="${list.u_id == sessionScope.loginId}">
												<p class="my">my</p>
											</c:if>

										</div>

										<a href="movie-detail?rpstMovieNo=${list.m_num}"
											title="${map[list.m_num].m_name} 상세보기"> <%-- --%>
											<p class="tit">${map[list.m_num].m_name}</p>
										</a> <a id="aclick" title="무비포스트 상세보기"
											class="link btn-modal-open2 post-detailPopup" w-data="850"
											h-data="auto" post-no="${list.p_num}" data-id="${list.u_id }" user-no="${list.u_num }"
											movie-no="${list.m_num}" data-row="${status.count}"
											post-date="${list.p_time }" alt="${map[list.m_num].m_name}"
											data-url="${path }/resources/img/upload/${list.p_image }">
											<div style="display: none;">${list.p_content }</div>
											<p class="txt">${list.p_content }</p>
											<p class="time">${list.p_time }</p>
										</a>
										<div class="condition">
											<button type="button"
												class="btn-like postLikeBtn listBtn jsMake"
												data-no="${list.m_num}">
												<i class="iconset ico-like">좋아요 수</i> <span class="none">${list.p_like}</span>
											</button>
											<a href="#layer_post_detail" title="댓글 작성하기"
												class="link btn-modal-open2 post-detailRlyPopup"
												w-data="850" h-data="auto" data-no="${list.m_num}"
												data-row="1" data-tot="192613"><i
												class="iconset ico-reply">댓글 수</i> 0</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>

					<div class="no-moviepost" style="display: none;">등록된 무비포스트가
						없습니다.</div>

					<div class="btn-more" style="">
						<button type="button" class="btn" id="btnAddMovie">
							더보기 <i class="iconset ico-btn-more-arr"></i>
						</button>
					</div>

				</div>
				<!--content:End -->
			</div>
			<!--// contents -->

			<!-- 무비포스트 상세 레이어팝업 -->

			<!-- 무비포스트 상세 레이어팝업 -->










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
		alert("dwdwd");
		var u_id ='${sessionScope.loginId}';
		if(u_id==""|| u_id == null) return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');

		var u_num ='${sessionScope.loginNum}';
		var d_content = $('#postRlyCn').val();
		$('#postRlyCn').val("");
		
		var p_num = $('#postRlyCn').attr("post-no");
		if(gfn_isEmpty(d_content)) return gfn_alertMsgBox('내용을 입력하세요');
		var params = {
				p_num     : p_num
	    	  ,	d_content     : d_content
     	 }
		$.ajax({
			type: "post", //요청 메소드 방식
			url:"reply",
			 //서버가 요청 URL을 통해서 응답하는 내용의 타입
			data : JSON.stringify(params),
			contentType:"application/json; charset=UTF-8",
			success : function(){
				alert("성공");
			},
			error : function(){
				alert("실패");
			}
		});	
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
						htmlTxt += '<source src="'+data.postList[i].moviePostVodUrl +'" type="video/mp4" /></video>';
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
			<section id="layer_post_detail" class="modal-layer2"
				style="z-index: 501;">
				<a href="" class="focus">레이어로 포커스 이동 됨</a>
				<div class="wrap"
					style="width: 850px; margin-left: -425px; margin-top: 0px; margin-bottom: 100px; top: 100px;">
					<header class="layer-header">
						<h3 class="tit">무비포스트 상세</h3>
					</header>

					<div class="layer-con">

						<div class="post-detail">
							<div class="tit-area mb30">
								<p id="posttitle" class="tit">영화제목</p>

								<div class="direct-link">
									<a id="bokdLinkBtn" data-no="" href="" style="" title="">예매하기</a>
								</div>
							</div>


							<div class="user-post-box mb40">
								<div class="user-post-case">
									<!-- post-top-area -->
									<div class="post-top-area">

										<div class="user-info">
											<p class="photo">
												<img src="${path}/resources/img/bg-photo.png" alt="무비포스트">
											</p>

											<p id="userid" class="user-id">유저아이디</p>

											<p id="postdate" class="user-write-time">포스트 등록일</p>
										</div>


										<div class="btn-util">
											<!--
											<button type="button" class="button x-small gray-line"
												id="subscribe" style="display: block;">구독하기</button> -->
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
												<div class="balloon-space mpost writer">
													<div class="balloon-cont">
														
														<a  type="button" id="postdelete">삭제</a>
														<div class="btn-close">
															<a href="#" title="닫기">X</a>
														</div>
													</div>
												</div>
												<!-- <div class="balloon-space mpost user">
													<div class="balloon-cont">
														<div class="user">
															<p class="reset a-c">
																광고성 내용 및 욕설/비방하는<br>내용이 있습니까?
															</p>
															<button type="button" data-no3="212119">
																포스트 신고 <i class="iconset ico-arr-right-green"></i>
															</button>
														</div>
														<div class="btn-close">
															<a href="#" title="닫기"><p>X</p></a>
														</div>
													</div>
												</div> -->
												<!--// 말풍선 -->
											</div>
										</div>
										<!--// post-funtion -->
									</div>
									<!--// post-top-area -->

									<div class="post-cont-area">
										<!-- post 내용  -->
										<div class="section-area">
											<div class="section">
												<img alt="">
												<p id="postcontent" class="p-caption">영화내용</p>
											</div>
										</div>
										<!--// post 내용 -->
									</div>

									<!-- comment count -->
									<div class="count">
										<button type="button" class="btn" arti-no="212119">
											<i title="좋아요 설정 안함" class="iconset ico-like"></i> 0
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
										<span id="rlyCnt">댓글 (0)</span>
									</p>
									<input type="hidden" id="rlyCntTop" value="0"> <input
										type="hidden" id="hdnMoviePostNo" value="212119">
								</div>

								<div class="comment" id="input-comment">
									<textarea class="input-textarea" cols="5" rows="5"
										id="postRlyCn" title="댓글 입력" name="postRlyCn" maxlength="100"></textarea>

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
							<div class="comment-list" id="commentList">








								<script type="text/javascript">
$(function(){
	// list size가 recordCountPerPage 보다 작으면 더보기 버튼 hide
	var listSize = parseInt('0');
	var recordCountPerPage = parseInt($('#recordCountPerPage').val());
	var currentPage = parseInt($('#currentPage').val());
	var totCnt = '0';

	// 더보기 버튼 제어
	if(recordCountPerPage > listSize) $('#addMovieDiv').hide();
	else $('#addMovieDiv').show();

	$('#rlyCnt').text('댓글 (0)');
	$('#rlyCntTop').val('0');
	$('#hdnMoviePostNo').val('212119');	//파라메타 영화번호


	// 옵션보기 버튼
	$('.btn-alert.rly').off().on('click', function() {
		$(this).next().toggle();
	});

	// 옵션창 닫기
	$('.balloon-space.rly .btn-close').off().on('click', function() {
		$(this).parents('.balloon-space.rly').hide();
	});

	// 댓글 수정 텍스트아레아 키보드 이벤트
	$('.postRlyCn').off().on('keyup', function() {
		$(this).parent().find('.text-count').text($(this).val().length);
	});

	// 댓글 수정 버튼
	$('.rlyUpdateBtn').off().on('click', function() {
		var idx = $('.rlyUpdateBtn').index(this);

		var postRlyCn = $(this).parents('.comment').find('textarea').val();
		if(gfn_isEmpty(postRlyCn)) return gfn_alertMsgBox('내용을 입력해주세요.');

	 	var fn_completeMod = function(list){
		      if ( list.length > 0 ) {
		          //alert(list.join(","));
		          gfn_alertMsgBox('허용되지 않는 단어가 포함되어 있습니다.'); //허용되지 않는 단어가 포함되어 있습니다.
		      } else {
		    	  fn_insertPostRlyMod(idx);
		      }
		 }

	 	gfn_chkPrhword(postRlyCn,fn_completeMod);

	});

	// 댓글 취소 버튼
	$('.rlyCancelBtn').off().on('click', function() {
		$(this).parents('.user-comment').find('.comment-write').hide();
		$(this).parents('.user-comment').find('.comment-write').prev().show();
	});

	/************************************************************* 포스트 이벤트 시작 ***********************************************************************************/
		// 일반 유저 일시 옵션창 버튼 이벤트
	$('.balloon-space.mpost .user button').on('click', function() {

		var artiNo =  $(this).data('no3');
		gfn_confirmMsgBox("신고하시겠습니까?", function(){

			$.ajaxMegaBox({
		        url: '/on/oh/oha/Movie/insertDecl.do',
				data: JSON.stringify({
					artiNo: artiNo,
					artiInspItemCd: 'SPOL',
					artiDivCd: 'MOPO'
				}),
				sessionAt:true,
		        success: function (d) {
		        	var resultMap = d.resultMap;

		    		if(resultMap.msg == 'sessionFail')  {
		    			return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');
		    		} else if(resultMap.msg == 'dataFail') {
		    			//return gfn_alertMsgBox('이미 신고 되었습니다.');
			    		gfn_alertMsgBox({ msg: '이미 신고 되었습니다.', callback: fn_moviePostList });
		    		} else {
			    		gfn_alertMsgBox({ msg: '신고 되었습니다.'});
		    		}
		        }
		    });
		});
	});


	// 등록자 일시 옵션창 버튼 이벤트
	$('.balloon-space.mpost .writer button').on('click', function() {

	console.log("MoviePostRlyL.jsp 에 있는 수정/삭제 버튼 ");
		if($(this).index() == 1) { // 삭제
//			if(!confirm("삭제 하시겠습니까?")) return;
		var options = {};
		var moviePostNo = $(this).data('no1');

		gfn_confirmMsgBox("삭제 하시겠습니까?", function(){
				$.ajaxMegaBox({
			        url: '/on/oh/oha/Movie/deletePost.do',
					data: JSON.stringify({ moviePostNo: moviePostNo}),
					sessionAt:true,
			        success: function (d) {
						var resultMap = d.resultMap;

						if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');
						if(resultMap.msg == 'auth') return gfn_alertMsgBox('권한이 없습니다.');

						gfn_alertMsgBox({ msg: '삭제 되었습니다.', callback: fn_goPostPage });

			        }
			    });

			});

		} else { // 수정

				fn_moviePostUpdate($(this).data('no1'), $(this).data('no2'));


		}
	});


	//무비포스트 레이어팝업 딤 클릭영역 높이값 부여(부모창 쪽 포커스 두고 클릭 시 레이어팝업 닫힘 처리 )
	$bgDimHeight = $('.modal-layer2 .wrap .layer-con').outerHeight(); //무비포스트 레이어팝업 높이값

	try {
		if( $('body').hasClass('body-iframe') ){
	        $($modal_href).find('.bg-modal-dim').css({
	            height : $bgDimHeight + 245
	        });
	    }
	    else {
	        $($modal_href).find('.bg-modal-dim').css({
	            height : $bgDimHeight + 245
	        });
	    }
	} catch (e) {
		// TODO: handle exception
		console.log("=> modal_href");
	}




	/********************************************************************포스트 이벤트 끝****************************************************************************/

	// 등록자 일시 옵션창 버튼 이벤트
	$('.balloon-space.rly .writer button').off().on('click', function() {

		if($(this).index() == 1) { // 삭제
		//	if(!confirm("삭제 하시겠습니까?")) return;

			var moviePostNo = $(this).data('no1');
			var moviePostRlyNo = $(this).data('no2');

			gfn_confirmMsgBox("삭제 하시겠습니까?", function(){

					$.ajaxMegaBox({
			        url: '/on/oh/oha/Movie/deletePostRly.do',
					data: JSON.stringify({
						moviePostNo: moviePostNo,
						moviePostRlyNo: moviePostRlyNo
					}),
					sessionAt:true,
			        success: function(d) {
			        	var resultMap = d.resultMap;

						if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');

						//20190905 한줄평, 댓글 작성시 메세지 불필요  gfn_alertMsgBox('댓글이 삭제 되었습니다.');
						$('.balloon-space .btn-close').click();

						window.fn_moviePostRlySearch('search', resultMap.moviePostNo );
			        }
			    });
			});

		} else { // 수정
			$(this).parents('.user-comment').find('.comment-write').show();
			$(this).parents('.user-comment').find('.comment-write').prev().hide();
			$('.balloon-space .btn-close').click();
		}
	});

	// 일반 유저 일시 옵션창 버튼 이벤트
	$('.balloon-space.rly .user button').off().on('click', function() {
	//	if(!confirm('신고 하시겠습니까?')) return;

		var artiNo = $(this).data('no3');
		var rlyNo  = $(this).data('no2');

		gfn_confirmMsgBox("신고하시겠습니까?", function(){
			$.ajaxMegaBox({
		        url: '/on/oh/oha/Movie/insertDecl.do',
				data: JSON.stringify({
					artiNo: artiNo,
					rlyNo : rlyNo,
					artiInspItemCd: 'SPOL',
					artiDivCd: 'MOPOC'
				}),
				sessionAt:true,
		        success: function (d) {
		        	var resultMap = d.resultMap;

		    		if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');
		    		if(resultMap.msg == 'dataFail') return gfn_alertMsgBox('이미 신고 되었습니다.');

		    		gfn_alertMsgBox({ msg: '신고 되었습니다.', callback: fn_moviePostList });
		        }
	    	});
		});
	});


});


function fn_goPostPage(){
    $('#layer_post_detail button.btn-modal-close2').trigger("click");
    $('#movieForm').empty();
    if (detailPopup.backScreen != null && detailPopup.backScreen == "movie-detail") {
        $('#movieForm').append('<input type="hidden" name="rpstMovieNo" value="' + detailPopup.movieNo + '">');
        $('#movieForm').attr('action', '/movie-detail');
    } else if (detailPopup.backScreen != null && detailPopup.backScreen == "movie-detail/moviepost") {
            $('#movieForm').append('<input type="hidden" name="rpstMovieNo" value="' + detailPopup.movieNo + '">');
            $('#movieForm').attr('action', '/movie-detail/moviepost');
    } else if (detailPopup.backScreen != null && detailPopup.backScreen == "movie-timeline") {
        $('#movieForm').attr('action', '/mypage/moviestory');
    } else if (detailPopup.backScreen != null && detailPopup.backScreen == "my-moviePost") {
        $('#movieForm').append('<input type="hidden" name="cd" value="mp">');
        $('#movieForm').attr('action', '/mypage/moviestory');
    } else {
        $('#movieForm').attr('action', '/moviepost/all');
    }

    $('#movieForm').attr('method', 'post');
    $('#movieForm').submit();

}

function fn_insertPostRlyMod(idx){
	var postRlyCn = $('.rlyUpdateBtn').eq(idx).parents('.comment').find('textarea').val();
	var rlyCnTarget = $('.rlyUpdateBtn').eq(idx).parents('.user-comment').find('.comment-write').prev();

	//20190905 한줄평, 댓글 작성시 메세지 불필요 gfn_confirmMsgBox("수정 하시겠습니까?", function(){
		$.ajaxMegaBox({
	        url: '/on/oh/oha/Movie/updatePostRly.do',
			data: JSON.stringify({
				moviePostNo: $('.rlyUpdateBtn').eq(idx).data('mpno'),
				moviePostRlyNo: $('.rlyUpdateBtn').eq(idx).data('no'),
				postRlyCn: postRlyCn
			}),
			sessionAt:true,
            clickLmtChk: true, //중복클릭 방지 실행
	        success: function (d) {

				var resultMap = d.resultMap;
				if( resultMap == undefined ) return gfn_alertMsgBox('잘못된 접근입니다.');
				if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');

				//20190905 한줄평, 댓글 작성시 메세지 불필요 gfn_alertMsgBox('댓글이 수정 되었습니다.');

				//rlyCnTarget.html(postRlyCn.replaceAll('\n', '<br>'));
				rlyCnTarget.html(resultMap.postRlyCn);
				$('.rlyCancelBtn').click();
            },complete: function(xhr){
            	clearLmt(); //중복제한 초기화
            }
	    });
	/////});

}


//무비포스트 수정 페이지 이동
function fn_moviePostUpdate(mpNo, mvNo) {
	var contentUrl = '/moviepost/write';
	$('#movieForm').empty();
	$("#movieForm").append("<input type='hidden' name='movieNo' value='" + mvNo + "' />");
	$("#movieForm").append("<input type='hidden' name='rpstMovieNo' value='" + mvNo + "' />");
	$("#movieForm").append("<input type='hidden' name='moviePostNo' value='" + mpNo + "' />");
	$("#movieForm").append("<input type='hidden' name='backScreen' value='" + detailPopup.backScreen + "' />");
	$("#movieForm").attr("action",contentUrl);
    $('#movieForm').attr('method', 'post');
	$("#movieForm").submit();
}



</script>

								<form id="movieForm" method="get"></form>


							</div>
							<!--// comment list -->
							<div class="comment-list" id="commentList">








								<script type="text/javascript">
$(function(){
	// list size가 recordCountPerPage 보다 작으면 더보기 버튼 hide
	var listSize = parseInt('1');
	var recordCountPerPage = parseInt($('#recordCountPerPage').val());
	var currentPage = parseInt($('#currentPage').val());
	var totCnt = '1';

	// 더보기 버튼 제어
	if(recordCountPerPage > listSize) $('#addMovieDiv').hide();
	else $('#addMovieDiv').show();

	$('#rlyCnt').text('댓글 (0)');
	$('#rlyCntTop').val('0');
	$('#hdnMoviePostNo').val('212246');	//파라메타 영화번호


	// 옵션보기 버튼
	$('.btn-alert.rly').off().on('click', function() {
		$(this).next().toggle();
	});

	// 옵션창 닫기
	$('.balloon-space.rly .btn-close').off().on('click', function() {
		$(this).parents('.balloon-space.rly').hide();
	});

	// 댓글 수정 텍스트아레아 키보드 이벤트
	$('.postRlyCn').off().on('keyup', function() {
		$(this).parent().find('.text-count').text($(this).val().length);
	});

	// 댓글 수정 버튼
	$('.rlyUpdateBtn').off().on('click', function() {
		var idx = $('.rlyUpdateBtn').index(this);

		var postRlyCn = $(this).parents('.comment').find('textarea').val();
		if(gfn_isEmpty(postRlyCn)) return gfn_alertMsgBox('내용을 입력해주세요.');

	 	var fn_completeMod = function(list){
		      if ( list.length > 0 ) {
		          //alert(list.join(","));
		          gfn_alertMsgBox('허용되지 않는 단어가 포함되어 있습니다.'); //허용되지 않는 단어가 포함되어 있습니다.
		      } else {
		    	  fn_insertPostRlyMod(idx);
		      }
		 }

	 	gfn_chkPrhword(postRlyCn,fn_completeMod);

	});

	// 댓글 취소 버튼
	$('.rlyCancelBtn').off().on('click', function() {
		$(this).parents('.user-comment').find('.comment-write').hide();
		$(this).parents('.user-comment').find('.comment-write').prev().show();
	});

	/************************************************************* 포스트 이벤트 시작 ***********************************************************************************/
		// 일반 유저 일시 옵션창 버튼 이벤트
	$('.balloon-space.mpost .user button').on('click', function() {

		var artiNo =  $(this).data('no3');
		gfn_confirmMsgBox("신고하시겠습니까?", function(){

			$.ajaxMegaBox({
		        url: '/on/oh/oha/Movie/insertDecl.do',
				data: JSON.stringify({
					artiNo: artiNo,
					artiInspItemCd: 'SPOL',
					artiDivCd: 'MOPO'
				}),
				sessionAt:true,
		        success: function (d) {
		        	var resultMap = d.resultMap;

		    		if(resultMap.msg == 'sessionFail')  {
		    			return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');
		    		} else if(resultMap.msg == 'dataFail') {
		    			//return gfn_alertMsgBox('이미 신고 되었습니다.');
			    		gfn_alertMsgBox({ msg: '이미 신고 되었습니다.', callback: fn_moviePostList });
		    		} else {
			    		gfn_alertMsgBox({ msg: '신고 되었습니다.'});
		    		}
		        }
		    });
		});
	});


	// 등록자 일시 옵션창 버튼 이벤트
	$('.balloon-space.mpost .writer button').on('click', function() {

	console.log("MoviePostRlyL.jsp 에 있는 수정/삭제 버튼 ");
		if($(this).index() == 1) { // 삭제
//			if(!confirm("삭제 하시겠습니까?")) return;
		var options = {};
		var moviePostNo = $(this).data('no1');

		gfn_confirmMsgBox("삭제 하시겠습니까?", function(){
				$.ajaxMegaBox({
			        url: '/on/oh/oha/Movie/deletePost.do',
					data: JSON.stringify({ moviePostNo: moviePostNo}),
					sessionAt:true,
			        success: function (d) {
						var resultMap = d.resultMap;

						if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');
						if(resultMap.msg == 'auth') return gfn_alertMsgBox('권한이 없습니다.');

						gfn_alertMsgBox({ msg: '삭제 되었습니다.', callback: fn_goPostPage });

			        }
			    });

			});

		} else { // 수정

				fn_moviePostUpdate($(this).data('no1'), $(this).data('no2'));


		}
	});


	//무비포스트 레이어팝업 딤 클릭영역 높이값 부여(부모창 쪽 포커스 두고 클릭 시 레이어팝업 닫힘 처리 )
	$bgDimHeight = $('.modal-layer2 .wrap .layer-con').outerHeight(); //무비포스트 레이어팝업 높이값

	try {
		if( $('body').hasClass('body-iframe') ){
	        $($modal_href).find('.bg-modal-dim').css({
	            height : $bgDimHeight + 245
	        });
	    }
	    else {
	        $($modal_href).find('.bg-modal-dim').css({
	            height : $bgDimHeight + 245
	        });
	    }
	} catch (e) {
		// TODO: handle exception
		console.log("=> modal_href");
	}




	/********************************************************************포스트 이벤트 끝****************************************************************************/

	// 등록자 일시 옵션창 버튼 이벤트
	$('.balloon-space.rly .writer button').off().on('click', function() {

		if($(this).index() == 1) { // 삭제
		//	if(!confirm("삭제 하시겠습니까?")) return;

			var moviePostNo = $(this).data('no1');
			var moviePostRlyNo = $(this).data('no2');

			gfn_confirmMsgBox("삭제 하시겠습니까?", function(){

					$.ajaxMegaBox({
			        url: '/on/oh/oha/Movie/deletePostRly.do',
					data: JSON.stringify({
						moviePostNo: moviePostNo,
						moviePostRlyNo: moviePostRlyNo
					}),
					sessionAt:true,
			        success: function(d) {
			        	var resultMap = d.resultMap;

						if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');

						//20190905 한줄평, 댓글 작성시 메세지 불필요  gfn_alertMsgBox('댓글이 삭제 되었습니다.');
						$('.balloon-space .btn-close').click();

						window.fn_moviePostRlySearch('search', resultMap.moviePostNo );
			        }
			    });
			});

		} else { // 수정
			$(this).parents('.user-comment').find('.comment-write').show();
			$(this).parents('.user-comment').find('.comment-write').prev().hide();
			$('.balloon-space .btn-close').click();
		}
	});

	// 일반 유저 일시 옵션창 버튼 이벤트
	$('.balloon-space.rly .user button').off().on('click', function() {
	//	if(!confirm('신고 하시겠습니까?')) return;

		var artiNo = $(this).data('no3');
		var rlyNo  = $(this).data('no2');

		gfn_confirmMsgBox("신고하시겠습니까?", function(){
			$.ajaxMegaBox({
		        url: '/on/oh/oha/Movie/insertDecl.do',
				data: JSON.stringify({
					artiNo: artiNo,
					rlyNo : rlyNo,
					artiInspItemCd: 'SPOL',
					artiDivCd: 'MOPOC'
				}),
				sessionAt:true,
		        success: function (d) {
		        	var resultMap = d.resultMap;

		    		if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');
		    		if(resultMap.msg == 'dataFail') return gfn_alertMsgBox('이미 신고 되었습니다.');

		    		gfn_alertMsgBox({ msg: '신고 되었습니다.', callback: fn_moviePostList });
		        }
	    	});
		});
	});


});


function fn_goPostPage(){
    $('#layer_post_detail button.btn-modal-close2').trigger("click");
    $('#movieForm').empty();
    if (detailPopup.backScreen != null && detailPopup.backScreen == "movie-detail") {
        $('#movieForm').append('<input type="hidden" name="rpstMovieNo" value="' + detailPopup.movieNo + '">');
        $('#movieForm').attr('action', '/movie-detail');
    } else if (detailPopup.backScreen != null && detailPopup.backScreen == "movie-detail/moviepost") {
            $('#movieForm').append('<input type="hidden" name="rpstMovieNo" value="' + detailPopup.movieNo + '">');
            $('#movieForm').attr('action', '/movie-detail/moviepost');
    } else if (detailPopup.backScreen != null && detailPopup.backScreen == "movie-timeline") {
        $('#movieForm').attr('action', '/mypage/moviestory');
    } else if (detailPopup.backScreen != null && detailPopup.backScreen == "my-moviePost") {
        $('#movieForm').append('<input type="hidden" name="cd" value="mp">');
        $('#movieForm').attr('action', '/mypage/moviestory');
    } else {
        $('#movieForm').attr('action', '/moviepost/all');
    }

    $('#movieForm').attr('method', 'post');
    $('#movieForm').submit();

}

function fn_insertPostRlyMod(idx){
	var postRlyCn = $('.rlyUpdateBtn').eq(idx).parents('.comment').find('textarea').val();
	var rlyCnTarget = $('.rlyUpdateBtn').eq(idx).parents('.user-comment').find('.comment-write').prev();

	//20190905 한줄평, 댓글 작성시 메세지 불필요 gfn_confirmMsgBox("수정 하시겠습니까?", function(){
		$.ajaxMegaBox({
	        url: '/on/oh/oha/Movie/updatePostRly.do',
			data: JSON.stringify({
				moviePostNo: $('.rlyUpdateBtn').eq(idx).data('mpno'),
				moviePostRlyNo: $('.rlyUpdateBtn').eq(idx).data('no'),
				postRlyCn: postRlyCn
			}),
			sessionAt:true,
            clickLmtChk: true, //중복클릭 방지 실행
	        success: function (d) {

				var resultMap = d.resultMap;
				if( resultMap == undefined ) return gfn_alertMsgBox('잘못된 접근입니다.');
				if(resultMap.msg == 'sessionFail') return gfn_alertMsgBox('로그인 후 이용가능한 서비스입니다.');

				//20190905 한줄평, 댓글 작성시 메세지 불필요 gfn_alertMsgBox('댓글이 수정 되었습니다.');

				//rlyCnTarget.html(postRlyCn.replaceAll('\n', '<br>'));
				rlyCnTarget.html(resultMap.postRlyCn);
				$('.rlyCancelBtn').click();
            },complete: function(xhr){
            	clearLmt(); //중복제한 초기화
            }
	    });
	/////});

}


//무비포스트 수정 페이지 이동
function fn_moviePostUpdate(mpNo, mvNo) {
	var contentUrl = '/moviepost/write';
	$('#movieForm').empty();
	$("#movieForm").append("<input type='hidden' name='movieNo' value='" + mvNo + "' />");
	$("#movieForm").append("<input type='hidden' name='rpstMovieNo' value='" + mvNo + "' />");
	$("#movieForm").append("<input type='hidden' name='moviePostNo' value='" + mpNo + "' />");
	$("#movieForm").append("<input type='hidden' name='backScreen' value='" + detailPopup.backScreen + "' />");
	$("#movieForm").attr("action",contentUrl);
    $('#movieForm').attr('method', 'post');
	$("#movieForm").submit();
}



</script>

								<form id="movieForm" method="get"></form>


								<!-- 댓글자리  -->

							</div>
							<div class="mb50"></div>
						</div>
					</div>
					<button type="button" class="btn-modal-close2"
						onclick="layer_close();">레이어 닫기</button>
				</div>
			</section>
			<!-- // ################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
			<!-- //무비포스트 상세 레이어팝업 -->
		</div>
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