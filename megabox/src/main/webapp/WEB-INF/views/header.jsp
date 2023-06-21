<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="pPath" value="/" />
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
	<link rel="shortcut icon" href="/static/pc/images/favicon.ico">

		<title>영화별 상영시간표 &lt; 상영시간표 | MEET PLAY SHARE, 메가박스</title>
     		<link rel="stylesheet" href="${pPath }resources/css/megabox.min.css" media="all">
     		<script src="https://www.megabox.co.kr/static/pc/dist/megabox.api.min.js"></script>
			<script src="https://www.megabox.co.kr/static/mb/js/lozad.min.js"></script>
			<script src="https://www.megabox.co.kr/js/common/dist/megabox.common.min.js"></script>
			<script src="https://www.megabox.co.kr/js/netfunnel/dist/megabox.netfunnel.min.js"></script>
			<script src="https://www.megabox.co.kr/cast.imp.joins.com/persona.js" async=""></script>
     
		    <script src="https://www.megabox.co.kr/static/pc/js/ui.common.js?v=1659424661668"></script>
		    <script src="https://www.megabox.co.kr/cast.imp.joins.com/head/FBbJDzXhQYfhjyQjRbY9ZDzZQU63QxFXY_lS1Rj7UV6EAM4qWzAZAbZneDVqNlpHOVNkR0o1aGRvM1A2WkVnAstB2Lie2OwUywPLQdi4ntjsFMs.js?url=https%3A%2F%2Fwww.megabox.co.kr%2F&amp;ref=https%3A%2F%2Fwww.megabox.co.kr%2Fevent"></script>
    		<%-- <script src="${pPath }resources/js/front.js"></script> --%>
    		<script src="https://www.megabox.co.kr/static/pc/js/front.js?v=1661171477083"></script>
    		 
    		<script>
    		
    		var sValidateLoginIdAt  = 'N';	//로그인ID  입력 검증 여부
    		var sValidateLoginPwdAt = 'N';	//로그인PWD 입력 검증 여부
    		var submitIng = false;
    		var sCookieVal = "";	//쿠키값
    		function open_search_screen(){
	    		var parent = document.getElementById("layer-header-search");
	    		parent.className = "header-layer layer-header-search appendHtml on";
    		}
    		
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

//    		 		//아이디 생성규칙 확인
//    		 		if(!fn_validateInputVal("loginId" ,$("#ibxLoginId").val(), 'Y')) {
//    		 			$("#ibxLoginId").focus();
//    		 			return;
//    		 		}
//    		 		//패스워드 생성규칙확인
//    		 		if(!fn_validateInputVal("loginPwd",$("#ibxLoginPwd").val(), 'Y')) {
//    		 			$("#ibxLoginPwd").focus();
//    		 			return;
//    		 		}

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
//    		 		if (!/((?=.{8,})(?=.*[0-9])(?=.*[a-zA-Z]).*$)/g.test(sVal)) {
//    		 			$('#error-text').text('아이디는 영문,숫자 조합 8자리 이상 12자리 이하 입니다.');
//    		 			sValidateLoginIdAt = 'N';
//    		 		}
//    		 		else if (/((?=.{8,})(?=.*[~!@#$%^&*+=-]).*$)/g.test(sVal)) {
//    		 			$('#error-text').text('아이디는 영문,숫자 조합 8자리 이상 12자리 이하 입니다.');
//    		 			sValidateLoginIdAt = 'N';
//    		 		}
    				else{
    					$('#error-text').text('');
    					sValidateLoginIdAt = 'Y';
    				}
    			}
    			else if(type == "loginPwd") { //패스워드
    				if(sVal == ""){
    					sValidateLoginPwdAt = 'N';
    				}
//    		 		if (!/((?=.{10,})(?=.*[0-9])(?=.*[a-zA-Z]).*$)|((?=.{10,})(?=.*[~!@#$%^&*+=-])(?=.*[a-zA-Z]).*$)|((?=.{10,})(?=.*[!@#$%^&*+=-])(?=.*[0-9]).*$)/g.test(sVal)) {
//    		 			$('#error-text').text('비밀번호는 영문,숫자,특수기호 중 2가지 이상 조합하여 10자리 이상 16자리 이하 입니다.');
//    		 			sValidateLoginPwdAt = 'N';
//    		 		}
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
    			
    			alert(typeof sLoginId);

    			var paramData = { loginId:sLoginId
    							, loginPwd:sLloginPwd
    							, menuId:sMenuId
    							, mappingId:sMappingId
    							, snsLogin:sSnsLogin
    							, redisKey:redisKey
    							};

    			$.ajaxMegaBox({
    				url: "${pPath}login/selectMbLoginInfo",
    				data: JSON.stringify(paramData),
    				//async: false,
    				success: function (data, textStatus, jqXHR) {
    					var revStr                 = data.revStr;
    					//loginPwdFail 패스워드실패안내, mbJoinReq 회원가입안내, mbInfoSearchUnable 탈퇴회원안내
    					if (revStr == "loginPwdFail") {
//    		 				$('.alert').text('로그인 정보가 잘못되었습니다. (로그인 '+pwdErrCnt+'/5회 실패)');	2020-02-06 메가박스 차세대 이행/안정화 결함대장 28번
    						$("#ibxLoginId").val("");
    						$("#ibxLoginPwd").val("");
    						alert('아이디 또는 비밀번호가 맞지 않습니다.\n로그인 정보를 다시 확인바랍니다.',400,250);	//msg.ch.ohg.ME031=아이디 또는 비밀번호가 맞지 않습니다.\\n로그인 정보를 다시 확인바랍니다.
    						$("#btnLogin").attr("disabled", true);	//버튼비활성화
    						sValidateLoginPwdAt ='N';
    						return;
    					}
    					else if(revStr == "loginSuccess"){
    						alert('로그인되었습니다');
    						location.href= window.location.href;
    					}

    				    if(typeof loginPopupCallScn === "undefined"){
    				    	loginPopupCallScn = "";
    				    }
//    		 		    console.log("this : "+loginPopupCallScn);
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
    		
    		var email;
    		var name;
    		var tel;
    		var num;
    		
    		//로그인, 비로그인에 따라 header 다르게 보이기
    	    $(function(){
    	         if(fn_loginAt()!="true"){
    	        	 $('#header .right-link .before').show();
    	      		  $('#header .right-link .after').hide();
    	         }else{
    	        	 var id = '${loginId}';
    	        		var paramData = { loginId:id
    	        				};
    	        		
    	        		$.ajaxMegaBox({
    	        			url:"${path}/login/selectMbLoginInfoData",
    	        			data: JSON.stringify(paramData),
    	        			
    	        			success:function(data){
    	        				email = data.u_email;
    	        				name = data.u_name;
    	        				tel = data.u_tel;
    	        				num = data.u_num;
    	        			},error:function(request,status,error){
    	        				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    	        			}
    	        		});
    	        	 $('#header .right-link .before').hide();
    	     		  $('#header .right-link .after').show();
    	              
    	         }
    	         


    	    var sysCd = 'ON';
    	    });
    		
    	  //홍현식 로그인 여부 체크
    	    function fn_loginAt() {
    	    	
    	    	var result;
    	    	$.ajax({
    	    		url: "${pPath}login/selectLoginSession",
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
    	  		url: "${pPath}login/logoutSession",
    	  		type: "POST",
    	  		async: false,
    	  		contentType: "text",
    	  		success: function (data) {
    	  			location.href='${pPath}/main';
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
    	  
    	  var lnkgInfoObj;
    	  $(function(){
    	      $("div.sns-login > a").off("click").on("click",function(){
    	          lnkgInfoObj = $(this);
    	          simpleLoginWith($(this).attr("lnkgTy"));
    	      });
    	  });
    	  
    	  //소셜로그인
    	  var simpleLoginWithPopup;
    	  var simpleLoginWith = function(lnkgTy){
    	      var url = "https://kauth.kakao.com/oauth/authorize?client_id=fc1c6f725158262e3d3008e9eda48e0c&redirect_uri=http://localhost:8085${pPath}login/kakaoLogin&response_type=code";
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

    		</script>
<!-- header -->
<header id="header">
    <h1 class="ci"><a href="${pPath }main" title="MEGABOX 메인으로 가기">MEGABOX : Life Theater</a></h1>

    <div class="util-area">
        <div class="left-link">
            <a href="/benefit/viplounge" title="VIP LOUNGE">VIP LOUNGE</a>
            <a href="/benefit/membership" title="멤버십">멤버십</a>
            <a href="/support" title="고객센터">고객센터</a>
        </div>

        <div class="right-link">
            <!-- 로그인전 -->
            <div class="before" style="">
                <a href="javaScript:fn_viewLoginPopup_new()" title="로그인">로그인</a>
                <a href="${pPath }join" title="회원가입">회원가입</a>
            </div>

            <!-- 로그인후 -->
            <div class="after" style="display:none">
                <a href="javaScript:fn_logout()" class="" title="로그아웃">로그아웃</a>
                <a href="" class="notice" title="알림">알림</a>

                <!-- layer-header-notice -->
				<div class="layer-header-notice">
					<div class="notice-wrap">
						<p class="tit-notice">알림함</p>

						<div class="count">
							<p class="left">전체 <em class="totalCnt">0</em> 건</p>

							<p class="right">* 최근 30일 내역만 노출됩니다.</p>
						</div>

						<!--  -->
						<div class="scroll m-scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar"><div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
							<ul class="list">
								<li class="no-list">
									알림 내역이 없습니다.
								</li>
							</ul>
						</div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; display: none; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
						<div class="notice-list-more">
							<button type="button" class="button btn-more-notice-list">더보기 <i class="iconset ico-btn-more-arr"></i></button>
						</div>
						<!--// scroll -->
						<button type="button" class="btn-close-header-notice">알림 닫기</button>
					</div>
					<!--// notice-wrap -->
				<!--// layer-header-notice -->
				</div>

            </div>

            <a href="booking">빠른예매</a>
        </div>
    </div>

    <div class="link-area">
        <a href="#layer_sitemap" class="header-open-layer btn-layer-sitemap" title="사이트맵">사이트맵</a>
        <a href="#" class="header-open-layer btn-layer-search" title="검색" onclick="open_search_screen()">검색</a>
        <a href="timetable" class="link-ticket" title="상영시간표">상영시간표</a>
        <a href="#" onclick="location.href='Membermain'" class="header-open-layer btn-layer-mymega" title="나의 메가박스">나의 메가박스</a>
    </div>

    <nav id="gnb">
        <ul class="gnb-depth1">
            <li><a href="movie" class="gnb-txt-movie" title="영화">영화</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="movie" title="전체영화">전체영화</a></li>


                        <li><a href="#" title="큐레이션">큐레이션</a></li>
                        
                        <li id="festivalArea" style="display: none;"><a href="#" title="영화제">영화제</a></li>
                        <li><a href="moviepost" title="무비포스트">무비포스트</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="booking" class="gnb-txt-reserve" title="예매">예매</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="booking" title="빠른예매">빠른예매</a></li>
                        <li><a href="timetable" title="상영시간표">상영시간표</a></li>
                        <li><a href="#" title="더 부티크 프라이빗 예매">더 부티크 프라이빗 예매</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="list" class="gnb-txt-theater" title="극장">극장</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="list" title="전체극장">전체극장</a></li>
                        <li><a href="#" title="특별관">특별관</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="#" class="gnb-txt-event" title="이벤트">이벤트</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="#" title="진행중 이벤트">진행중 이벤트</a></li>
                        <li><a href="#" title="지난 이벤트">지난 이벤트</a></li>
                        <li><a href="#" title="당첨자발표">당첨자발표</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="#" class="gnb-txt-store" title="스토어">스토어</a></li>
            <li><a href="#" class="gnb-txt-benefit" title="혜택">혜택</a>
                <div class="gnb-depth2">
                    <ul>
                        <li><a href="#" title="메가박스 멤버십">메가박스 멤버십</a></li>
                        <li><a href="#" title="제휴/할인">제휴/할인</a></li>
                    </ul>
                </div>
            </li>
        </ul>
    </nav>
    <!--// gnb -->
    <script type="text/javascript">
        $(document).ready(function() {
            var filmCheck = MegaboxUtil.Common.moveMovieFilmCheckGnb(); // 영화제 존재여부 체크
            if(filmCheck == true){
                $("#festivalArea").show();
            }else{
                $("#festivalArea").hide();
            }
        });
    </script>
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
                    <li><a href="movie" title="전체영화">전체영화</a></li>
                    <li><a href="#" title="큐레이션">큐레이션</a></li>
                    <li><a href="#"  title="영화제">영화제</a></li>
                    <li><a href="moviepost" title="무비포스트">무비포스트</a></li>
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
                    <li><a href="#" title="특별관">특별관</a></li>
                </ul>
            </div>

            <div class="list position-4">
                <p class="tit-depth">이벤트</p>

                <ul class="list-depth">
                    <li><a href="#" title="진행중 이벤트">진행중 이벤트</a></li>
                    <li><a href="#" title="지난 이벤트">지난 이벤트</a></li>
                    <li><a href="#" title="당첨자발표">당첨자발표</a></li>
                </ul>
            </div>

            <div class="list position-5">
                <p class="tit-depth">스토어</p>

                <ul class="list-depth">
                    <li><a href="#" title="새로운 상품">새로운 상품</a></li>
                    <li><a href="#" title="메가티켓">메가티켓</a></li>
                    <li><a href="#" title="메가찬스">메가찬스</a></li>
                    <li><a href="#" title="팝콘/음료/굿즈">팝콘/음료/굿즈</a></li>
                </ul>
            </div>
            <div class="list position-6">
                <p class="tit-depth">나의 메가박스</p>
                <ul class="list-depth mymage">
            				<li><a href="javascript:movePage('/mypage',						'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');" title="나의 메가박스 홈">나의 메가박스 홈</a></li>
		                    <li><a href="javascript:movePage('BookingList',			'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');" title="예매/구매내역">예매/구매내역</a></li>
		                    <li><a href="javascript:movePage('/mypage/movie-coupon',		'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');" title="영화관람권">영화관람권</a></li>
		                    <li><a href="javascript:movePage('/mypage/store-coupon',		'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');" title="스토어교환권">스토어교환권</a></li>
		                    <li><a href="javascript:movePage('/mypage/discount-coupon',		'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');" title="할인/제휴쿠폰">할인/제휴쿠폰</a></li>
		                    
		                    <li><a href="javascript:movePage('/mypage/point-list',			'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');" title="멤버십포인트">멤버십포인트</a></li>
		                    <li><a href="javascript:movePage('/mypage/moviestory',			'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');" title="나의 무비스토리">나의 무비스토리</a></li>
		                    <li><a href="javascript:movePage('/mypage/myevent',				'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');" title="나의 이벤트 응모내역">나의 이벤트 응모내역</a></li>
		                    <li><a href="javascript:movePage('/mypage/myinquiry',			'로그인이 필요한 서비스 입니다. \n로그인하시겠습니까?');" title="나의 문의내역">나의 문의내역</a></li>
		                    <li><a href="#" title="자주쓰는 할인 카드">자주쓰는 할인 카드</a></li>
		                    <li><a href="#','로그인이 필요한 서비스 입니다.');" title="회원정보">회원정보</a></li>
                </ul>
            </div>

            <div class="list position-7">
                <p class="tit-depth">혜택</p>

                <ul class="list-depth">
                    <li><a href="#" title="멤버십 안내">멤버십 안내</a></li>
                    <li><a href="#" title="VIP LOUNGE">VIP LOUNGE</a></li>
                    <li><a href="#" title="제휴/할인">제휴/할인</a></li>
                </ul>
            </div>

            <div class="list position-8">
                <p class="tit-depth">고객센터</p>

                <ul class="list-depth">
                    <li><a href="#" title="고객센터 홈">고객센터 홈</a></li>
                    <li><a href="#" title="자주묻는질문">자주묻는질문</a></li>
                    <li><a href="#" title="공지사항">공지사항</a></li>
                    <li><a href="#" title="1:1문의">1:1문의</a></li>
                    <li><a href="#" title="단체/대관문의">단체/대관문의</a></li>
                    <li><a href="#" title="분실물문의">분실물문의</a></li>
                </ul>
            </div>

            <div class="list position-9">
                <p class="tit-depth">회사소개</p>

                <ul class="list-depth">
                    <li><a href="#" target="_blank" title="메가박스소개">메가박스소개</a></li>
                    <li><a href="#" target="_blank" title="사회공헌">사회공헌</a></li>
                    <li><a href="#" target="_blank" title="홍보자료">홍보자료</a></li>
                    <li><a href="#" target="_blank" title="제휴/부대사업문의">제휴/부대사업문의</a></li>
                    <li><a href="#" target="_blank" title="온라인제보센터">온라인제보센터</a></li>
                    <li><a href="#" target="_blank" title="자료">IR자료</a></li>
                    <li><a href="#" target="_blank" title="인재채용림">인재채용</a></li>
                    <li><a href="#" target="_blank" title="윤리경영">윤리경영</a></li>
                </ul>
            </div>

            <div class="list position-10">
                <p class="tit-depth">이용정책</p>

                <ul class="list-depth">
                    <li><a href="#" title="이용약관">이용약관</a></li>
                    <li><a href="#" title="위치기반서비스 이용약관">위치기반서비스 이용약관</a></li>
                    <li><a href="#" title="개인정보처리방침">개인정보처리방침</a></li>
                    <li><a href="#" title="스크린수배정에관한기준">스크린수배정에관한기준</a></li>
                </ul>
            </div>

            <div class="ir">
                <a href="" class="layer-close" title="레이어닫기">레이어닫기</a>
            </div>
        </div>
        <!--// wrap -->
    </div>
    <!--// 레이어 : 사이트맵 -->

	<!-- style="display: block" -->
    <!-- 레이어 : 검색 -->
   <div id="layer-header-search" class="header-layer layer-header-search appendHtml">

        <div class="wrap">
            <a href="" class="link-acc" title="검색 레이어 입니다.">검색 레이어 입니다.</a>

            <div class="tab-rank tab-layer">
                <ul>
                    <li class="on"><button type="button" class="btn">예매율 순</button></li>
                    <li><button type="button" class="btn">메가박스 관객순</button></li>
                </ul>
            </div>

            <div class="rank-cont">
                <p class="img">
                	
                	<img src="https://img.megabox.co.kr/SharedImg/2022/08/05/QDUC0cjm2bnWDCCQPYpQvelnoFe1CCfH_316.jpg" alt="헌트" onerror="noImg(this, 'main');">
                	
                </p>

                <div class="list">
                	<ol>
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('22037300')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/08/05/QDUC0cjm2bnWDCCQPYpQvelnoFe1CCfH_316.jpg" onerror="noImg(this, 'main');" title="헌트 상세보기">헌트</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('22023000')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/07/28/1ogGcWYxCNJ9MTnizlZLdZ6REjg6xX1z_316.jpg" onerror="noImg(this, 'main');" title="한산: 용의 출현 상세보기">한산: 용의 출현</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('22040600')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/07/11/5QmiMH2KZOYaIru5mEZcihFW40XhkvCq_316.jpg" onerror="noImg(this, 'main');" title="DC 리그 오브 슈퍼-펫 상세보기">DC 리그 오브 슈퍼-펫</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('21084100')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/07/18/QrXStxq2NTGaeHPaAK5xxOXsarNj2aJd_316.jpg" onerror="noImg(this, 'main');" title="비상선언 상세보기">비상선언</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('22018400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/05/09/6zfAYe6IrZ8BWnruqEfafwakt5cUjWgX_316.jpg" onerror="noImg(this, 'main');" title="탑건: 매버릭 상세보기">탑건: 매버릭</a></li>
	                	
	                	
                	</ol>
                	<ol style="display:none">
                		
	                	
							<li><em>1</em> <a href="javascript:gfn_moveDetail('22018700')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/05/23/oZfETtpEvKGpdY2JQo2Z6wFL0S4cpKy5_316.jpg" onerror="noImg(this, 'main');" title="범죄도시 2 상세보기">범죄도시 2</a></li>
	                	
							<li><em>2</em> <a href="javascript:gfn_moveDetail('22018400')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/05/09/6zfAYe6IrZ8BWnruqEfafwakt5cUjWgX_316.jpg" onerror="noImg(this, 'main');" title="탑건: 매버릭 상세보기">탑건: 매버릭</a></li>
	                	
							<li><em>3</em> <a href="javascript:gfn_moveDetail('22023000')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/07/28/1ogGcWYxCNJ9MTnizlZLdZ6REjg6xX1z_316.jpg" onerror="noImg(this, 'main');" title="한산: 용의 출현 상세보기">한산: 용의 출현</a></li>
	                	
							<li><em>4</em> <a href="javascript:gfn_moveDetail('22028200')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/07/06/t0SyNNVrh4UBBxmdCqBVtehgd03NWpf7_316.jpg" onerror="noImg(this, 'main');" title="토르: 러브 앤 썬더 상세보기">토르: 러브 앤 썬더</a></li>
	                	
							<li><em>5</em> <a href="javascript:gfn_moveDetail('22027700')" data-imgsrc="https://img.megabox.co.kr/SharedImg/2022/06/17/UiVCdL9H7i6emWkAoFo6k0pWOx4UaxzD_316.jpg" onerror="noImg(this, 'main');" title="마녀(魔女) Part2. The Other One 상세보기">마녀(魔女) Part2. The Other One</a></li>
	                	
	                	
                	</ol>
                </div>
            </div>

            <div class="header-search-area">
                <input type="text" id="headerMovieName" title="영화명을 검색해 주세요" placeholder="영화를 검색하세요" class="input-text">
                <button type="button" id="btnHeaderSearch" class="btn-search" onclick="search_movie_by_name()">검색</button>
            </div>

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
        <div class="wrap" style="display:none">

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
                       <em class="vip">VIP PREMIUM</em>
                        <em class="name"></em>
                        <span>회원님</span>
                    </p>

                    <div class="last-date">마지막 접속일 : <em></em></div>

                    <!-- vip, 멤버십 없을때는 미 출력  -->
                    <div class="membership">
                        <!-- <i class="iconset ico-header-vip"></i>
                        <i class="iconset ico-header-film"></i>
                        <i class="iconset ico-header-classic"></i> -->
                    </div>

                    <div class="btn-fixed">
                        <a href="/mypage" class="button" title="나의  메가박스">나의  메가박스</a>
                    </div>
                </div>

                <div class="box">
                    <div class="point">
                        <p class="tit">Point</p>

                        <p class="count">
                            0
                        </p>

                        <div class="btn-fixed">
                            <a href="/mypage/point-list" class="button" title="멤버십 포인트">멤버십 포인트</a>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div class="coupon">
                        <p class="tit">쿠폰/관람권 <!-- <i class="iconset ico-header-new"></i> --></p>

                        <p class="count">
                            <em title="쿠폰 수" class="cpon">0</em>
                            <span title="관람권 수" class="movie">0</span>
                        </p>

                        <div class="btn-fixed">
                            <a href="/mypage/discount-coupon" class="button" title="쿠폰">쿠폰</a>
                            <a href="/mypage/movie-coupon" class="button" title="관람권">관람권</a>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div class="reserve">
                        <p class="tit">예매 <!-- <i class="iconset ico-header-new"></i> --></p>

                        <p class="txt"></p>

                        <div class="btn-fixed">
                            <a href="/mypage/bookinglist" class="button" title="예매내역">예매내역 </a>
                        </div>
                    </div>
                </div>

                <div class="box">
                    <div class="buy">
                        <p class="tit">구매 <!-- <i class="iconset ico-header-new"></i> --></p>

                        <p class="count">
                            <em>0</em>
                            <span>건</span>
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
                    로그인 하시면 나의 메가박스를 만날 수 있어요.<br>
                    영화를 사랑하는 당신을 위한 꼭 맞는 혜택까지 확인해 보세요!
                </p>

                <div class="mb50">
                    <a href="#layer_login_common" id="moveLogin" title="로그인" class="button w120px btn-modal-open" w-data="850" h-data="484">로그인</a>
                </div>

                <a href="/join" class="link" title="혹시 아직 회원이 아니신가요?">혹시 아직 회원이 아니신가요?</a>
            </div>
        </div>
        <!--// wrap -->

        <div class="ir">
            <a href="" class="layer-close" title="레이어닫기">레이어닫기</a>
        </div>
	</div>
    <!--// 레이어 : 마이페이지 -->

<!-- 로그인 레이어팝업 시작 -->
<!-- 화면ID  M-ME-LO-01 -->
<!-- 화면ID  M-ME-CC-01 -->
<div style="display:none;"><a id="loginPupupATag" href="#layer_login_select" class="button active btn-modal-open" w-data="850" h-data="484"></a></div>

	<section id="layer_login_select" class="modal-layer shadow" style="z-index: 501;"><a href="#" class="focus" title="레이어로 포커스 이동 됨">레이어로 포커스 이동 됨<!--레이어로 포커스 이동 됨--></a>
		<div class="wrap" style="width: 850px; height: 556px; margin-left: -425px; margin-top: -278px;">
			<header class="layer-header">
				<h3 class="tit">로그인</h3>
			</header>

			<div class="layer-con" style="height: 511px;">

				<div class="tab-list tab-layer">
					<ul>
						<li class="on"><a href="#login_tab_01" title="회원 로그인 선택">회원 로그인<!--회원 로그인--></a></li>
						<li><a href="#login_tab_02" title="비회원 로그인 선택">비회원 로그인<!--비회원 로그인--></a></li>
					</ul>
				</div>

				<!-- tab-cont-wrap -->
				<div class="tab-cont-wrap">
					<!-- tab 회원 로그인 -->
					<div id="login_tab_01" class="tab-cont on"><a href="" class="ir" title="로그인"></a>

						<div class="login-member col-2">
							<!-- col-wrap -->
							<div class="col-wrap">
								<div class="col left">
									<div class="login-input-area">
										<input autocomplete="off" id="ibxLoginId" maxlength="20" type="text" placeholder="아이디" title="아이디를 입력하세요" class="input-text strTrim"><!--아이디--><!--아이디를 입력하세요-->
										<input autocomplete="off" id="ibxLoginPwd" maxlength="20" type="password" placeholder="비밀번호" title="비밀번호를 입력하세요" class="input-text mt15"><!--비밀번호--><!--비밀번호를 입력하세요-->
										<div class="alert"></div>

										<!-- chk-util -->
										<div class="chk-util">
											<div class="left">
												<input id="chkIdSave" type="checkbox"> <label for="chkIdSave">아이디 저장<!--아이디 저장--></label>
											</div>

											<div class="right">
												<div class="hp-ad">
										      <a href="https://www.sepay.org/spm/join?regSiteCode=XF&ctgCode=1&subCode=1" title="휴대폰 간편 로그인 선택" target="_blank" title="새창 열림"><span>휴대폰 간편로그인<!--휴대폰 간편로그인--></span> <em>광고<!--광고--></em></a>
												</div>
											</div>
										</div>
										<!--// chk-util -->

										<button id="btnLogin" type="button" class="button purple large btn-login">로그인<!--로그인--></button>

										<div class="link">
											<a href="/user-find" title="ID/PW 찾기 선택">ID/PW 찾기<!--ID/PW 찾기--></a>
											<a href="${pPath }join" title="회원가입 선택">회원가입<!--회원가입--></a>
											<a href="#" title="비회원 예매확인 선택">비회원 예매확인<!--비회원 예매확인--></a>
										</div>

										<div class="sns-login">
											<a href="javaScript:void(0)" lnkgTy="FACEBOOK" title="페이스북으로 로그인 선택"><img src="${pPath }resources/images/icon/ico-facebook.png"  alt="페이스북"><!--페이스북--> 페이스북으로 로그인<!--페이스북으로 로그인--></a>
											<a href="javaScript:void(0)" lnkgTy="NAVER"    title="네이버로 로그인 선택"><img src="${pPath }resources/images/icon/ico-naver.png"     alt="네이버"><!--네이버-->   네이버로 로그인<!--네이버로 로그인--></a>
											<a href="javaScript:void(0)" lnkgTy="KAKAO"    title="카카오톡으로 로그인 선택" ><img src="${pPath }resources/images/icon/ico-kakao.png"    alt="카카오톡"><!--카카오톡--> 카카오톡으로 로그인<!--카카오톡으로 로그인--></a>
											<a href="javaScript:void(0)" lnkgTy="PAYCO"    title="페이코로 로그인 선택"><img src="${pPath }resources/images/icon/ico-payco.png"     alt="페이코"><!--페이코-->   페이코로 로그인<!--페이코로 로그인--></a>
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
					<div id="login_tab_02" class="tab-cont"><a href="" class="ir" title="비회원 로그인"></a>

						<div class="login-member col-2">
							<!-- col-wrap -->
							<div class="col-wrap">
								<div class="col left">

									<div class="no-member-login-table">
										<table summary="이름, 생년월일, 휴대폰번호, 인증번호, 비밀번호, 비밀번호 확인 항목을 가진 비회원 로그인 입력 표">
											<caption>이름, 생년월일, 휴대폰번호, 인증번호, 비밀번호, 비밀번호 확인 항목을 가진 비회원 로그인 입력 표<!--이름, 생년월일, 휴대폰번호, 인증번호, 비밀번호, 비밀번호 확인 항목을 가진 비회원 로그인 입력 표--></caption>
											<colgroup>
												<col style="width:110px;">
												<col>
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">
														<label for="ibxNonMbNm">이름<!--이름--></label>
													</th>
													<td>
														<input maxlength="20" id="ibxNonMbNm" type="text" placeholder="이름" class="input-text"><!--이름-->
													</td>
												</tr>
												<tr>
													<th scope="row">
														<label for="ibxNonMbByymmdd">생년월일<!--생년월일--></label>
													</th>
													<td>
														<input maxlength="6" id="ibxNonMbByymmdd" type="text" placeholder="생년월일 앞6자리" class="input-text"><!--주민번호 앞 6자리-->
													</td>
												</tr>
												<tr>
													<th scope="row">
														<label for="ibxNonMbTelno">휴대폰번호<!--휴대폰번호--></label>
													</th>
													<td>
														<div class="hp-input">
															<input maxlength="11" id="ibxNonMbTelno" type="text" placeholder="- 없이 입력" class="input-text"><!--- 없이 입력-->
															<button id="nonMbCertNoSend" type="button" class="button gray" disabled="disabled">인증요청<!--인증요청--></button>
														</div>
														<div id="mblpInput-error-text" class="alert" ></div>
													</td>
												</tr>
												<tr id="nonMbCertRow">
													<th scope="row">
														<label for="mblpCharCertNo">인증번호<!--인증번호--></label>
													</th>
													<td>
														<div class="chk-num">
															<div class="line">
																<input maxlength="4" id="mblpCharCertNo" type="text" class="input-text">

																<div class="time-limit" id="timer">
																	3:00
																</div>
															</div>

															<button id="btnMblpCharCert" type="button" class="button purple" disabled="disabled">확인<!--확인--></button>
														</div>
														<div id="nonMbCert-error-text" class="alert"></div>
													</td>
												</tr>
												<tr>
													<th scope="row">
														<label for="ibxNonMbPwd">비밀번호</label><!--비밀번호-->
													</th>
													<td>
														<input  maxlength="4" id="ibxNonMbPwd" type="password" placeholder="비밀번호(숫자 4자리)" class="input-text"><!--비밀번호(숫자 4자리)-->
													</td>
												</tr>
												<tr>
													<th scope="row">
														<label for="ibxNonMbPwdConfirm">비밀번호<!--비밀번호-->확인<!--확인--></label>
													</th>
													<td>
														<input maxlength="4" id="ibxNonMbPwdConfirm" type="password" placeholder="비밀번호(숫자 4자리) 확인" class="input-text"><!--비밀번호(숫자 4자리) 확인-->
														<div id="nonMbPwdErrText" class="alert"></div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

								<div class="col right">

									<div class="no-member-privacy-rule">
										<p class="tit">비회원예매 개인정보 처리방침<!--비회원예매 개인정보 처리방침--></p>

										<div class="cont">
											<dl>
												<dt>수집목적</dt><dd>비회원예매 서비스 제공 / 이용자식별 / 구매 및  결제</dd><dt>수집항목</dt><dd>이름, 생년월일, 휴대폰번호, 비밀번호</dd><dt>보유기간</dt><dd class='ismsimp'>관람 또는 취소 후 7일 이내</dd><!--<dt>수집목적</dt><dd>비회원예매 서비스 제공 / 이용자식별 / 구매 및  결제</dd><dt>수집항목</dt><dd>이름, 생년월일, 휴대폰번호, 비밀번호</dd><dt>보유기간</dt><dd>관람 또는 취소 후 7일 이내</dd>-->
											</dl>

											<div class="btn-agree">
												<input type="radio"  id="chkNonMbBokdPersonInfoProcTrue" name="chkNonMbBokdPersonInfoProc">
												<label for="chkNonMbBokdPersonInfoProcTrue">동의<!--동의--></label>

												<input type="radio" id="chkNonMbBokdPersonInfoProcFalse" name="chkNonMbBokdPersonInfoProc" class="ml20">
												<label for="chkNonMbBokdPersonInfoProcFalse">미동의<!--미동의--></label>
											</div>

											<ul class="dot-list gblue mt20">
												<li class="font-gblue">정보수집에 동의를 거부할 수 있으며, 동의하지 않을 경우 비회원 예매서비스를 이용하실 수 없습니다.<!--정보수집에 동의를 거부할 수 있으며, 동의하지 않을 경우 비회원 예매서비스를 이용하실 수 없습니다.--></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!--// col-wrap -->

							<div class="btn-group">
								<button id="btnChkNonMbLogin" type="button" class="button purple">확인</button>
								<a id="aNonMbLogin" href="#layer_no_member_chk" class="button purple btn-modal-open" w-data='600' h-data='320' style="display: none;"></a>
							</div>
						</div>
					</div>
					<!--// tab 비회원 로그인 -->
				</div>
				<!--// tab-cont-wrap -->
			</div>

			<button type="button" class="btn-modal-close" onclick="login_modal_close()">레이어 닫기<!--레이어 닫기--></button>
		</div>
	</section>

</header>
<!--// header -->
