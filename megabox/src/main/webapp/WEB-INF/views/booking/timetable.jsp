<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="ko">
<head>
<link rel="shortcut icon" href="/static/pc/images/favicon.ico">
<title>영화별 상영시간표 &lt; 상영시간표 | MEET PLAY SHARE, 메가박스</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"
	integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
</script>

<script>
$(document).ready(function(){
	document.getElementsByName("checkCinema")[0].getElementsByTagName("button")[0].className = "btn on";
	document.getElementById("checkMovie").getElementsByTagName("button")[0].className = "btn disabled on";
	document.getElementsByName('actual_date')[1].className = "on";
});

$(document).ready(function(){
	var mName = findClickedMovie(); 
	var clickedDay = sendClickedDate();
	var clickedState = findClickedState();
	
	var param = {"mName" : mName, "day": clickedDay, "sName": clickedState};
	param = JSON.stringify(param);
	
	$.ajax({
		url: 'sendMovieAndState', 
		type: 'post', 
		data: param,  
		contentType: 'application/json; charset=utf-8', 
		success: function(msg){ 
			console.log("front에서 요청! 영화: " + mName + ", 지역: " + clickedState + ": 날짜: " + clickedDay);
			var pH = document.getElementById('printHere');
			pH.innerHTML = "";
			pH.innerHTML = msg;
		},
		error: function(){
			alert('실패');
		}
	});
}); 

$(document).ready(function () {
	  $(document).on("click", "div[class='tab-left-area']", function () {
		  var regex = / /gi;
		  var title = $("span[class='font-green']");
		  var lis = $("div[class='tab-left-area']").find('li');
		  
		  for(i = 0; i < lis.length; i++){
			  if(lis[i].className == 'on'){
				 var a = lis[i].getElementsByTagName('a')[0].text.replace(regex, '');
				 if(a == "영화별"){
					 document.getElementById("checkMovie").getElementsByTagName("button")[0].className = "btn disabled on";
					 //선택된 극장 초기화
					 clickedCinema = findClickedCinemaElement();
					 clickedCinema.className = 'btn';
					 $("div[id='tab-layer']").css('display', 'block');
					 var m = findClickedMovieElement();
					 title.text(m.value);
					 send_movie_name(m);
				 }else{
					 document.getElementsByName("checkCinema")[0].getElementsByTagName("button")[0].className = "btn on";
					 //선택된 영화 초기화
					 clickedMovie = findClickedMovieElement();
					 clickedMovie.className = 'btn disabled';
					 $("div[id='tab-layer']").css('display', 'none');
					 var c = findClickedCinemaElement();
					 title.text(c.value);
					 send_theater_name(c);
				 }
			  }
		  }
	  });
});

function print_state_name(){
	var ul = document.getElementById("tab-layer-ul");
	var li = ul.getElementsByTagName("li");
	console.log(li);
	for(i = 0; i < li.length; i++)  {
		if(li[i].className == 'on'){
			console.log(li[i].innerText);
			return li[i].innerText;
		}
	}
}

function onlyClickOneDate(clickedDay){
	var days = document.getElementsByName('actual_date');
 	for(i = 0; i < days.length; i++){
 		if(days[i].value == clickedDay)
 			days[i].className = 'on';
 		else
 			days[i].className = '';
 	}
}

function onlyClickOneMovie(mName){
	var ul = document.getElementById("checkMovie");
	var btns = ul.getElementsByTagName("button");
	
	for(i = 0; i < btns.length; i++) {
		if(btns[i].className == "btn disabled on" && btns[i].value != mName)
			btns[i].className = "btn disabled";
	}
}

function onlyClickOneCinema(cName){
	var uls = document.getElementsByName("checkCinema");
	
	for(i = 0; i < uls.length; i++){
		var btns = uls[i].getElementsByTagName("button");
		for(j = 0; j < btns.length; j++) {
			if(btns[j].className == "btn on" && btns[j].value != cName){
				btns[j].className = 'btn';
			}
		}
	}
}

function leftPad(value) {
    if (value >= 10) {
        return value;
    }
    return '0' + value;
}

function toStringByFormatting(source, delimiter) {
    const year = source.getFullYear();
    const month = leftPad(source.getMonth() + 1);
    const day = leftPad(source.getDate());

    return [year, month, day].join(delimiter);
}

function sendClickedDate() {
	var days = document.getElementsByName('actual_date');
	var clickedDay = null;
	for(i = 0; i < days.length; i++){
		if(days[i].className == 'on'){
			clickedDay = days[i].value;
			break;
		}
	}
	if(clickedDay == null || clickedDay.length == 0)
		clickedDay = toStringByFormatting(new Date(), '.');
	return clickedDay;
}
</script>

<script type="text/javascript">
	function findClickedMovie(){
		var ul = document.getElementById("checkMovie");
		var btns = ul.getElementsByTagName("button");
		console.log(btns);
		
		for(i = 0; i < btns.length; i++) {
			if(btns[i].className == "btn disabled on")
				return btns[i].value;
		}
		return "";
	}
	
	function findClickedCinema(){
		var uls = document.getElementsByName("checkCinema");
		console.log(uls);
		
		for(i = 0; i < uls.length; i++){
			var btns = uls[i].getElementsByTagName("button");
			for(j = 0; j < btns.length; j++) {
				if(btns[j].className == "btn on")
					return btns[j].value;
			}
		}
		return "";
	}
	
	function findClickedMovieElement(){
		var ul = document.getElementById("checkMovie");
		var btns = ul.getElementsByTagName("button");
		console.log(btns);
		
		for(i = 0; i < btns.length; i++) {
			if(btns[i].className == "btn disabled on")
				return btns[i];
		}
		return ul.getElementsByTagName("button")[0];
	}
	
	function findClickedCinemaElement(){
		var uls = document.getElementsByName("checkCinema");
		console.log(uls);
		
		for(i = 0; i < uls.length; i++){
			var btns = uls[i].getElementsByTagName("button");
			for(j = 0; j < btns.length; j++) {
				if(btns[j].className == "btn on")
					return btns[j];
			}
		}
		return uls[0].getElementsByTagName("button")[0];
	}
	
	function findClickedState(){
		console.log('클릭된 지역 찾기 함수 호출됨');
		
		var tab = document.getElementById('tab-layer-ul');
		var liList = tab.getElementsByTagName('li');
		
		for(i = 0; i < liList.length; i++)  {
			if(liList[i].className == 'on')
				return liList[i].getElementsByTagName("a")[0].innerHTML;
		}
		return "서울";
	}
	
	function click_date(element) {
		var dates = document.getElementsByName('actual_date');
		for (i = 0; i < dates.length; i++) {
			if(dates[i].className = 'on')
				dates[i].className = 'default';
		}
		element.className = 'on';
		
		var clickedDay = element.value;
		console.log(clickedDay);
		
		var clickedState = findClickedState();
		console.log(clickedState);
		
		var c = findClickedCinema();
		var m = findClickedMovie();
		
		var param = {"cName": c, "day": clickedDay};
		var mappingUrl = "sendCinemaAndDay";
		
		if(m != null && m != ''){
			param = {"mName": m, "day": clickedDay, "sName": clickedState};
			mappingUrl = "sendMovieAndState";
		}
		param = JSON.stringify(param);
		
		$.ajax({
			url: mappingUrl, 
			type: 'post', 
			data: param,  
			contentType: 'application/json; charset=utf-8', 
			success: function(msg){ 
				console.log("front에서 요청! 극장: " + c + "영화: " + m + ", 지역: " + clickedState + ": 날짜: " + clickedDay);
				var pH = document.getElementById('printHere');
				pH.innerHTML = "";
				pH.innerHTML = msg;
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	function send_movie_name(movie) {
		var mName = movie.value; 
		console.log(mName);
		
		onlyClickOneMovie(mName);
		
		var clickedDay = sendClickedDate();
		console.log("컨트롤러에 전달할 날짜: " + clickedDay);
		
		var clickedState = findClickedState();
		
		var param = {"mName" : mName, "day": clickedDay, "sName": clickedState};
		param = JSON.stringify(param);
		
		$.ajax({
			url: 'sendMovieAndState', 
			type: 'post', 
			data: param,  
			contentType: 'application/json; charset=utf-8', 
			success: function(msg){ 
				console.log("front에서 요청! 영화: " + mName + ", 지역: " + clickedState + ": 날짜: " + clickedDay);
				var pH = document.getElementById('printHere');
				pH.innerHTML = "";
				pH.innerHTML = msg;
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	function send_theater_name(cinema) {
		var cName = cinema.value;
		console.log(cName);
		
		onlyClickOneCinema(cName);
		
		var clickedDay = sendClickedDate();
		console.log("컨트롤러에 전달할 날짜: " + clickedDay);
		
		var param = {"cName" : cName, "day": clickedDay};
		param = JSON.stringify(param);
		
		$.ajax({
			url: 'sendCinemaAndDay', 
			type: 'post', 
			data: param,  
			contentType: 'application/json; charset=utf-8', 
			success: function(msg){
				console.log("front에서 요청! 극장: " + cName + ", 날짜: " + clickedDay);
				var pH = document.getElementById('printHere');
				pH.innerHTML = "";
				pH.innerHTML = msg;
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	function send_state_name(state) {
		var clickedState = state.innerHTML; 
		console.log("클릭된 지역: " + clickedState);
		
		var clickedDay = sendClickedDate();
		console.log("컨트롤러에 전달할 날짜: " + clickedDay);
		
		var mName = findClickedMovie();
		
		var param = {"mName" : mName, "day": clickedDay, "sName": clickedState};
		param = JSON.stringify(param);
		
		$.ajax({
			url: 'sendMovieAndState', 
			type: 'post', 
			data: param,  
			contentType: 'application/json; charset=utf-8', 
			success: function(msg){ 
				console.log("front에서 요청! 영화: " + mName + ", 지역: " + clickedState + ": 날짜: " + clickedDay);
				var pH = document.getElementById('printHere');
				pH.innerHTML = "";
				pH.innerHTML = msg;
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	function move_booking_page(rNum){
		location.href="ticketing?num=" + rNum;
	}

	function print_calendar() {
		$('#datepicker').datepicker().datepicker("show");
	}

	$(function() {
	    $("#datepicker").datepicker({ 
	        onSelect: function() { 
	            var clickedDay = $.datepicker.formatDate("yy.mm.dd", $("#datepicker").datepicker("getDate")); 
	            console.log(clickedDay);
	            
	            onlyClickOneDate(clickedDay);
	            
	            var clickedState = findClickedState();
	    		console.log(clickedState);
	            
	    		var c = findClickedCinema();
	    		var m = findClickedMovie();
	    		
	    		var param = {"cName": c, "day": clickedDay};
	    		var mappingUrl = "sendCinemaAndDay";
	    		
	    		if(m != null && m != ''){
	    			param = {"mName": m, "day": clickedDay, "sName": clickedState};
	    			mappingUrl = "sendMovieAndState";
	    		}
	    		
	    		param = JSON.stringify(param);
	    		
	    		$.ajax({
	    			url: mappingUrl, 
	    			type: 'post', //컨트롤러에서 RequestBody를 찾았기 때문에 ajax에서 post방식으로 요청을 보냈어야 함
	    			data: param,  
	    			contentType: 'application/json; charset=utf-8', 
	    			success: function(msg){ 
	    				console.log("front에서 요청! 극장: " + c + "영화: " + m + ", 지역: " + clickedState + ": 날짜: " + clickedDay);
	    				var pH = document.getElementById('printHere');
	    				pH.innerHTML = "";
	    				pH.innerHTML = msg;
	    			},
	    			error: function(){
	    				alert('실패');
	    			}
	    		});
	        }
	    });                    
	});
</script>
</head>

<body>
	<div class="skip" title="스킵 네비게이션">
		<a href="#contents" title="본문 바로가기">본문 바로가기</a> <a href="#footer"
			title="푸터 바로가기">푸터 바로가기</a>
	</div>
	<div class="body-wrap">

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
			//로그인 버튼
			$(document).on('click', '#moveLogin', function() {

				fn_viewLoginPopup('default', 'pc');

			});

			var sysCd = 'ON';

			//넷퍼넬 스킨 타입 지정
			NetfunnelChk.setting(sysCd, MegaboxUtil.Common.isApp());
		</script>

		<c:import url="../header.jsp" charEncoding="utf-8" />

		<script type="text/javascript">
			var arrList = new Array();
			var tmpData = {
				tabIndx : 0
			};
			var tabChangeAt = 'N'; //상영일 초기화 여부

			$(function() {

				$(document).ready(function() {
					//areaList();
				});

				// 영화명, 극장명 클릭
				$('#contents')
						.on(
								'click',
								'.list-section button',
								function() {
									var leftIdx = $(
											'#contents .tab-left-area li.on')
											.index();
									if (leftIdx > 0 && leftIdx < 3)
										tabChangeAt = "Y"; //상영일 초기화 여부

									var $this = $(this);
									var paramData = {};
									var option = {
										movieObj : $('#contents h3:last'),
										list : arrList,
										movieData : paramData,
										tabChangeAt : tabChangeAt
									};

									// 상영 시간표명 변경
									$('#contents .font-green').html(
											$this.text());

									// 영화별 - 영화 포스터 설정
									if (tmpData.tabIndx == 0) {
										var imgAttr = {
											src : $this.data('imgPath'),
											alt : $this.data('movieNm')
										};
										var lnkAttr = {
											href : '/movie-detail?rpstMovieNo='
													+ $this.data('movieNo'),
											title : $.parseHTML(String($this
													.data('movieNm')))[0].textContent
													+ ' 상세보기'
										};

										$('div.poster-section div.td').html(
												$('<a>').attr(lnkAttr));
										$('div.poster-section div.td a')
												.html(
														$(
																'<img class="poster" onerror="noImg(this, \'del\')"/>')
																.attr(imgAttr));
									}

									// 값 설정
									switch (tmpData.tabIndx) {
									case 0: //영화별
										paramData.masterType = 'movie';
										paramData.movieNo = $this
												.data('movieNo');
										break;

									case 1: //극장별
										paramData.masterType = 'brch';
										paramData.detailType = 'area';
										paramData.brchNo = $this.data('brchNo');
										break;

									case 2: //특별관
										paramData.masterType = 'brch';
										paramData.detailType = 'spcl';
										paramData.theabKindCd = $this
												.data('areaCd');
										paramData.brchNo = $this.data('brchNo');
										break;
									}
									//MegaboxUtil.Brch.init(option);
									//tabChangeAt = "N";
								});
			});
		</script>

		<div id="schdlContainer" class="container">
			<input type="hidden" id="playDe" name="playDe" value="">
			<div class="page-util fixed">
				<div class="inner-wrap">
					<div class="location">
						<span>Home</span> <a href="booking" title="예매 페이지로 이동">예매</a> <a
							href="timetable" title="상영시간표 페이지로 이동">상영시간표</a>
					</div>

				</div>
			</div>

			<div id="contents" class="location-fixed">
				<div class="inner-wrap">
					<div class="time-table-page">
						<div class="movie-choice-area">
							<div class="tab-left-area">
								<ul>
									<li class="on"><a href="#masterMovie" title="영화별 선택"
										class="btn"><i class="iconset ico-tab-movie"></i> 영화별</a></li>
									<li><a href="#masterBrch" title="극장별 선택" class="btn"><i
											class="iconset ico-tab-theater"></i> 극장별</a></li>
								</ul>
							</div>

							<div class="ltab-layer-wrap">
								<div id="masterMovie" class="ltab-layer-cont has-img on">
									<a href="" class="ir"></a>
									<div class="wrap tab-area">
										<div class="tab-list-choice">
											<ul>
												<li><a href="#masterMovie_AllMovie" title="전체영화 선택"
													class="btn on">전체영화</a></li>
											</ul>
										</div>
										<div class="list-section">
											<div id="masterMovie_AllMovie" class="tab-layer-cont on">
												<a href="" class="ir"></a>
												<div class="scroll m-scroll mCustomScrollbar _mCS_2">
													<div id="mCSB_2"
														class=""
														style="max-height: none" tabindex="0"> 
														<div id="mCSB_2_container" class="mCSB_container"
															style="position: relative; top: 0; left: 0;" dir="ltr">
															<ul id="checkMovie" class="list">
																<c:forEach var="movie" items="${applicationScope.mList }">
																	<li>
																		<button type="button" class="btn disabled"
																			onclick="send_movie_name(this)"
																			value="${movie.m_name }"
																			data-img-path="${movie.m_poster }">${movie.m_name }</button>
																	</li>
																</c:forEach>
															</ul>
														 </div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="poster-section">
										<div class="table">
											<div class="td">
												<a href="/movie-detail?rpstMovieNo=21084100"
													title="비상선언 상세보기"><img class="poster"
													onerror="noImg(this, 'del')"
													src="https://img.megabox.co.kr/SharedImg/2022/07/18/QrXStxq2NTGaeHPaAK5xxOXsarNj2aJd_316.jpg"
													alt="비상선언"></a>
											</div>
										</div>
									</div>
								</div>

								<div id="masterBrch" class="ltab-layer-cont">
									<a href="" class="ir"></a>
									<div class="wrap tab-area">
										<div class="tab-list-choice">
											<ul>
												<li><a href="#tab10" title="서울지점 선택" data-area-cd="10"
													class="on">서울(19)</a></li>
												<li><a href="#tab30" title="경기지점 선택" data-area-cd="30">경기(31)</a></li>
												<li><a href="#tab35" title="인천지점 선택" data-area-cd="35">인천(5)</a></li>
												<li><a href="#tab45" title="대전/충청/세종지점 선택"
													data-area-cd="45">대전/충청/세종(17)</a></li>
												<li><a href="#tab55" title="부산/대구/경상지점 선택"
													data-area-cd="55">부산/대구/경상(22)</a></li>
												<li><a href="#tab65" title="광주/전라지점 선택"
													data-area-cd="65">광주/전라(9)</a></li>
												<li><a href="#tab70" title="강원지점 선택" data-area-cd="70">강원(5)</a></li>
											</ul>
										</div>
										<div class="list-section">
											<div id="tab10" class="tab-layer-cont on">
												<div class="scroll m-scroll mCustomScrollbar _mCS_2">
													<div id="mCSB_2"
														class=""
														style="max-height: none" tabindex="0"> 
														<div id="mCSB_2_container" class="mCSB_container"
															style="position: relative; top: 0; left: 0;" dir="ltr">
															<ul name="checkCinema" class="list">
																<c:forEach var="c"
																	items="${applicationScope.sList.get('서울') }">
																	<li><button type="button" class="btn"
																			value="${c }" onclick="send_theater_name(this)"
																			data-area-cd="10" data-brch-no="1372">${c}</button></li>
																</c:forEach>
															</ul>
															<div></div>
														</div>
													</div>
												</div>
											</div>
											<div id="tab30" class="tab-layer-cont">
												<div class="scroll m-scroll mCustomScrollbar _mCS_2">
													<div id="mCSB_2"
														class=""
														style="max-height: none" tabindex="0"> 
														<div id="mCSB_2_container" class="mCSB_container"
															style="position: relative; top: 0; left: 0;" dir="ltr">
															<ul name="checkCinema" class="list">
																<c:forEach var="c"
																	items="${applicationScope.sList.get('경기') }">
																	<li><button type="button" class="btn"
																			value="${c }" onclick="send_theater_name(this)"
																			data-area-cd="10" data-brch-no="1372">${c}</button></li>
																</c:forEach>
															</ul>
															<div></div>
														</div>
													</div>
												</div>
											</div> 
											<div id="tab35" class="tab-layer-cont">
												<div
													class="scroll m-scroll mCustomScrollbar _mCS_5 mCS_no_scrollbar">
													<div id="mCSB_5"
														class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
														style="max-height: 200px;" tabindex="0">
														<div id="mCSB_5_container"
															class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
															style="position: relative; top: 0; left: 0;" dir="ltr">
															<ul class="list">
																<c:forEach var="c"
																	items="${applicationScope.sList.get('인천') }">
																	<li><button type="button" class="btn"
																			value="${c }" onclick="send_theater_name(this)"
																			data-area-cd="10" data-brch-no="1372">${c}</button></li>
																</c:forEach>
															</ul>
															<div></div>
														</div>
													</div>
												</div>
											</div>
											<div id="tab45" class="tab-layer-cont">
												<div
													class="scroll m-scroll mCustomScrollbar _mCS_5 mCS_no_scrollbar">
													<div id="mCSB_5"
														class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
														style="max-height: 200px;" tabindex="0">
														<div id="mCSB_5_container"
															class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
															style="position: relative; top: 0; left: 0;" dir="ltr">
															<ul class="list">
																<c:forEach var="c"
																	items="${applicationScope.sList.get('대전') }">
																	<li><button type="button" class="btn"
																			value="${c }" onclick="send_theater_name(this)"
																			data-area-cd="10" data-brch-no="1372">${c}</button></li>
																</c:forEach>
															</ul>
															<div></div>
														</div>
													</div>
												</div>
											</div>
											<div id="tab55" class="tab-layer-cont">
												<div
													class="scroll m-scroll mCustomScrollbar _mCS_5 mCS_no_scrollbar">
													<div id="mCSB_5"
														class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
														style="max-height: 200px;" tabindex="0">
														<div id="mCSB_5_container"
															class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
															style="position: relative; top: 0; left: 0;" dir="ltr">
															<ul class="list">
																<c:forEach var="c"
																	items="${applicationScope.sList.get('부산') }">
																	<li><button type="button" class="btn"
																			value="${c }" onclick="send_theater_name(this)"
																			data-area-cd="10" data-brch-no="1372">${c}</button></li>
																</c:forEach>
															</ul>
															<div></div>
														</div>
													</div>
												</div>
											</div>
											<div id="tab65" class="tab-layer-cont">
												<div
													class="scroll m-scroll mCustomScrollbar _mCS_5 mCS_no_scrollbar">
													<div id="mCSB_5"
														class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
														style="max-height: 200px;" tabindex="0">
														<div id="mCSB_5_container"
															class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
															style="position: relative; top: 0; left: 0;" dir="ltr">
															<ul class="list">
																<c:forEach var="c"
																	items="${applicationScope.sList.get('광주') }">
																	<li><button type="button" class="btn"
																			value="${c }" onclick="send_theater_name(this)"
																			data-area-cd="10" data-brch-no="1372">${c}</button></li>
																</c:forEach>
															</ul>
															<div></div>
														</div>
													</div>
												</div>
											</div>
											<div id="tab70" class="tab-layer-cont">
												<div
													class="scroll m-scroll mCustomScrollbar _mCS_5 mCS_no_scrollbar">
													<div id="mCSB_5"
														class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
														style="max-height: 200px;" tabindex="0">
														<div id="mCSB_5_container"
															class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
															style="position: relative; top: 0; left: 0;" dir="ltr">
															<ul class="list">
																<c:forEach var="c"
																	items="${applicationScope.sList.get('강원') }">
																	<li><button type="button" class="btn"
																			value="${c }" onclick="send_theater_name(this)"
																			data-area-cd="10" data-brch-no="1372">${c}</button></li>
																</c:forEach>
															</ul>
															<div></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="box-alert mt40" style="display: none">
							<i class="iconset ico-bell"></i> <strong></strong> <span></span>
						</div>

						<h3 class="tit mt60">
							<span class="font-green">비상선언</span> 상영시간표
						</h3>
						<div class="time-schedule mb30">
							<div class="wrap">
								<button type="button" title="이전 날짜 보기" class="btn-pre"
									disabled="true">
									<i class="iconset ico-cld-pre"></i> <em>이전</em>
								</button>
								<div class="date-list">
									<div class="year-area">
										<div class="year" style="left: 30px; z-index: 1; opacity: 1;">2022.08</div>
										<div class="year" style="left: 450px; z-index: 1; opacity: 0;"></div>
									</div>
									<div class="date-area">
										<div class="wrap"
											style="position: relative; width: 2100px; border: none; left: -70px;">
											<c:forEach var="d" items="${applicationScope.dList }">
												<button onclick="click_date(this);" name="actual_date"
													class="" type="button"
													value="${d.year }.${d.month }.${d.date }"
													month="${d.month }" tabindex="-1">
													<span class="ir">${d.year }년 ${d.month }월</span><em
														style="pointer-events: none;">${d.date }<span
														style="pointer-events: none;" class="ir">일</span></em><span
														class="day-kr"
														style="pointer-events: none; display: inline-block">${d.dayOfWeek }</span><span
														class="day-en" style="pointer-events: none; display: none">Mon</span>
												</button>
											</c:forEach>
										</div>
									</div>
								</div>

								<button type="button" title="다음 날짜 보기" class="btn-next"
									disabled="true">
									<i class="iconset ico-cld-next"></i> <em>다음</em>
								</button>
								<div class="bg-line">
									<input type="hidden" id="datepicker">
									<button type="button" class="btn-calendar-large" title="달력보기"
										onclick="print_calendar()">달력보기</button>
								</div>
							</div>
						</div>
						<div class="movie-option mb20">
							<div class="option">
								<ul>
									<li><i class="iconset ico-stage" title="무대인사"></i>무대인사</li>
									<li><i class="iconset ico-user" title="회원시사"></i>회원시사</li>
									<li><i class="iconset ico-open" title="오픈시사"></i>오픈시사</li>
									<li><i class="iconset ico-goods" title="굿즈패키지"></i>굿즈패키지</li>
									<li><i class="iconset ico-singalong" title="싱어롱"></i>싱어롱</li>
									<li><i class="iconset ico-gv" title="GV"></i>GV</li>
									<li><i class="iconset ico-sun" title="조조"></i>조조</li>
									<li><i class="iconset ico-brunch" title="브런치"></i>브런치</li>
									<li><i class="iconset ico-moon" title="심야"></i>심야</li>
								</ul>
							</div>
							<div class="rateing-lavel">
								<a href="" class="" title="관람등급안내">관람등급안내</a>
							</div>
						</div>
						<div class="reserve theater-list-box">
							<div class="tab-block tab-layer mb30" id="tab-layer">
								<ul id="tab-layer-ul">
									<li class="on" value="서울"><a href="" class="btn"
										data-area-cd="10" onclick="send_state_name(this)">서울</a></li>
									<li value="경기"><a href="" class="btn" data-area-cd="30"
										onclick="send_state_name(this)">경기</a></li>
									<li value="인천"><a href="" class="btn" data-area-cd="35"
										onclick="send_state_name(this)">인천</a></li>
									<li value="대전/충청/세종"><a href="" class="btn"
										data-area-cd="45" onclick="send_state_name(this)">대전/충청/세종</a></li>
									<li value="부산/대구/경상"><a href="" class="btn"
										data-area-cd="55" onclick="send_state_name(this)">부산/대구/경상</a></li>
									<li value="광주/전라"><a href="" class="btn" data-area-cd="65"
										onclick="send_state_name(this)">광주/전라</a></li>
									<li value="강원"><a href="" class="btn" data-area-cd="70"
										onclick="send_state_name(this)">강원</a></li>
								</ul>
							</div>

							<div id="printHere">
							</div>
						</div>
						<div class="box-border v1 mt30" style="display: none;">
							<ul class="dot-list gray"></ul>
						</div>
					</div>
				</div>
			</div>
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

		<div class="quick-area" style="display: block;">
			<a href="" class="btn-go-top" title="top" style="position: fixed;">top</a>
		</div>

		<c:import url="../footer.jsp" charEncoding="utf-8" />

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