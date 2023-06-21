<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy.MM.dd hh24:mm" var="nowDate" />  
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:if test="${empty sessionScope.loginId }">
	<script>
	alert('로그인 후 이용해주세요.');
	location.href='main'
	</script>
</c:if>
<!DOCTYPE html>
<c:import url="../header.jsp" charEncoding="utf-8" />

<!-- 헤더 바로 아래 바 이름 변경 -->
<script type="text/javascript">

	var locationIdx;

	$(document).ready(function(){

		// 탭변경
		$('#contents .tab-block li').click(function() {

			var $div  = $('#myLoaction div.location');
			var $this = $(this);
			var url   = $(this).data('url');
			var tit   = $(this).data('tit');

			// 탭 제목
			if (tit == undefined) tit = $this.text();

			// 탭정보 설정
			if ($div.find('a').length == locationIdx) {
				$div.append($('<a>').attr({'href': url, 'title' : tit + ' 페이지로 이동'}).html(tit));
			} else {
				$div.find('a').eq(locationIdx).attr({'href': url, 'title' : tit + ' 페이지로 이동'}).html(tit);
			}

			// URL 주소 변경
			//history.replaceState( null, null, url );
		});

		// 탭을 위한 기본 갯수
		locationIdx = $('#myLoactionInfo div.location a').length;

		// 기본 location
		$('#myLoaction').html($('#myLoactionInfo div.location').clone());
	});

</script>

<script>
$('#bogo').load(location.href+' #bogo');

function unlike(l_num){
	var result = confirm('좋아요를 취소하시겠습니까?');
	if(result){
		$.ajax({
            type: "GET",
            url: "unlikeMovie",
            data: {
                "l_num" : l_num
            }
            });
		$('#bogo').load(location.href+' #bogo');
	}else{
		
	}
}
</script>

<div class="container has-lnb">
            <div class="page-util">
                 <div class="inner-wrap" id="myLoaction"><div class="location">
		<span>Home</span>
		<a href="/mypage" title="나의 메가박스 페이지로 이동">나의 메가박스</a>
		<a href="/mypage/moviestory" title="나의 무비스토리 페이지로 이동">나의 무비스토리</a>
	<a href="/mypage/moviestory?cd=tl" title="무비타임라인 페이지로 이동">무비타임라인</a></div></div>
            </div>

<div class="inner-wrap">
	<div class="lnb-area">
		<nav id="lnb">
			<p class="tit on"><a href="Membermain" title="나의 메가박스">나의 메가박스</a></p>

			<ul>
				<li class=""><a href="BookingList" title="예매/구매내역">예매/구매내역</a></li>
                <li>
                   	<a href="/mypage/movie-coupon" title="영화/스토어 관람권">영화/스토어 관람권</a>
					<ul class="depth3">
						<li><a href="/mypage/movie-coupon" title="영화관람권">영화관람권</a></li>
						<li><a href="/mypage/store-coupon" title="스토어 교환권">스토어 교환권</a></li>
					</ul>
				</li>
				<li><a id="discountCoupon" href="/mypage/discount-coupon" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li>
				<li><a href="MovieStory" titel="나의 무비스토리">나의 무비스토리</a></li>
				<li><a href="/mypage/myevent" title="나의 이벤트 응모내역">나의 이벤트 응모내역</a></li>
				<li><a href="MyInquiry" title="나의 문의내역">나의 문의내역</a></li>
				<li>
					<a href="MyInfo?id=${sessionScope.loginId}" title="회원정보">회원정보</a>
					<ul class="depth3">
						<li><a href="MyInfo?id=${sessionScope.loginId}" title="개인정보 수정">개인정보 수정</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>




                



<script src="/js/megabox-movieStory.js"></script>
<script src="/static/pc/js/swiper.min.js"></script>
<script type="text/javascript">
	var cd = '';

	$(function() {
		// 탭 버튼
		$('.tab-block a').on('click', function(e) {
			e.preventDefault();

			var type = $(this).data('type');

			$('#currentPage').val('1'); // 페이지 번호 초기화
			$('.tab-block li.on').removeClass('on');
			$(this).parent().addClass('on');

			$('.myMovieStory').hide();

			if(type == 'tl') { // 무비타임라인
				$('.myTimeline').show();

				MegaboxUtil.MovieStory.bindTimeLineEvent(); // 무비타임라인 이벤트

			} else if(type == 'mp') { // 무비포스트
				$('.myMoviePost').show();

				MegaboxUtil.MovieStory.bindMoviePostEvent(); // 무비포스트 이벤트
			} else if(type == 'one') { // 한줄평
				$('.myOne').show();
			} else if(type == 'sm') { // 본영화
				$('.mySeenMovie').show();
			} else if(type == 'lm') { // 보고싶어
				$('.myLikeMovie').show();
			}

			fn_selectDataList(type); // 무비스토리 데이터 조회
		});

		// 더보기 버튼
		$('#btnAddMovie').on('click', function() {

			fn_movieSerach(true);
		});



		if(cd == 'mp') $('.tab-block li').eq(1).addClass('on'); // 무비포스트 탭 활성화
		else if(cd == 'one') $('.tab-block li').eq(2).addClass('on'); // 한줄평 탭 활성화
		else if(cd == 'sm') $('.tab-block li').eq(3).addClass('on'); // 본영화 탭 활성화
		else if(cd == 'lm') $('.tab-block li').eq(4).addClass('on'); // 보고싶어 탭 활성화
		else $('.tab-block li').eq(0).addClass('on'); // 무비타임라인 탭 활성화

		$('.tab-block li.on a').click(); // 활성화 된 탭 컨텐츠 조회

		fn_initYearTab();
		MegaboxUtil.Movie.bindMyViewMovieEvent('regBtn', MegaboxUtil.MovieStory.createSeenMovie); // 내가 본 영화 버튼 이벤트
	});

	// 연도 탭 초기화
	function fn_initYearTab() {
		if($('.time-year').length > 0 ){
			$yearLeng = $('.time-year .cell').length;

			var time_year = new Swiper('.time-year', {
				loop : false,
				initialSlide : $yearLeng,
				simulateTouch : false,
				slidesPerView: 9,
				spaceBetween: 0,
				navigation : {
					prevEl : '.year-prev',
					nextEl : '.year-next',
				},
				ally : {
					enabled : true
				}
			});

			$(window).resize(function() {
				time_year.update();
			}).resize();

			$('#movieTimeLineTab').on('click', function () {
				time_year.update();
			});

			$(document).on('click', '.my-timeline .time-year .cell .btn', function(){
				$(this).addClass('on').closest('.cell').siblings('.cell').find('.btn').removeClass('on');
			});
		}
	};

	// 무비스토리 데이터 조회
	function fn_selectDataList(type) {
		$('.no-timeline').remove();

		if(type == 'tl') { // 무비타임라인
			MegaboxUtil.MovieStory.createTimeLine();
		} else if(type == 'mp') { // 무비포스트
			$('[name=ibxMovieNmSearch]').val("");
			MegaboxUtil.MovieStory.createMoviePost();
		} else if(type == 'one') { // 한줄평
			MegaboxUtil.MovieStory.createOne();
		} else if(type == 'sm') { // 본영화
			MegaboxUtil.MovieStory.createSeenMovie();
		} else if(type == 'lm') { // 보고싶어
			MegaboxUtil.MovieStory.createLikeMovie();
		}
	};

	// 보고싶어 선택 후 리스트 재조회
 	function fn_selectMovieList() {
		$('#currentPage').val('1'); // 페이지 번호 초기화
		$('#movieList').empty();
		fn_selectDataList('lm');
 	};
</script>

<form id="movieForm" method="post">
	<input type="hidden" id="currentPage" value="1">
	<input type="hidden" id="recordCountPerPage" value="10">
</form>

<!-- contents -->

<div id="myLoactionInfo" style="display: none;">
	<div class="location">
		<span>Home</span>
		<a href="Membermain" title="나의 메가박스 페이지로 이동">나의 메가박스</a>
		<a href="MovieStory" title="나의 무비스토리 페이지로 이동">나의 무비스토리</a>
	</div>
</div>

<div id="contents">
	<h2 class="tit">나의 무비스토리</h2>

	

	<div class="tab-block mb30">
		<ul>
			<li data-url="/mypage/moviestory?cd=tl" class="on"><a id="movieTimeLineTab" href="#" class="btn" data-type="tl" title="무비타임라인 탭으로 이동">무비타임라인</a></li>
			<li data-url="/mypage/moviestory?cd=mp"><a href="#" class="btn" data-type="mp" title="무비포스트 탭으로 이동">무비포스트</a></li>
			<li data-url="/mypage/moviestory?cd=one"><a href="#" class="btn" data-type="one" title="관람평 탭으로 이동">관람평</a></li>
			<li data-url="/mypage/moviestory?cd=sm"><a href="#" class="btn" data-type="sm" title="본영화 탭으로 이동">본영화</a></li>
			<li data-url="/mypage/moviestory?cd=lm"><a href="#" class="btn" data-type="lm" title="보고싶어 탭으로 이동">보고싶어</a></li>
		</ul>
	</div>

	<!-- 나의 무비타임라인 -->
<!-- 	<div class="my-timeline myTimeline myMovieStory" style="display: block;">
		
			
			

			<button type="button" class="btn-year year-prev swiper-button-disabled" tabindex="0" role="button" aria-label="Previous slide" aria-disabled="true">이전 년도 선택</button>

			<div class="time-year swiper-container-initialized swiper-container-horizontal">
				<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
					
						<div class="cell swiper-slide"><button type="button" class="btn">2007</button></div>
						<div class="cell swiper-slide swiper-slide-active" style="width: 86.2222px;">
							<button type="button" class="btn" data-no="2021">2021</button>
						</div>
					
						<div class="cell swiper-slide"><button type="button" class="btn">2007</button></div>
						<div class="cell swiper-slide swiper-slide-next" style="width: 86.2222px;">
							<button type="button" class="btn on" data-no="2022">2022</button>
						</div>
					
				</div>
			<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>

			<button type="button" class="btn-year year-next swiper-button-disabled" tabindex="0" role="button" aria-label="Next slide" aria-disabled="true">다음 년도 선택</button>
		
	</div> -->

	<!-- my-timeline-list -->
	<c:if test="${likeList == null }">
		<div class="no-timeline">나의 무비타임라인을 만들어 보세요.</div>
	</c:if>
	<c:if test="${likeList != null }">
	<div class="my-timeline-list myTimeline myMovieStory" style="display: block;">
		<ol>
		<c:forEach var="list" items="${likeList }">
			<li> 
				 
				<div class="date">        
					<p>${list.l_time }</p>    
				</div>   
				<ul class="movie">
					<li>    
						<a href="javaScript:void(0)" title="${list.m_name } 상세보기" class="img posterImg btn-modal-open2" w-data="850" h-data="auto" data-no="null" data-cd="INTRST" data-mno="22018400">
							<img src="${list.m_poster }" onerror="noImg(this)" alt="${list.m_name }">
						</a>    
						<div class="cont">        
							<p class="label">보고싶어</p>        
							<p class="tit"><a href="javaScript:void(0)" title="탑건: 매버릭 상세보기">${list.m_name }</a></p>
							<div class="theater">
								<p>개봉일 : ${list.m_date }</p>
								<p>감독 : ${list.m_director }</p>
								<p>장르 : ${list.m_type } / ${list.m_r_time }분</p>
							</div>    
						</div>
					</li>    
				</ul>
			</li>
		</c:forEach> 
		</ol>
	</div>
	</c:if>
	<!--// my-timeline-list -->

<!-- 	<div class="btn-more v1 pt00 myTimeline myMovieStory" style="display: none;">
		<button type="button" class="btn" id="addList">더보기 <i class="iconset ico-btn-more-arr"></i></button>
	</div> -->
	<!--// 나의 무비타임라인 -->

	<!-- 나의 무비포스트 -->
<div class="my-movie-post myMoviePost myMovieStory" style="display: block;">

		<!-- movie-list-util -->
		<div class="movie-list-util">
			<p class="result-count  line32">
			<strong>총 <b class="font-gblue" id="myMoviePostCnt">
				<c:if test="${postList == null }">
					0
				</c:if>
				<c:if test="${postList != null }">
					${postList.size() }
				</c:if>
				건
			</p>
<!-- 			<div class="float-r">
				<div class="movie-sorting">
					<span><button type="button" class="btn on" data-type="date">최신순</button></span>
					<span><button type="button" class="btn" data-type="like">공감순</button></span>
				</div>

				<div class="movie-search">
					<input type="text" title="제목, 장르, 감독, 주연배우를 입력하세요" placeholder="제목, 장르, 감독, 주연배우" class="input-text" name="ibxMovieNmSearch">
					<button type="button" class="btn-search-input">검색</button>
				</div>
			</div> -->
		</div>
		<!--// movie-list-util -->
		<c:if test="${postList == null }">
			<div class="movie-post-list" id="moviePostList"><div class="no-moviepost">등록된 무비포스트가 없습니다.</div></div>
		</c:if>
		<c:if test="${postList != null }">
		<c:forEach var="list" items="${postList }">
			<div class="movie-post-list" id="moviePostList" style="position: relative; height: 388px;">
				<div class="grid-item" style="position: absolute; left: 0px; top: 0px;">    
					<div class="wrap">        
						<div class="img">            
							<a href="${path }/moviepost" title="무비포스트 상세보기" class="moviePostBtn btn-modal-open2" w-data="850" h-data="auto" data-no="212429" data-row="1" data-tot="1">
								<%-- <img src="${list.p_image }" onerror="noImg(this)" alt="${list.m_name }"> --%>
							</a>        
						</div>        
						<div class="cont">            
							<div class="writer">                
								<a href="#" title="${sessionScope.loginId }님의 무비포스트 보기" class="moviePostId" data-id="0B1E0875-63E3-433F-A50C-8AB4C199590C">${sessionScope.loginId }</a>            
							</div>            
							<a href="${path }/moviepost" title="무비포스트 상세보기" class="link moviePostBtn btn-modal-open2" w-data="850" h-data="auto" data-no="212429" data-row="1" data-tot="1">                
								<div class="label"></div>            
							</a>            
							<a href="${path}/movie-detail?rpstMovieNo=${list.m_num }" title="${list.m_name } 상세보기">                
								<p class="tit">${list.m_name }</p>            
							</a>            
							<a href="${path }/moviepost" title="무비포스트 상세보기" class="link moviePostBtn btn-modal-open2" w-data="850" h-data="auto" data-no="212429" data-row="1" data-tot="1">                
								<p class="txt">${list.p_content }</p>                
								<!-- <p class="time">5 시간전</p> -->            
							</a>            
							<div class="condition">                
								<button type="button" class="btn-like postLikeBtn listBtn jsMake" data-no="212429">
									<i class="iconset ico-like">보고싶어 수</i> <!-- 좋아요 수 -->
									<span class="cnt">0</span>
								</button>                  
								<a href="${path }/moviepost" title="댓글 작성하기" class="link btn-modal-open2 post-detailRlyPopup" w-data="850" h-data="auto" data-no="212429">
									<i class="iconset ico-reply">댓글 수</i> 0
								</a>            
							</div>        
						</div>    
					</div>
				</div>
			</div>
		</c:forEach>
		</c:if>
		<div class="more-movie-list" style="display: none;">
			<button type="button" class="button btn-more-movie-list">더보기 <i class="iconset ico-btn-more-arr"></i></button>
		</div>
	</div>
	<!--// 나의 무비포스트 -->

	<div class="board-list-util myOne myMovieStory" style="display: none;">
		<p class="result-count">
			<strong>총 <b class="font-gblue" id="myOneCnt">0</b> 건</strong>
		</p>
	</div>

	<!-- 나의 한줄평 -->
<div class="my-appraisal myOne myMovieStory" style="display: block;">
		<ul id="myAppraisal"><li class="no-result">등록된 한줄평이 없습니다.</li></ul>
	</div>

	<nav class="pagination myOne myMovieStory" style="display: none;"></nav>
	<!--// 나의 한줄평 -->

	<!-- 나의 본영화 -->
	
	
	<div class="board-list-util mySeenMovie myMovieStory" style="display: none;">
		<p class="result-count">
			
		
	<c:if test="${movieList == null }">
		<strong>총 <b class="font-gblue" id="mySeenMovieCnt">0</b> 건</strong>
	</c:if>
	<c:if test="${movieList != null }">
		<strong>총 <b class="font-gblue" id="mySeenMovieCnt">${movieList.size() }</b> 건</strong>
	</c:if>
	</p>
	</div>
	<!-- my-saw-movie -->
    <div class="my-saw-movie mt10 mySeenMovie myMovieStory" style="display: block;">
		<ul id="mySawMovie">
			
			<c:if test="${movieList != null }">
			<c:forEach var="list" items="${movieList }">
				<li>    
					<p class="img posterImg" style="cursor: pointer">
						<img src="${list.m_poster }">
					</p>    
					<div class="cont">        
						<p class="tit"><a href="javaScript:void(0)" title="${list.m_name } 상세보기">${list.m_name }</a></p>        
						<div class="theater">            
							<p>${list.c_name }</p>            
							<p>${list.s_name }</p>            
							<p>${list.r_date } ${list.b_start } </p>        
						</div>    
					</div>    
					<div class="btn-group">        
						<a href="#" class="btn review moveOneBtn" title="관람평쓰기" data-no="21042000" data-at="N">
							<i class="iconset ico-pencil"></i> 관람평쓰기
						</a>        
						<a href="${path}/moviepost" class="btn post movePostBtn" title="포스트쓰기" data-no="21042000" data-postno="null">
							<i class="iconset ico-pencil"></i>포스트쓰기
						</a>        
						<button type="button" class="btn del deleteBtn" data-no="86609766">삭제</button>    
					</div>
				</li>
			</c:forEach>
			</c:if>
			<c:if test="${movieList == null }">
					<li class="no-result">관람 내역이 없습니다.</li>
			</c:if>
		</ul>
	</div>
	<!--// my-saw-movie -->

	<nav class="pagination mySeenMovie myMovieStory" style="display: none;"></nav>
	<!--// 나의 본영화 -->

	<!--// 나의 보고싶어 -->
	<!-- my-movie-list -->
	<div class="my-movie-list myLikeMovie myMovieStory" id="bogo" style="display: block;">
		<div class="board-list-util">
			<p class="result-count">
				<strong>총 <b class="font-gblue" id="totalCnt">${likeList.size() }</b>건</strong>
			</p>
		</div>
		
		<c:if test="${likeList == null }">
			<!-- 보고싶어 영화 없을 때 -->
			<div class="no-my-movie-list myLikeMovie myMovieStory" id="noDataDiv" style="display: none;">
				<i class="iconset ico-movie-see"></i>
				<p>보고싶은 영화를 담아주세요.</p>
			</div>
			<!--// 나의 보고싶어 -->
		</c:if>
		<c:if test="${likeList != null }">
		<div class="movie-list myLikeMovie myMovieStory" style="display: block;">
			<ol class="list" id="movieList">
		<c:forEach var="list" items="${likeList }">
		
				<li tabindex="0" class="no-img">
				<div class="movie-list-info">    
					<img src="${list.m_poster }" alt="${list.m_name }" class="poster lozad" onerror="noImg(this)">    
					<div class="screen-type2">        
						<%-- <p name="dbcScrean" style="display: none"><img src="/static/pc/images/common/btn/mov_top_tag_db.png" alt="dolby"></p>        
						<p name="mxScreen" style=""><img src="${path }/resources/images/mov_top_tag_mx.png" alt="mx"></p>   --%>  
					</div>    
 					<div class="movie-score on">        
						<a href="${path}/movie-detail?rpstMovieNo=${list.l_num }" class="wrap movieBtn" title="${list.m_name }상세보기"></a>    
					</div> 
				</div>
				<div class="tit-area">    
				
					<c:if test="${list.m_age == '등급미정'}">
						<p class="movie-grade age-no">,</p>
					</c:if>
					<c:if test="${list.m_age == '전체관람가'}">
						<p class="movie-grade age-all">,</p>
					</c:if>
					<c:if test="${list.m_age == '청소년관람불가'}">
						<p class="movie-grade age-19">,</p>
					</c:if>
					<c:if test="${list.m_age == '15세이상관람가'}">
						<p class="movie-grade age-15">,</p>
					</c:if>
					<c:if test="${list.m_age == '12세이상관람가'}">
						<p class="movie-grade age-12">,</p>
					</c:if>
				
					<p title="${list.m_name }" class="tit">
						<a href="javaScript:void(0)" title="${list.m_name }">${list.m_name }</a>
					</p>
				</div>
				<div class="btn-util"> 
					<a id="unlike" onclick="unlike(${list.l_num })">
					<button type="button" class="button btn-like" >
					<i title="보고싶어 함" class="iconset ico-heart-toggle-gray on"></i> 
					<span>${list.m_like }</span></button></a>    
					<!-- <p class="txt movieStat1" style="display: none">상영예정</p>    
					<p class="txt movieStat2" style="display: none">6월 개봉예정</p>    
					<p class="txt movieStat5" style="display: none">개봉예정</p>    
					<p class="txt movieStat6" style="display: none">상영종료</p>   -->  
					<div class="case col-2 movieStat3" style="display: none">        
						<a href="#" class="button purple bokdBtn" data-no="22018400" title="영화 예매하기">예매</a>        
						<a href="#" class="button purple img splBtn" data-no="22018400">
						<img src="/static/pc/images/common/btn/mov_list_db_btn.png" alt="dolby 버튼"></a>    
					</div>    
					<div class="case movieStat4" style="">        
						<a href="${path}/booking" class="button purple bokdBtn" title="영화 예매하기">예매</a>    
					</div>
				</div>
				</li>
		</c:forEach>
		</ol>
		</div>
		</c:if>
		
<!-- 		<div class="more-movie-list pt30 myLikeMovie myMovieStory" style="display: none;">
			<button type="button" class="button btn-more-like-list">더보기 <i class="iconset ico-btn-more-arr"></i></button>
		</div> -->

	</div>
	<!--// my-movie-list -->

	
</div>
<!--// contents -->
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

			if('10857053' != detailInfo.mbNo){ //무비포스트 쓴 회원과 홈페이지 접속한 회원이 같지 않은 경우

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
	<section id="layer_post_detail" class="modal-layer2"><a href="" class="focus">레이어로 포커스 이동 됨</a>
				<div class="wrap">
					<header class="layer-header">
						<h3 class="tit">무비포스트 상세</h3>
					</header>

					<div class="layer-con">

						<div class="post-detail">
							<div class="tit-area mb30">
								<p class="tit">
								</p>

								<div class="direct-link">
									<a id="bokdLinkBtn" data-no="" href="" style="display: none;" title="">예매하기</a>
								</div>
							</div>

							
							<div class="user-post-box mb40">
								<div class="user-post-case">
									<!-- post-top-area -->
									<div class="post-top-area">
										
										<div class="user-info">
											<p class="photo">
												<img src="../../../static/pc/images/movie/img-P-MO-PO0101-user-img01.png" alt="userid80**님의 무비포스트">
											</p>

											<p class="user-id">
												<a href="" title="ID"></a>
											</p>

											<p class="user-write-time"></p>
										</div>
										

										<div class="btn-util">
											<!-- 구독하기 전 -->
											<button type="button" class="button x-small gray-line" id="subscribe"></button>
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
													<div class="balloon-cont">

													</div>
												</div>
												<!--// 말풍선 -->
											</div>
										</div>
										<!--// post-funtion -->
									</div>
									<!--// post-top-area -->

									<div class="post-cont-area">
										<!-- post 내용  -->
										<div class="section-area">
										</div>
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
						<p><span id="rlyCnt">댓글 </span></p>
						<input type="hidden" id="rlyCntTop" value="">
						<input type="hidden" id="hdnMoviePostNo" value="">
					</div>

					<div class="comment" id="input-comment">
						<textarea class="input-textarea" cols="5" rows="5" id="postRlyCn" title="댓글 입력" name="postRlyCn" maxlength="100"></textarea>

						<div class="comment-function">
							<p class="reset"><span class="text-count">0</span> / 100</p>
							<div class="btn">
								<button type="button" id="btnPostRly">등록</button>
							</div>
						</div>
					</div>
				</div>
				<!--// comment input-->

				<!-- comment list -->
				<div class="comment-list" id="commentList">

				</div>
				<!--// comment list -->

				<div class="mb50"></div>

						</div>
					</div>
					<button type="button" class="btn-modal-close2">레이어 닫기</button>
				</div>
			</section>
			<!-- // ################# 무비포스트 상세 레이어팝업으로 변경 ###########################  -->
<!-- //무비포스트 상세 레이어팝업 -->


            </div>
        </div>
        
        
        
 