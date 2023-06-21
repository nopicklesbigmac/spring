<%@page import="com.my.megabox.booking.dto.AllDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <c:url var="path" value="/" /> --%>
<html lang="ko"><!--<![endif]--><head>
	<link rel="shortcut icon" href="/static/pc/images/favicon.ico">
		<title>빠른예매 &lt; 예매 | MEET PLAY SHARE, 메가박스</title>
<style>
#bokdMSeat {
	margin: auto 0;
	text-align: center;
	overflow: hidden;
}

#printSeat {
	display: inline-block;
	margin: 1% 15% 0 0;
	text-align: left;
}

.seat {
	width: 40px;
	height: 30px;
}

.finished {
	background-color: #858585;
	color: white;
}

.clicked {
	background-color: #503296;
	color: white;
}

.seat-wrapper {
	margin-top: 55px;
	margin-left: 150px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"
	integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
$(document).ready(function() {
	let test = [];
	let selectedSeats = new Array();
	let selectedSeatsMap = [];
	const seatWrapper = document.querySelector(".seat-wrapper");
	let clicked = "";
	let div = "";

	var currentSNum = 0;
	var seatNum = "<c:out value='${condition.s_seat }'/>";
	
	var bookedSeat = "<c:out value='${bookedSeat}'/>";
	var seatList = bookedSeat.split(" ");
	
	for (let i = 0; i <= 20; i++) {
	    div = document.createElement("div");
	    seatWrapper.append(div);
	    for (let j = 1; j <= 12; j++) {
	    	currentSNum += Number(1);
	    	if(currentSNum > seatNum)
	    		break;
	        const input = document.createElement('input');
	        input.type = "button";
	        input.name = "seats"
	        input.classList = "seat";
	        mapping(input, i, j);
	        if(seatList.includes(input.value)){
	        	input.disabled = true;
	        	input.classList += " finished";
	        }
	        div.append(input);
	    }
	}

	function mapping(input, i, j) {
	    if (i === 0) {
	        input.value = "A" + j;
	    } else if (i === 1) {
	        input.value = "B" + j;
	    } else if (i === 2) {
	        input.value = "C" + j;
	    } else if (i === 3) {
	        input.value = "D" + j;
	    } else if (i === 4) {
	        input.value = "E" + j;
	    } else if (i === 5) {
	        input.value = "F" + j;
	    } else if (i === 6) {
	        input.value = "G" + j;
	    } else if (i === 7) {
	        input.value = "H" + j;
	    } else if (i === 8) {
	        input.value = "I" + j;
	    } else if (i === 9) {
	        input.value = "J" + j;
	    } else if (i === 10) {
	        input.value = "K" + j;
	    } else if (i === 11) {
	        input.value = "L" + j;
	    } else if (i === 12) {
	        input.value = "M" + j;
	    } else if (i == 13) {
	    	input.value = "N" + j;
	    } else if (i == 14) {
	    	input.value = "O" + j;
	    } else if (i == 15) {
	    	input.value = "P" + j;
	    } else if (i == 16) {
	    	input.value = "Q" + j;
	    } else if (i == 17) {
	    	input.value = "R" + j;
	    } else if (i == 18) {
	    	input.value = "S" + j;
	    } else if (i == 19) {
	    	input.value = "T" + j;
	    } else if (i == 20) {
	    	input.value = "U" + j;
	    }
	    	
	}
	
});

$(document).ready(function(){
    $(".seat").click(function(){
    	var totalCnt = calTotalCnt();
    	var clickedCnt = countClickedSeat();
    	
    	if(totalCnt == 0){
    		alert('관람하실 인원을 먼저 선택해주세요');
    		return;
    	}
    	
    	if(totalCnt > clickedCnt){
            changeText($(this).val());
            $(this).attr('class','seat clicked');
    	}else {
    		alert('좌석 선택이 완료되었습니다');
    	}
    	
    	totalCnt = calTotalCnt();
    	clickedCnt = countClickedSeat();
    	if(totalCnt == clickedCnt)
        	$('#pageNext').attr('class','button active');
    	else
    		$('#pageNext').attr('class','button disabled');
    	
    });
});

$(document).ready(function(){
    $("#pageNext").click(function(){
    	var className = $(this).prop('class');
    	
    	if(className == 'button disabled')
    		return;
    	
    	var totalCnt = calTotalCnt();
    	var clickedCnt = countClickedSeat();
    	
    	if(totalCnt != clickedCnt){
    		alert('좌석 선택을 완료해주세요');
    		return;
    	}
    	
    	var num = "<c:out value='${rNum}'/>";
    	var seats = makeSeatsArr();
    	
    	var c = "<c:out value='${condition.c_name }'/>";
    	var s = "<c:out value='${condition.s_name }'/>";
    	var m = "<c:out value='${condition.m_name }'/>";
    	var age = "<c:out value='${condition.m_age }'/>";
    	var date = "<c:out value='${condition.r_date }'/>";
    	var start = "<c:out value='${condition.r_start }'/>";
    	var end = "<c:out value='${condition.r_end }'/>";
    	
    	var fee = $('.money').find('em').html();
    	var aCnt = getEachCnt(0);
    	var tCnt = getEachCnt(1);
    	var oCnt = getEachCnt(2);
    	
    	var param = {cName: c, sName: s, mName: m, mAge: age, rDate: date, rStart: start, rEnd: end, totalFee: fee,
    			adultCnt: aCnt, teenCnt: tCnt, oldCnt: oCnt, rNum: num, seats: seats};
    	param = JSON.stringify(param);
    	
    	$.ajax({
			url: 'sendBookingInfo', 
			type: 'post', 
			data: param,  
			contentType: 'application/json; charset=utf-8', 
			success: function(msg){ 
				if(msg == '성공')
					location.href='booking/completeSeat';
				else
					alert("다시 시도해주세요");
			},
			error: function(){
				alert('실패');
			}
		});
    	
    });
});

function makeSeatsArr(){
	var seats = "";
	var selectedSeatList = document.getElementsByClassName('seat all');
	for(i = 0; i < selectedSeatList.length; i++){
		if(selectedSeatList[i].innerHTML != '-')
			seats += (selectedSeatList[i].innerHTML + " ");
		else
			return seats;
	}
}

function countClickedSeat(){
	var cnt = 0;
	var seatList = document.getElementsByClassName('seat');
	for(i = 0; i < seatList.length; i++){
		if(seatList[i].className == 'seat clicked')
			cnt = Number(cnt) + Number(1);
	}
	return cnt;
}

function changeText(seat){
	var selectedSeatList = document.getElementsByClassName('seat all');
	for(i = 0; i < selectedSeatList.length; i++){
		if(selectedSeatList[i].innerHTML == '-'){
			selectedSeatList[i].innerHTML = seat;
			return;
		}
	}
}

function clickedInit(){
	initCnt();
	initSelectedSeat();
	initSeat();
	initBtn();
}

function initCnt(){
	var cellList = document.getElementsByClassName('cell');
	for(i = 0; i < cellList.length; i++){
		var number = cellList[i].getElementsByClassName('number')[0];
		number.getElementsByClassName('now')[0].innerHTML = 0;
	}
}

function initSelectedSeat(){
	var selectedSeatList = document.getElementsByClassName('seat all');
	for(i = 0; i < selectedSeatList.length; i++){
		selectedSeatList[i].innerHTML = '-';
	}
}

function initSeat(){
	var seatList = document.getElementsByClassName('seat');
	for(i = 0; i < seatList.length; i++){
		if(seatList[i].className == 'seat clicked')
			seatList[i].className = 'seat';
	}
}

function initBtn(){
	$('#pageNext').attr('class','button disabled');
	$('.money').find('em').html(0);
}

function calcFee(idx, mode){
	var fee;
	var currentMoney = $('.money').find('em').html();
	
	if(mode == 'plus'){
		if(idx == 0)
			fee = Number(14000);
		else if(idx == 1)
			fee = Number(12000);
		else
			fee = Number(5000);
	}else if(mode == 'minus'){
		if(idx == 0)
			fee = -1 * Number(14000);
		else if(idx == 1)
			fee = -1 * Number(12000);
		else
			fee = -1 * Number(5000);
	}
	
	if(Number(currentMoney) + fee >= 0)
    	$('.money').find('em').html(Number(currentMoney) + fee);
	else
		return;
}

function getEachCnt(idx){
	var cell = document.getElementsByClassName('cell')[idx];
	var number = cell.getElementsByClassName('number')[0];
	return number.getElementsByClassName('now')[0].innerHTML;
}

function addCnt(idx){
	var cell = document.getElementsByClassName('cell')[idx];
	var number = cell.getElementsByClassName('number')[0];
	var cCnt = number.getElementsByClassName('now')[0].innerHTML;
	var totalCnt = calTotalCnt();
	
	if(totalCnt >= 8){
		alert('인원선택은 총 8명까지 가능합니다.');
		return;
	}
	
	var result = Number(cCnt) + 1;
	number.getElementsByClassName('now')[0].innerHTML = result;
	calcFee(idx, 'plus');
	
	totalCnt = calTotalCnt();
	var clickedCnt = countClickedSeat();
	if(totalCnt == clickedCnt)
    	$('#pageNext').attr('class','button active');
	else
		$('#pageNext').attr('class','button disabled');
}

function subCnt(idx){
	var cell = document.getElementsByClassName('cell')[idx];
	var number = cell.getElementsByClassName('number')[0];
	var cCnt = number.getElementsByClassName('now')[0].innerHTML;
	
	if(cCnt <= 0)
		return;
	
	var result = Number(cCnt) - 1;
	number.getElementsByClassName('now')[0].innerHTML = result;
	calcFee(idx, 'minus');
	
	totalCnt = calTotalCnt();
	var clickedCnt = countClickedSeat();
	if(totalCnt == clickedCnt)
    	$('#pageNext').attr('class','button active');
	else
		$('#pageNext').attr('class','button disabled');
}

function calTotalCnt(){
	var totalCnt = 0;
	var cellList = document.getElementsByClassName('cell');
	for(i = 0; i < cellList.length; i++){
		var number = cellList[i].getElementsByClassName('number')[0];
		var cCnt = number.getElementsByClassName('now')[0].innerHTML;
		totalCnt += Number(cCnt);
	}
	return totalCnt;
}

function chooseTime(element){
	var rNum = element.value;
	location.href='ticketing?num=' + rNum;
}
</script>
</head>
<body class="">

    <div class="skip" title="스킵 네비게이션">
        <a href="#contents" title="본문 바로가기">본문 바로가기</a>
        <a href="#footer" title="푸터 바로가기">푸터 바로가기</a>
    </div>

    <div class="body-wrap">
<!--  ko_KR -->
        
<!-- 로그인 레이어팝업 시작 -->
<!-- 화면ID  M-ME-LO-01 -->
<!-- 화면ID  M-ME-CC-01 -->
<div style="display:none;"><a id="loginPupupATag" href="#layer_login_select" class="button active btn-modal-open" w-data="850" h-data="484"></a></div>

	<section id="layer_login_select" class="modal-layer" style="z-index: 501;"><a href="" class="focus">레이어로 포커스 이동 됨</a><a href="#" class="focus" title="레이어로 포커스 이동 됨">레이어로 포커스 이동 됨<!--레이어로 포커스 이동 됨--></a>
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
					<div id="login_tab_01" class="tab-cont on"><a href="" class="ir"></a><a href="" class="ir" title="로그인"></a>

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
										      <a href="https://www.sepay.org/spm/join?regSiteCode=XF&amp;ctgCode=1&amp;subCode=1" title="휴대폰 간편 로그인 선택" target="_blank"><span>휴대폰 간편로그인<!--휴대폰 간편로그인--></span> <em>광고<!--광고--></em></a>
												</div>
											</div>
										</div>
										<!--// chk-util -->

										<button id="btnLogin" type="button" class="button purple large btn-login" disabled="disabled">로그인<!--로그인--></button>

										<div class="link">
											<a href="/user-find" title="ID/PW 찾기 선택">ID/PW 찾기<!--ID/PW 찾기--></a>
											<a href="/join" title="회원가입 선택">회원가입<!--회원가입--></a>
											<a href="/on/oh/ohg/MbLogin/viewNonMbLogin.rest" title="비회원 예매확인 선택">비회원 예매확인<!--비회원 예매확인--></a>
										</div>

									<!-- 	<div class="sns-login">
											<a href="javaScript:void(0)" lnkgty="FACEBOOK" title="페이스북으로 로그인 선택"><img src="../../../static/pc/images/member/ico-facebook.png" alt="페이스북">페이스북 페이스북으로 로그인페이스북으로 로그인</a>
											<a href="javaScript:void(0)" lnkgty="NAVER" title="네이버로 로그인 선택"><img src="../../../static/pc/images/member/ico-naver.png" alt="네이버">네이버   네이버로 로그인네이버로 로그인</a>
											<a href="javaScript:void(0)" lnkgty="KAKAO" title="카카오톡으로 로그인 선택"><img src="../../../static/pc/images/member/ico-kakao.png" alt="카카오톡">카카오톡 카카오톡으로 로그인카카오톡으로 로그인</a>
											<a href="javaScript:void(0)" lnkgty="PAYCO" title="페이코로 로그인 선택"><img src="../../../static/pc/images/member/ico-payco.png" alt="페이코">페이코   페이코로 로그인페이코로 로그인</a>
										</div> -->
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
					<div id="login_tab_02" class="tab-cont"><a href="" class="ir"></a><a href="" class="ir" title="비회원 로그인"></a>

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
														<div id="mblpInput-error-text" class="alert"></div>
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
														<input maxlength="4" id="ibxNonMbPwd" type="password" placeholder="비밀번호(숫자 4자리)" class="input-text"><!--비밀번호(숫자 4자리)-->
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
												<dt>수집목적</dt><dd>비회원예매 서비스 제공 / 이용자식별 / 구매 및  결제</dd><dt>수집항목</dt><dd>이름, 생년월일, 휴대폰번호, 비밀번호</dd><dt>보유기간</dt><dd class="ismsimp">관람 또는 취소 후 7일 이내</dd><!--<dt>수집목적</dt><dd>비회원예매 서비스 제공 / 이용자식별 / 구매 및  결제</dd><dt>수집항목</dt><dd>이름, 생년월일, 휴대폰번호, 비밀번호</dd><dt>보유기간</dt><dd>관람 또는 취소 후 7일 이내</dd>-->
											</dl>

											<div class="btn-agree">
												<input type="radio" id="chkNonMbBokdPersonInfoProcTrue" name="chkNonMbBokdPersonInfoProc">
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
								<button id="btnChkNonMbLogin" type="button" class="button purple" disabled="disabled">확인</button>
								<a id="aNonMbLogin" href="#layer_no_member_chk" class="button purple btn-modal-open" w-data="600" h-data="320" style="display: none;"></a>
							</div>
						</div>
					</div>
					<!--// tab 비회원 로그인 -->
				</div>
				<!--// tab-cont-wrap -->
			</div>

			<button type="button" class="btn-modal-close">레이어 닫기<!--레이어 닫기--></button>
		</div>
	</section>

	<section id="layer_no_member_chk" class="modal-layer"><a href="" class="focus">레이어로 포커스 이동 됨</a>
		<div class="wrap">
			<header class="layer-header">
				<h3 class="tit">알림</h3>
			</header>

			<div class="layer-con">
				<p>티켓 발권을 위한 입력정보를 확인해 주세요.</p>

				<div class="table-wrap v1">
					<table class="data-table" summary="이름, 생년월일, 휴대폰번호 항목을 가진 비회원 티켓 발권을 위한 입력정보 표">
						<caption>이름, 생년월일, 휴대폰번호 항목을 가진 비회원 티켓 발권을 위한 입력정보 표</caption>
						<colgroup>
							<col style="width:80px;">
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
				<button id="btnNonMbLogin" type="button" class="button purple small" disabled="disabled">확인</button>
			</div>

			<button id="btnNonMbModalClose" type="button" class="btn-modal-close">레이어 닫기</button>
		</div>
	</section>
<c:import url="../header.jsp" charEncoding="utf-8" />
<form id="bokdMForm">
	<input type="hidden" name="returnURL" value="info">
</form>
<!-- container -->
<div id="bokdContainer" class="container" style="padding-bottom: 200px;">
<input type="hidden" id="playDe" name="playDe" value="">
    <div class="page-util fixed">
        <div class="inner-wrap">
            <div class="location"><span>Home</span><a href="/booking" title="/예매 페이지로 이동">예매</a><a href="/booking" title="/빠른예매 페이지로 이동">빠른예매</a></div>

        </div>
    </div>

    <div id="bokdMSeat">
        <div id="printSeat" class="seat-select-section">
                    <div class="seat-section">
                        <div class="tit-util">
                            <h3 class="tit small"> 관람인원선택</h3>
                            <div class="right">
                                <button type="button"
								class="button gray-line small" id="cntInit" onclick="clickedInit()"> <i
									class="iconset ico-reset-small"></i>초기화</button>
                            </div>
                        </div>
                        <div class="seat-area">
                            <div class="seat-count"
							style="min-height: 52px">
							<div class="cell">
								<p class="txt">성인</p>
								<div class="count">
									<button type="button" class="down" title="성인 좌석 선택 감소" onclick="subCnt(0)">-</button>
									<div class="number">
										<button type="button" class="now" title="성인 현재 좌석 선택 수"
											ticketgrpcd="TKA">0</button>
										<ul class="num-choice">
											<li><button type="button" class="btn on">0</button></li>
										</ul>
									</div>
									<button type="button" class="up" title="성인 좌석 선택 증가" onclick="addCnt(0)">+</button>
								</div>
							</div>
							<div class="cell">
								<p class="txt">청소년</p>
								<div class="count">
									<button type="button" class="down" title="청소년 좌석 선택 감소" onclick="subCnt(1)">-</button>
									<div class="number">
										<button type="button" class="now" title="청소년 현재 좌석 선택 수"
											ticketgrpcd="TKY">0</button>
										<ul class="num-choice">
											<li><button type="button" class="btn on">0</button></li>
										</ul>
									</div>
									<button type="button" class="up" title="청소년 좌석 선택 증가" onclick="addCnt(1)">+</button>
								</div>
							</div>
							<div class="cell">
								<p class="txt">우대</p>
								<div class="count">
									<button type="button" class="down" title="우대 좌석 선택 감소" onclick="subCnt(2)">-</button>
									<div class="number">
										<button type="button" class="now" title="우대 현재 좌석 선택 수"
											ticketgrpcd="TKS">0</button>
										<ul class="num-choice">
											<li><button type="button" class="btn on">0</button></li>
										</ul>
									</div>
									<button type="button" class="up" title="우대 좌석 선택 증가" onclick="addCnt(2)">+</button>
								</div>
							</div>
						</div>
                            <div class="seat-layout" style="overflow: visible">
                                <div class="alert"
								style="display: none;"></div>
                                <div class="seat-count-before off"
								style="top: 0px">관람인원을 선택하십시요</div>
                                    <div id="seatLayout"
											style="width: 100%; height: 400px; overflow-y: scroll">
                                        <img
												src="https://www.megabox.co.kr/static/pc/images/reserve/img-theater-screen.png"
												alt="screen"
												style="position: absolute; left: 62px; top: 10px;"
												class="mCS_img_loaded">
											<div class="seat-wrapper">
											
											</div>
											<img
												src="https://www.megabox.co.kr/static/pc/images/reserve/img-door-left.png"
												alt="좌측 출입구"
												style="position:absolute; left:131px; top:30px; width:16px; height: 16px;"
												class="mCS_img_loaded"> <img
												src="https://www.megabox.co.kr/static/pc/images/reserve/img-door-top.png"
												alt="상단측좌측 출입구"
												style="position:absolute; left:191px; top:430px; width:16px; height: 16px;"
												class="mCS_img_loaded">
									</div>
                            </div>
                            <div class="zone-legend"
							style="display: none"></div>
                        </div>
                    </div>
                    <div class="seat-result">
					<div class="wrap">
							<c:if test="${result != null && condition != null }">
								<c:set var="condi" value="${condition }" />
								<%AllDTO same = (AllDTO)pageContext.getAttribute("condi");  %>
								<div class="tit-area">
									<c:if test="${condition.m_age != null }">
										<c:choose>
											<c:when test="${condition.m_age == '전체관람가' }">
												<span class="movie-grade small age-all">
											</c:when>
											<c:when test="${condition.m_age == '청소년관람불가' }">
												<span class="movie-grade small age-all age-19">
											</c:when>
											<c:otherwise>
												<span class="movie-grade small age-all age-<%=same.getM_age().substring(0, 2)%>">
											</c:otherwise>
										</c:choose>
									</c:if>
									</span>
									<p class="tit"><%=same.getM_name() %></p>
				                    <p class="cate">2D</p>
								</div>
								<div class="info-area">
									<p class="theater"><%=same.getC_name() %></p>
				                    <p class="special"><%=same.getS_name() %></p>
				                    <p class="date">
									<span><%=same.getR_date() %></span>
									</p>
									<div class="other-time">
										<button type="button" class="now">
											<%=same.getR_start()%>~<%=same.getR_end()%>
											<i class="arr"></i>
										</button>
								</c:if>
                                    <ul class="other">
                                    	<c:if test="${result != null && !result.isEmpty() && condition != null }">
											<c:forEach var="idx" begin="0" end="${result.size()-1 }">
												<c:set var="dto" value="${result.get(idx) }" />
												<c:choose>
													<c:when test="${dto.r_num == rNum }">
														<li><button type="button" choicnt="96"
														onclick="chooseTime(this)" playschdlno="2208161372071"
														class="btn on " value="${dto.r_num }">
														${dto.r_start }~${dto.r_end }
														</button></li>
													</c:when>
													<c:otherwise>
														<li><button type="button" choicnt="96"
														onclick="chooseTime(this)" playschdlno="2208161372071"
														class="btn " value="${dto.r_num }">
														${dto.r_start }~${dto.r_end }
														</button></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:if>
									</ul>
							</div>
							<!-- condi -->
							<c:if test="${result != null && !result.isEmpty() && condition != null }">
	                                <p class="poster">
	                                    <img
										src="${condition.m_poster }"
										onerror="" alt="${condition.m_name }">
	                                </p>
                            </c:if>
						</div>
                            <div class="choice-seat-area">
                                <div class="legend">
                                    <ul class="list"> <li><div
											class="seat-condition choice" title="선택한 좌석"></div> <em>선택</em></li> <li><div
											class="seat-condition finish" title="예매 완료"></div> <em>예매완료</em></li> <li><div
											class="seat-condition impossible" title="선택 불가"></div> <em>선택불가</em></li> <li><div
											class="seat-condition common" title="일반"></div> <em> 일반</em></li>  <li><div
											class="seat-condition disabled" title="장애인석"></div> <em> 장애인석</em></li>
								</ul>
                                </div>
                                <div class="seat-num">
                                    <p class="tit">선택좌석</p>
                                    <div class="my-seat">
                                        <div class="seat all"
										title="구매가능 좌석">-</div>
                                        <div class="seat all"
										title="구매가능 좌석">-</div>
                                        <div class="seat all"
										title="구매가능 좌석">-</div>
                                        <div class="seat all"
										title="구매가능 좌석">-</div>
                                        <div class="seat all"
										title="구매가능 좌석">-</div>
                                        <div class="seat all"
										title="구매가능 좌석">-</div>
                                        <div class="seat all"
										title="구매가능 좌석">-</div>
                                        <div class="seat all"
										title="구매가능 좌석">-</div>
                                    </div>
                                </div>
                            </div>
                            <div class="pay-area">
                                <p class="count"></p>
                                <div class="pay">
                                    <p class="tit">최종결제금액</p>
                                    <div class="money">
                                        <em>0</em> <span>원</span>
                                    </div>
                                </div>
                            </div>
                            <div class="btn-group">
                                <a href="javascript:history.back()"
								class="button" id="pagePrevious" title="이전">이전</a>
                                <a class="button disabled" id="pageNext" title="다음">다음</a>
                            </div>
                           </div>
                        </div>
                    </div>
                </div>
	</div>

<section id="saw_movie_regi" class="modal-layer"><a href="" class="focus">레이어로 포커스 이동 됨</a>
	<input type="hidden" id="isLogin" value="Y">
	<div class="wrap">
		<header class="layer-header">
			<h3 class="tit">본 영화 등록</h3>
		</header>

		<div class="layer-con">
			<p class="reset">발권하신 티켓 하단의 거래번호 또는 예매번호를 입력해주세요.</p>

			<div class="pop-gray mt10 mb30">
				<label for="movie_regi" class="mr10">거래번호 또는 예매번호</label>
				<input type="text" id="movie_regi" class="input-text w280px numType" maxlength="20" placeholder="숫자만 입력해 주세요" title="티켓 거래번호 입력">
				<button class="button gray ml05" id="regBtn">등록</button>
			</div>

			<div class="box-border v1 mt30">
				<p class="tit-box">이용안내</p>

				<ul class="dot-list">
                        <li>극장에서 예매하신 내역을 본 영화(관람이력)로 등록하실 수 있습니다.</li>
                        <li>예매처를 통해 예매하신 고객님은 극장에서 발권하신 티켓 하단의 온라인 예매번호 <br>12자리를 입력해주세요.(Yes24, 네이버, 인터파크, SKT, KT, 다음)</li>
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

<div class="quick-area" style="display: none;">
	<a href="" class="btn-go-top" title="top" style="position: fixed;">top</a>
</div>

<c:import url="../footer.jsp" charEncoding="utf-8" />
<!-- 모바일 때만 출력 -->
<div class="go-mobile" style="display: none;">
	<a href="#" data-url="https://m.megabox.co.kr">모바일웹으로 보기 <i class="iconset ico-go-mobile"></i></a>
</div>
    </div>
    <form id="mainForm">
    </form>