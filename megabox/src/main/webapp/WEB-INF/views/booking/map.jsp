<%@page import="java.time.LocalTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.net.*"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="./image/megabox_logo.ico">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css"
	rel="stylesheet">
<!-- <link href='css/header_footer.css' rel='stylesheet' type='text/css'> -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MEET PLAY SHARE, 내가박스</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />

<%-- <script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"
	integrity="sha256-xH4q8N0pEzrZMaRmd7gQVcTZiFei+HfRTBPJ1OGXC0k="
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="${path }/resources/cssjs/fast-rev.css"
	type="text/css" />
<link rel="stylesheet"
	href="${path }/resources/cssjs/jquery.mCustomScrollbar.css"
	type="text/css" />



<script src="${path}/resources/js/front.js"></script> 

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>  --%>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"
	integrity="sha256-xH4q8N0pEzrZMaRmd7gQVcTZiFei+HfRTBPJ1OGXC0k="
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="${path }/resources/map/fast-rev.css"
	type="text/css" />
<%-- <link rel="stylesheet"
	href="${path }/resources/map/jquery.mCustomScrollbar.css"
	type="text/css" /> --%>
<!-- <script type="text/javascript"
	src="${path }/resources/cssjs/jquery.mCustomScrollbar.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="${path }/resources/cssjs/jquery-3.6.0.min.js"></script> -->


<%-- <script src="${path}/resources/js/front.js"></script> --%>
<script type="text/javascript">
/*======== */
$(function(){
	var c_num="";
	var c_name="";
	var m_num="";
	var m_name="";
	var hour="";
	/* var date="";
	var year="";
	
	var month="";
	
	var t_date=""; */
	
	var params
	var req;
	function send(params){ 
	   req = new XMLHttpRequest();
	   req.onreadystatechange = textChange;
	   req.open('post', 'map');
	   params = JSON.stringify(params);
	   req.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
	   req.send(params); 
	}
	function textChange(){
	   if(req.readyState == 4 && req.status == 200){
	      	$("#s_list").empty();
	      	var jsonDatas = JSON.parse(req.responseText);
	        console.log(jsonDatas);
	       	var data = "";
	       /* for */
	       if (req.responseText== "false"){
	    	   $('.result').removeClass('on');
				$('.no-result').addClass('on');
	       }
	      // alert(req.responseText);	
	     	for(i=0;i<jsonDatas.cd.length;i++){
	    	//alert(jsonDatas.cd[i].r_start+"\n"+jsonDatas.cd[i].r_end+"\n"+jsonDatas.cd[i].m_name+"\n"+jsonDatas.cd[i].c_name+"\n"+jsonDatas.cd[i].r_able);
	   		data += "<li>";
	   		data += "<a href='ticketing?num="+jsonDatas.cd[i].r_num+"' data-num='"+jsonDatas.cd[i].r_num+"' id='r_list'  class='btn'>";
	   		data +=	"<span class='time'>";
	   		data += "	<strong title='상영 시작'>"+jsonDatas.cd[i].r_start+"</strong>";
	   		data += "	<em title='상영 종료'>~"+jsonDatas.cd[i].r_end+"</em>";
	   		data += "</span>";
	   		data += "<span class='title'>";
	   		data += "	<strong title='"+m_name+"'>"+m_name+/* +jsonDatas.cd[i].m_name+ */"</strong>";
	   		data += "	<em>"+"2D"+"</em>";
	   		data += "</span>";
	   		data += "<div class='info'>";
	   		data += "	<span class='theater' title='극장'>"+c_name+"<br>"
	   			if(jsonDatas.cd[i].s_type == "com"){
	   				data += "컴포트";
	   			} 
	   		data += 	jsonDatas.cd[i].s_name+"관</span>";	
	   		data += "	<span class='seat'>";
	   		data += "		<strong class='now' title='잔여 좌석'>"+jsonDatas.cd[i].r_able+"</strong>";
	   		data += "		<span>/</span>";
	   		data += "		<em class='all' title='전체 좌석'>"+jsonDatas.cd[i].s_seat+"</em>";
	   		data += "	</span>";
	   		data += "</div>";
	   		data += "</a>";
	   		data += "</li>";  
	   		}  
	        var movieList = document.getElementById('s_list');
	        movieList.innerHTML = data;
	   }
	}
/* 	function rrr(num){
		alert(num);
	} */
	function resultmovie() {
		if($("li > #btn").hasClass("on") === true) {
			//영화관이름
			if($(".date-area button").hasClass("on") === true) {
				//date
				if($(".btn ").hasClass("on") === true) {
				//영화이름
				//alert("on");
					var date = $('.date-area .on em').text();
					var year = $(".date-area .on").attr('year');
					var month = $(".date-area .on").attr('month');
					if (month.length=1){
						month = "0"+month;
					}
					if (date<10){
						date = "0"+date;
					}
					var t_date = year+"."+month+"."+date;
					//alert("영화관 : "+c_name+ "/"+ c_num + "\n영화 : "+ m_name+ "/"+ m_num +"\n일자 : "+ t_date);
				
					//여기에 ajax 상영시간정보 출력하는코드 작성 str4  no-result//+"\n시간 : "+ hour
					$('.no-result').removeClass('on');
					$('.result').addClass('on');
					
					    params = {
					    		c_num     : c_num
					    	  ,	c_name     : c_name
				              , m_num       : m_num
				              , m_name       : m_name
				              , t_date       : t_date
				      }
					 send(params);
		           
					
				}
			} 
		}
	}
	//btn-prev-time / btn-next-time
	
	 $("hour-schedule > #next-time").click(function(){
		 alert("dwdw");
		
	 });
	$('.btn ').on("click",function(){
		$(".btn").removeClass("on");
		$(this).toggleClass('on');
		m_num = $(this).parents("li").attr("movie_code");
		m_name = $(this).find('.txt').text();
		resultmovie();
	});
	
	$('#theater-list > li > button').on("click",function(){
		$("li > #btn").removeClass("on");
		$("#theater-list > li > button").removeClass("on");
		$("#theater-list > li > button").next().removeClass("on");
		$(this).toggleClass('on');
		$(this).next('').addClass('on');
	});
	$('li > #btn').on("click",function(){
		$("li > #btn").removeClass("on");
		$(this).toggleClass('on');
		c_name = $(this).text();
		c_num = $(this).attr("cinema_code"); 
		resultmovie();
	});
	
	$('.date-area button').on("click",function(){
		$(".date-area .on").removeClass("on");
		$(".date-area button").removeClass("on");
		$(this).toggleClass('on');
		if ($('.date-area .on span').text()=="오늘") {
			$("#timebtn2").attr("style", "display:none");
			$("#timebtn1").removeAttr("style");
        } else {
        	$("#timebtn1").attr("style", "display:none");
    		$("#timebtn2").removeAttr("style");
        }
		$(".hour").removeClass("on");

		resultmovie();
	});
	$('.hour').on("click",function(){
		$(".hour").removeClass("on");
		$(this).toggleClass('on');
		hour = $(this).text();
		
		resultmovie();
		/* if($(".hour ").hasClass("on") === true) {
		시간 클릭시에 포커스를 그 시간대영화가  최상단으로 
		} */
	});
	$(".scrollbar").mCustomScrollbar({
		theme: "light-3", // 테마 적용
		mouseWheelPixels: 300, // 마우스휠 속도
		scrollInertia: 400 // 부드러운 스크롤 효과 적용
	});
	
/*======== */	
	
	
	$('#exitButton').on("click",function(){
		$(this).parents(".background").toggleClass('on');
	});
	
	$('#loginBox').on("click",function(){
		$(".background").toggleClass('on');
	});
	
	$('#movelogin').on("click",function(){
		$(".layer-mynega").removeClass("on");
		$(".background").addClass('on');
		$(".mymegabox").removeClass('on');
	});
	
	$('.mymegabox').click(function(){
		$(this).toggleClass("on");
		$(".layer-mynega").toggleClass("on");
	});
	
	$('#sitemap').click(function(){
		$(this).toggleClass("on");
		$('.layer-sitemap').toggleClass("on");
	});
	
	$('.gnb-txt-movie, .gnb-depth2').mouseenter(function(){
		$('#gnb').addClass("on");
		$(this).parent('li').addClass("on");
	});
	
	$('.gnb-txt-movie, .gnb-depth2').mouseleave(function(){
		$('#gnb').removeClass("on");
		$(this).parent('li').removeClass("on");
	});

	$('.gnb-txt-reserve, .gnb-depth2').mouseenter(function(){
		$('#gnb').addClass("on");
		$(this).parent('li').addClass("on");
	});
	
	$('.gnb-txt-reserve, .gnb-depth2').mouseleave(function(){
		$('#gnb').removeClass("on");
		$(this).parent('li').removeClass("on");
	});
	
	$('.gnb-txt-theater, .gnb-depth2').mouseenter(function(){
		$('#gnb').addClass("on");
		$(this).parent('li').addClass("on");
	});
	
	$('.gnb-txt-theater, .gnb-depth2').mouseleave(function(){
		$('#gnb').removeClass("on");
		$(this).parent('li').removeClass("on");
	});
	
	$('.gnb-txt-event, .gnb-depth2').mouseenter(function(){
		$('#gnb').addClass("on");
		$(this).parent('li').addClass("on");
	});
	
	$('.gnb-txt-event, .gnb-depth2').mouseleave(function(){
		$('#gnb').removeClass("on");
		$(this).parent('li').removeClass("on");
	});
	
	$('.gnb-txt-benefit, .gnb-depth2').mouseover(function(){
		$('#gnb').addClass("on");
		$(this).parent('li').addClass("on");
	});
	
	$('.gnb-txt-benefit, .gnb-depth2').mouseout(function(){
		$('#gnb').removeClass("on");
		$(this).parent('li').removeClass("on");
	}); 
	/*  ======================================= ============= =*/
});


</script>

</head>
<body>

	<!-- ▽main  -->
	<div class="inner-wrap"
		style="padding-top: 40px; padding-bottom: 100px">
		<!-- quick-reserve -->
		<div class="quick-reserve">
			<div class="tit-util">
				<h2 class="tit">빠른예매</h2>
			</div>

			<div class="mega-quick-reserve-inculde">
				<!-- time-schedule -->
				<div class="time-schedule quick">
					<div class="wrap">
						<!-- 이전날짜 -->
						<button type="button" title="이전 날짜 보기" class="btn-pre">
							<!-- <i class="iconset ico-cld-pre"></i> <em>이전</em> -->
						</button> 
						<!--// 이전날짜 -->

						<div class="date-list">
							<!-- 년도, 월 표시 -->

							<script> 
									let today = new Date();
									let year = today.getFullYear(); // 년도
									let month = today.getMonth() + 1;  // 월
									let date = today.getDate();  // 날짜
									let day = today.getDay();  // 요일
									str = year + "." + month;
								</script>

							<div class="year-area">
								<script>
										document.write("<div class='year'>" + str + "</div>");
									</script>
							</div>

							<script>
									//날짜문제
									//var arr_date = [5,6,7,8,9,10,11,12,13,14,15,16,17,18];   // 일
									//var arr_day = ['오늘', '내일', '화', '수','목','금','토','일','월','화','수','목','금','토'];    // 요일
									var arr_year = new Array(14);
									var arr_month = new Array(14);
									var arr_date = new Array(14);
									var arr_day = new Array(14);        // 요일
									var arr_day2 = new Array(14);       // 요일2

									for (var i = 0; i < 14; i++) { // 일단, arr_day[] 에 0~6를 넣어놓고.  (i가 0이면 '오늘'임.) %는 몫이 아니라, 나머지를 구하는 것
										arr_day[i] = (day + i) % 7;
										arr_day2[i]  = (day + i) % 7;
									}
									for (var i = 0; i < 14; i++) {
										switch (arr_day[i]) {
											case 0: arr_day[i] = '일'; break;
											case 1: arr_day[i] = '월'; break;
											case 2: arr_day[i] = '화'; break;
											case 3: arr_day[i] = '수'; break;
											case 4: arr_day[i] = '목'; break;
											case 5: arr_day[i] = '금'; break;
											case 6: arr_day[i] = '토'; break;
										}
									}
									for (var i = 0; i < 14; i++) {
										switch (arr_day2[i]) {
											case 0: arr_day2[i] = '일'; break;
											case 1: arr_day2[i] = '월'; break;
											case 2: arr_day2[i] = '화'; break;
											case 3: arr_day2[i] = '수'; break;
											case 4: arr_day2[i] = '목'; break;
											case 5: arr_day2[i] = '금'; break;
											case 6: arr_day2[i] = '토'; break;
										}
									}

									for (var i = 0; i < 14; i++) {
										today = new Date();
										the_day = new Date(today.setDate(today.getDate() + i));
										arr_year[i] = the_day.getFullYear();
										arr_month[i] = the_day.getMonth()+1;
										arr_date[i] = the_day.getDate();
									}

								</script>

							<div class="date-area">
								<div class="wrap"
									style="position: relative; width: 2100px; border: none;">

									<script>
									
											for (var i = 0; i < 14; i++) {
												var str = "<button class='' year='"+arr_year[i]+"' month='"+arr_month[i]+"'>"
													+ "<em>" + arr_date[i] + "</em>" //일
													+ "<span style='display: inline-block;'>" + arr_day[i] + "</span>"//요일 
													+ "<strong class='hidden'>"+ arr_day2[i] +"</strong>" /*  =>화면 선택이 깨진다. */
													+ "</button>";
												document.write(str);
												if (arr_day[i] == "토") {
													$(".time-schedule .date-area button").eq(i).attr('class', 'sat');
												}
												else if (arr_day[i] == "일") {
													$(".time-schedule .date-area button").eq(i).attr('class', 'holi');
												}
												if (i >= 12) {
													$(".time-schedule .date-area button").eq(i).attr('class', 'disabled');
												}
												if ('<%=request.getParameter("date")%>'=='null' && i == 0) {
													$(".time-schedule .date-area button").eq(i).addClass('on');
												}
												//if(i==1)
//alert( arr_year[i]+"" + (arr_month[i]<10 ? "0"+arr_month[i] : arr_month[i])+""+(arr_date[i]<10 ? "0"+arr_date[i] : arr_date[i]) + "   vs   " + <%=request.getParameter("date")%>);
												<%--  if( '<%=request.getParameter("date")%>
									' == arr_year[i]
												+ ""
												+ (arr_month[i] < 10 ? "0"
														+ arr_month[i]
														: arr_month[i])
												+ ""
												+ (arr_date[i] < 10 ? "0"
														+ arr_date[i]
														: arr_date[i])) {
											$(
													".time-schedule .date-area button")
													.eq(i).addClass('on');
										}  --%>
										if (i == 0) {
											$(
													".time-schedule .date-area button span")
													.eq(i).text('오늘');
										}
										if (i == 1) {
											$(
													".time-schedule .date-area button span")
													.eq(i).text('내일');
										}
									}
									/* 			for(var i=0;i<=6;i++){
													alert(arr_day2[i]); =>월,화.수,목,금,토,일(오늘 내일 적용안함)
												} */
								</script>

								</div>
							</div>
						</div>

						<!-- 다음날짜 -->
						 <button type="button" title="다음 날짜 보기" class="btn-next">
							<!-- <i class="iconset ico-cld-next"></i> <em>다음</em> -->
						</button>
						<!--// 다음날짜 -->

						<!-- 달력보기 -->
						<div class="bg-line">
							<input type="hidden" value="2021.12.06" />
							<button class="btn-calendar-large" title="달력보기">달력보기</button>
						</div>
						<!--// 달력보기 -->
					</div>
				</div>
				<!--// time-schedule -->

				<!-- quick-reserve-area -->
				<div class="quick-reserve-area">
					<!-- movie-choice : 영화 선택  -->
					<div class="movie-choice">
						<p class="tit">영화</p>

						<!-- list-area -->
						<div class="list-area">
							<!-- all : 전체 -->
							<div class="all-list">
								<button type="button" class="btn-tab on" id="movieAll">
									전체</button>
								<div class="list">
									<div class="scroll n-scroll nCustomScrollbar _mCS_1 scrollbar"
										id="movieList">
										<div id="mCSB_1"
											class="nCustomScrollBox mCS-light mCSB_vertical nCSB_inside "
											style="max-height: none" tabindex="0">
											<!--이 녀석을 없애니까, 스크롤이 사라짐-->
											<div id="mCSB_1_container" class="nCSB_container scrollbar"
												height="400px" style="position: relative; top: 0; left: 0"
												dir="ltr">
												<ul>
													<c:forEach var="m_list" items="${m_list }">
														<li movie_code='${m_list.m_num }'>
															<button type='button' class='btn ' onclick="btnclick();">
																<c:if test="${m_list.m_age == '등급미정'}">
																	<span class="movie-grade small age-no">${m_list.m_age}</span>
																</c:if>
																<c:if test="${m_list.m_age == '전체관람가'}">
																	<span class="movie-grade small age-all">${m_list.m_age}</span>
																</c:if>
																<c:if test="${m_list.m_age == '청소년관람불가'}">
																	<span class="movie-grade small age-19">${m_list.m_age}</span>
																</c:if>
																<c:if test="${m_list.m_age == '15세이상관람가'}">
																	<span class="movie-grade small age-15">${m_list.m_age}</span>
																</c:if>
																<c:if test="${m_list.m_age == '12세이상관람가'}">
																	<span class="movie-grade small age-12">${m_list.m_age}</span>
																</c:if>
																<i class='iconset ico-heart-small'>보고싶어 설정안함</i> <span
																	class='txt'>${m_list.m_name }</span>
															</button>
														</li>
														<%-- <li><button type="button" class="btn"
															movie-nm="${m_list.m_name }" movie-no="${m_list.m_num }"
															img-path="${m_list.m_poster }" movie-popup-at="N"
															movie-popup-no="0" form-at="Y">
															<c:if test="${m_list.m_age == '등급미정'}">
																<span class="movie-grade small age-no">${m_list.m_age}</span>
															</c:if>
															<c:if test="${m_list.m_age == '전체관람가'}">
																<span class="movie-grade small age-all">${m_list.m_age}</span>
															</c:if>
															<c:if test="${m_list.m_age == '청소년관람불가'}">
																<span class="movie-grade small age-19">${m_list.m_age}</span>
															</c:if>
															<c:if test="${m_list.m_age == '15세이상관람가'}">
																<span class="movie-grade small age-15">${m_list.m_age}</span>
															</c:if>
															<c:if test="${m_list.m_age == '12세이상관람가'}">
																<span class="movie-grade small age-12">${m_list.m_age}</span>
															</c:if>
															<i class="iconset ico-heart-small">보고싶어 설정안함</i><span
																class="txt">${m_listm.m_name }</span>
														</button></li> --%>
													</c:forEach>
													<%-- <%
												for(String vo :listStr1){ //listStr1은 ArrayList이지마느 요소 하나만 vo에 담기 때문에, vo는 String이다.
%>
													 <%=vo %>	<!--삽입 str1  -->			 		
<%														
													}
%>  --%>
												</ul>
											</div>

										</div>
									</div>
								</div>
							</div>
							<!--// all : 전체 -->
						</div>
						<!--// list-area -->
						<div class="other-list">
							<button type="button" class="btn-tab" id="movieCrtn">큐레이션</button>
							<div class="list" style="display: block;"></div>
						</div>


						<%-- <div class="view-area">

							<div class="choice-all on" id="choiceMovieNone">
								<strong>모든영화</strong><br /> <span>목록에서 영화를 선택하세요.</span>
							</div>
							<div class="choice-list " id="choiceMovieList">
								<% 
									for(String vo : listPhotoName){
									%>
											<%= vo %>
									
									<%}%>
							</div>
						</div> --%>

					</div>
					<!--// movie-choice : 영화 선택  -->

					<!-- theater-choice : 극장 선택  -->
					<div class="theater-choice">
						<div class="tit-area">
							<p class="tit">극장</p>
						</div>

						<!-- list-area -->
						<div class="list-area" id="brchTab">
							<!-- all-theater-list : 전체 -->
							<div class="all-theater-list">
								<button type="button" class="btn-tab on" style="width: 156px;">전체</button>
								<div class="list" style="height: 400px";>
									<div class="scroll" id="brchList">
										<ul id="theater-list">

											<li>
												<button type='button' class=''>
													<span>서울</span>
												</button>
												<div class='depth'>
													<div id='seoul' class='detail-list scrollbar'>
														<ul>
															<c:forEach var="c_list" items="${c_list }">
																<c:if test="${c_list.cities == '서울' }">
																	<li><button cinema_code="${c_list.c_num}" id='btn'
																			type='button' class=''>${c_list.c_name}</button></li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
											</li>
											<li>
												<button type='button' class=''>
													<span>경기</span>
												</button>
												<div class='depth'>
													<div id='gyeonggi' class='detail-list scrollbar'
														overflow-x="none">
														<ul>
															<c:forEach var="c_list" items="${c_list }">
																<c:if test="${c_list.cities == '경기' }">
																	<li><button cinema_code="${c_list.c_num}" id='btn'
																			type='button' class=''>${c_list.c_name}</button></li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
											</li>
											<li>
												<button type='button' class=''>
													<span>인천</span>
												</button>
												<div class='depth'>
													<div id='incheon' class='detail-list scrollbar'>
														<ul>
															<c:forEach var="c_list" items="${c_list }">
																<c:if test="${c_list.cities == '인천' }">
																	<li><button cinema_code="${c_list.c_num}" id='btn'
																			type='button' class=''>${c_list.c_name}</button></li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
											</li>

											<li>
												<button type='button' class=''>
													<span>대전/충청/세종</span>
												</button>
												<div class='depth'>
													<div id='daejeon' class='detail-list scrollbar'>
														<ul>
															<c:forEach var="c_list" items="${c_list }">
																<c:if test="${c_list.cities == '대전' }">
																	<li><button cinema_code="${c_list.c_num}" id='btn'
																			type='button' class=''>${c_list.c_name}</button></li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
											</li>
											<li>
												<button type='button' class=''>
													<span>부산/대구/경상</span>
												</button>
												<div class='depth'>
													<div id='pusan' class='detail-list scrollbar'>
														<ul>
															<c:forEach var="c_list" items="${c_list }">
																<c:if test="${c_list.cities == '부산' }">
																	<li><button cinema_code="${c_list.c_num}" id='btn'
																			type='button' class=''>${c_list.c_name}</button></li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
											</li>
											<li>
												<button type='button' class=''>
													<span>광주/전라</span>
												</button>
												<div class='depth'>
													<div id='gwangju' class='detail-list scrollbar'>
														<ul>
															<c:forEach var="c_list" items="${c_list }">
																<c:if test="${c_list.cities == '광주' }">
																	<li><button cinema_code="${c_list.c_num}" id='btn'
																			type='button' class=''>${c_list.c_name}</button></li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
											</li>
											<li>
												<button type='button' class=''>
													<span>강원</span>
												</button>
												<div class='depth'>
													<div id='gangwon' class='detail-list scrollbar'>
														<ul>
															<c:forEach var="c_list" items="${c_list }">
																<c:if test="${c_list.cities == '강원' }">
																	<li><button cinema_code="${c_list.c_num}" id='btn'
																			type='button' class=''>${c_list.c_name}</button></li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
											</li>


											<!--삽입 str3  -->
											<%-- 	<%for(String vo:listStr3){ 
											%>
												<%=vo%> 	
											<% }%>	 --%>

										</ul>
									</div>
								</div>
							</div>

							<div class="other-list">
								<button type="button" class="btn-tab"
									style="left: 156px; width: 156px;">특별관</button>
							</div>
						</div>


						<!-- <div class="view-area">  
							
								<div class="choice-all on">
									<strong>전체극장</strong><br/>
									<span>목록에서 극장을 선택하세요.</span>
								</div>

							
								<div class="choice-list "> 
									<div class="bg">
										<div class="wrap">
											<p class="txt">강남<button type="button" class="del">삭제</button></p>
										</div>
									</div>
									<div class="bg">
									</div>
									<div class="bg">
									</div>
								</div>
							</div>  -->



					</div>
					<!--// theater-choice : 영화관 선택  -->

					<!-- time-choice : 상영시간표 선택 -->
					<div class="time-choice">
						<div class="tit-area">
							<p class="tit">시간</p>

							<div class="right legend">
								<i class="iconset ico-sun" title="조조"></i> 조조 <i
									class="iconset ico-brunch" title="브런치"></i> 브런치 <i
									class="iconset ico-moon" title="심야"></i> 심야
							</div>
						</div>

						<!-- hour-schedule : 시간 선택  : 00~30 시-->
						<div class="hour-schedule">
							<button id="prev-time" type="button" class="btn-prev-time">이전 시간 보기</button>

							<div class="wrap" style="overflow: hidden;">
								<div id="timebtn1" class="view">
									<!-- class="hour on"에서 on으로 조정 -->
									<!--disabled="true"가 켜지면 버튼이 비활성화되면서, 회색이 된다. 없애면 원래대로 돌아간다.  -->
									<%
										LocalTime nowh = LocalTime.now();
									LocalDate nowd = LocalDate.now();
									DateTimeFormatter hh = DateTimeFormatter.ofPattern("kk");
									DateTimeFormatter day = DateTimeFormatter.ofPattern("yyyy.MM.dd");
									String nowdate = nowh.format(hh);

									int hour = Integer.valueOf(nowh.format(hh));
									if (hour < 7)
										hour = 7;

									//year month date  vs  year month paramDate 
									/* if(!(paramDate==null || ((year+ "" + (month<10 ? "0"+month : month) + "" + (date<10 ? "0"+date : date))).equals(paramDate))) {
										hour = 7;
									} */
									%>

									<button type="button" class="hour" disabled="true"
										style="opacity: 0.5"><%=(hour - 4 < 10 ? "0" + (hour - 4) : (hour - 4))%></button>
									<button type="button" class="hour" disabled="true"
										style="opacity: 0.5"><%=(hour - 3 < 10 ? "0" + (hour - 3) : (hour - 3))%></button>
									<button type="button" class="hour" disabled="true"
										style="opacity: 0.5"><%=(hour - 2 < 10 ? "0" + (hour - 2) : (hour - 2))%></button>
									<button type="button" class="hour" disabled="true"
										style="opacity: 0.5"><%=(hour - 1 < 10 ? "0" + (hour - 1) : (hour - 1))%></button>
									<button type="button" class="hour"><%=(hour < 10 ? "0" + (hour) : (hour))%></button>
									<button type="button" class="hour"><%=(hour + 1 < 10 ? "0" + (hour + 1) : (hour + 1))%></button>
									<button type="button" class="hour"><%=(hour + 2 < 10 ? "0" + (hour + 2) : (hour + 2))%></button>
									<button type="button" class="hour"><%=(hour + 3 < 10 ? "0" + (hour + 3) : (hour + 3))%></button>
									<button type="button" class="hour"><%=(hour + 4 < 10 ? "0" + (hour + 4) : (hour + 4))%></button>
									<button type="button" class="hour"><%=(hour + 5 < 10 ? "0" + (hour + 5) : (hour + 5))%></button>

								</div>
								<div id="timebtn2" class="view" style="display: none;">
									<!-- class="hour on"에서 on으로 조정 -->
									<!--disabled="true"가 켜지면 버튼이 비활성화되면서, 회색이 된다. 없애면 원래대로 돌아간다.  -->

									<%-- <%for(int i=0; i<9; i++) {%>
										<button type="button" class="hour" disabled="true" style="opacity: 0.5"><%="0"+i%></button>
					 					<%} %>  --%>
									<button type="button" class="hour">09</button>
									<%
										for (int i = 10; i <= 18; i++) {
									%>
									<button type="button" class="hour"><%=i%></button>
									<%
										}
									%>
								</div>
							</div>

							<button id="next-time" type="button" class="btn-next-time">다음 시간 보기</button>
						</div>
						<!--// hour-schedule : 시간 선택  : 00~30 시-->

						<!-- movie-schedule-area : 시간표 출력 영역-->
						<div class="movie-schedule-area">
							<!-- 영화, 영화관 선택 안했을때 -->
							<!-- on의 유무로 조정. 시간표가 없을 때는 on이 켜지고, 시간표가 뜨면 on이 꺼진다. -->
							<div class="no-result on" id="playScheduleNonList">
								<i class="iconset ico-movie-time"></i>

								<p class="txt">
									영화와 극장을 선택하시면<br /> 상영시간표를 비교하여 볼 수 있습니다.
								</p>
							</div>

							<!-- 영화, 영화관 선택 했을때 result on이 되면서 켜짐 -->
							<div id='result' class="result">
								<div class="scroll scrollbar" id="playScheduleList"
									style="display: block; height: 430px;">

									<ul id="s_list">
										<%-- <% 
											System.out.println("Controller?command=fastRev : " + listStr4);
									for(String vo : listStr4){
									%>
											<%= vo %>
									
									<%}%>
											
											 --%>
									</ul>
								</div>

							</div>



						</div>
						<!--// movie-schedule-area : 시간표 출력 영역-->
					</div>
					<!--// time-choice : 상영시간표 선택 -->
				</div>
				<!--// quick-reserve-area -->
			</div>
		</div>



	</div>
</body>
</html>