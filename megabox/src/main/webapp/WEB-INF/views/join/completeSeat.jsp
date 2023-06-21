<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path }/resources/css/megabox.min.css" media="all">
<script src="${path }/resources/js/join/jquery-1.12.4.js"></script><script src="${path }/resources/js/join/jquery-ui.1.12.1.js"></script><script type="text/javascript"></script>
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div class="inner-wrap" style="padding-top:40px; padding-bottom:100px;">
	<!-- quick-reserve -->
	<div class="quick-reserve">

		<h2 class="tit">빠른예매<!-- 빠른예매 --></h2>

		






<script type="text/javascript">
var requestPayAt = "Y";


function startPay(){
	
	//신용카드로 결제시
	if($('#payChoice').val() == 'credit'){
		fn_creditPay();
	}
	else if($('#payChoice').val() == ''){
		alert('결제수단을 선택해주세요');
	}

}


function fn_creditPay(){
	var IMP = window.IMP; // 생략가능    
	
	
	if('${loginId}'==""){
		alert('로그인 후 이용해주세요');
		return;
	}
	
	
	
	
	IMP.init('imp15136405'); 
	IMP.request_pay({
		
	
		
		
		
		pg: 'html5_inicis',
		pay_method: 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name: '메가박스_결제테스트',
		amount: '10',
		buyer_email : email,
		buyer_name : name,
		buyer_tel : tel
		
		
	}, function(rsp){
		if(rsp.success){
			var msg = '결제가 완료되었습니다';
			msg += '고유ID' + rsp.imp_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드승인번호 : ' + rsp.apply_num;
			msg += '주문번호 : ' + rsp.merchant_uid;
			
			var param = {
					merchant_uid: rsp.merchant_uid
			};
			
			
			$.ajax({
				url:"${path}/booking/saveBookingData",
				type:'post',
				data: JSON.stringify(param),
				success: function(data){
					alert('예매가 완료되었습니다\n' + msg);
					location.href='${path}/main';
					console.log(data);
				},
				error: function(error){
					alert(error);
				}
			});
		}else{
			var msg = '결제에 실패했습니다';
			msg += '에러내용 :' + rsp.error_msg;
		}
	});
	
	/*
	IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: "ORD20180131-0000011",
        name: "노르웨이 회전 의자",
        amount: 64900,
        buyer_email: "gildong@gmail.com",
        buyer_name: "홍길동",
        buyer_tel: "010-4242-4242",
        buyer_addr: "서울특별시 강남구 신사동",
        buyer_postcode: "01181"
    }, function (rsp) { // callback
        if (rsp.success) {
            // 결제 성공 시 로직,
            alert('성공');
        } else {
        	alert('실패');
            // 결제 실패 시 로직,
        }
    });
	*/
}



$(function(){
	//RIA의 경우
    if(parent.sellChnlCd != ""){
        $('.inner-wrap')
        	.css('padding-bottom','')
        	.css('padding-top','');	//하단 상단 공백 제거
//         $('#btnLangChg').hide();    //언어전환 버튼숨김

        //로그인 되었으면
        if(parent.riaLoginAt == "Y"){
        	$('.cti-area input[name=riaName]').attr('value',parent.riaParamName);	//고객명
            $('.cti-area input[name=riaMobileNo]').attr('value',parent.riaParamMobileNo);	//고객전화번호
            $('.cti-area input[name=riaBirthday]').attr('value',parent.riaParamBirthday);	//고객생년월일
        	$('.cti-area input[name=riaMemberYn]').attr('value',parent.riaMemberYn == "Y" ? "회원" : "비회원");	//회원여부

        	$('.cti-area input[name=riaName]').attr("readonly",true);		//고객명
            $('.cti-area input[name=riaMobileNo]').attr("readonly",true);	//고객전화번호
            $('.cti-area input[name=riaBirthday]').attr("readonly",true);	//고객생년월일

            $('.cti-area input[name=riaMemberYn]').attr("readonly",true);	//회원여부

        	$('.cti-area button').attr('login-at',"Y");

            //결제화면이 아니면
            if("N" == requestPayAt){
            	$('.cti-area button').html('재인증');
            }
        }
        //로그인 되지 않았으면
        else {
        	$('.cti-area input[name=riaName]').attr('value',parent.riaParamName);	//고객명
            $('.cti-area input[name=riaMobileNo]').attr('value',parent.riaParamMobileNo);	//고객전화번호
            $('.cti-area input[name=riaBirthday]').attr('value',parent.riaParamBirthday);	//고객생년월일
            $('.cti-area input[name=riaMemberYn]').attr('value','');	//회원여부

        	$('.cti-area input[name=riaName]').attr("readonly",false);		//고객명
            $('.cti-area input[name=riaMobileNo]').attr("readonly",false);	//고객전화번호
            $('.cti-area input[name=riaBirthday]').attr("readonly",false);	//고객생년월일

            $('.cti-area input[name=riaMemberYn]').attr("readonly",true);	//회원여부

            $('.cti-area button').attr('login-at',"N");	//회원여부
          	//결제화면이 아니면
            if("N" == requestPayAt){
        		$('.cti-area button').html('인증요청');
            }
        }

        //드림센터의 경우
		if(parent.sellChnlCd == "TELLER"){
			$('.cti-area').show();	//cti 로그인창 표시
		}
		else {
			$('.cti-area').hide();	//cti 로그인창 표시
		}


		//회원정보 확인을 위한 초기 파라메타 셋팅

		//파라메타 셋팅후
		//회원여부확인				부모창
		//나머지 화면 disable 처리	부모창

	}
    else {
        $('.quick-reserve-ad-area').show();	//광고영역 표시
//         $('#btnLangChg').show();	//언어전환 버튼표시 사용안함 20200106 김민영
    }

    /* RIA 재인증 버튼 클릭 */
    $('.cti-area button').on("click", function(){

		//입력값 검증
		if($('.cti-area button').attr('login-at') == "N"){

// 			if($(".cti-area input[name=riaName]").val().length == 0){
// 				gfn_alertMsgBoxSize('이름은  필수 입력 항목 입니다.',400,250);	//{0} 필수 입력 항목 입니다.
// 				return;
// 			}

			if(!fn_validateDateYn($(".cti-area input[name=riaBirthday]").val())){
				gfn_alertMsgBoxSize('생년월일을 정확히 입력해주세요.',400,250);	//생년월일을 정확히 입력해주세요.
				return;
			}

			if($(".cti-area input[name=riaMobileNo]").val().length < 10){
				gfn_alertMsgBoxSize('휴대폰번호를 정확히 입력해주세요.',400,250);	//휴대폰번호를 정확히 입력해주세요.
				return;
			}

			if($(".cti-area input[name=riaMobileNo]").val().substr(0,2) != "01"){
				gfn_alertMsgBoxSize('휴대폰번호를 정확히 입력해주세요.',400,250);	//휴대폰번호를 정확히 입력해주세요.
				return;
			}
		}
		parent.fn_setRiaLoginToggle( [$('.cti-area button').attr('login-at')
    								 ,$(".cti-area input[name=riaName]").val()
    								 ,$(".cti-area input[name=riaBirthday]").val()
    								 ,$(".cti-area input[name=riaMobileNo]").val()]
    								);
    });


    /* 이름 숫자를 제외한 입력 여부판단 */
	$(".cti-area input[name=riaName]").on("keyup", function(e){
		var partton = /[^ㄱ-힣a-zA-Z]/g;
		if(partton.test($(this).val())) {
			var value = $(this).val().replace(/[^ㄱ-힣a-zA-Z]/g,"");
			$(this).val(value);
		}
 	});
	$(".cti-area input[name=riaName]").focusout(function(){
		var partton = /[^ㄱ-힣a-zA-Z]/g;
		if(partton.test($(this).val())) {
			var value = $(this).val().replace(/[^ㄱ-힣a-zA-Z]/g,"");
			$(this).val(value);
		}
	});

    /* 생년월일 숫자만 입력 여부판단 */
	$(".cti-area input[name=riaBirthday]").on("keyup", function(e){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	$(".cti-area input[name=riaBirthday]").focusout(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});

    /* 휴대폰번호 숫자만 입력 여부판단 */
	$(".cti-area input[name=riaMobileNo]").on("keyup", function(e){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
    });
	$(".cti-area input[name=riaMobileNo]").focusout(function(){
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
});


/*날짜 형태 확인*/
function fn_validateDateYn(param) {
	try
	{
		var yearFront = "";
		var year = "";
		var month = "";
		var day = "";

		param = param.replace(/-/g,'');

		// 자리수가 맞지않을때
		if( isNaN(param) || param.length < 6 || param.length == 7) {
			return false;
		}

		if(param.length == 6){
			year = Number(param.substring(0, 2));
			month = Number(param.substring(2, 4));
			day = Number(param.substring(4, 6));
		}
		else if (param.length == 8){
			var date = new Date();
			yearFront = Number(param.substring(0, 4));
			year = Number(param.substring(2, 4));
			month = Number(param.substring(4, 6));
			day = Number(param.substring(6, 8));

			if(yearFront > date.getFullYear()){
				return false;
			}
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

//홍현식 라디오버튼 클릭 시
$(document).ready(function(){
	$("input[name='radio_payment']").change(function(){
		var test = $("input[name='radio_payment']:checked").val();
		$('.select-payment-card').css('display', 'none');   //신용카드 화면
		$('.select-mobile-info').css('display', 'none');   //휴대폰 결제 화면
		 $('.select-payment-easypay').css('display', 'none');   //간편결제 화면
		 $('.term-list').css('display', 'none');   //동의 화면
		 $('.select-settlebank-info').css('display', 'none');   //내통장결제 화면
		 if(test == 'credit'){
			 $('.select-payment-card').css('display', 'block');   //신용카드 화면
				$('#payChoice').attr('value','credit');
			 $('.thing').text('신용/체크카드');
		}else if(test == 'mobile'){
			 $('.term-list').css('display', 'block');   //동의 화면
			$('.select-mobile-info').css('display', 'block');   //휴대폰 결제 화면
			$('#payChoice').attr('value','mobile');
			$('.thing').text('휴대폰 결제');
		}else if(test == 'easypay'){
			$('.select-payment-easypay').css('display', 'block');   //간편결제 화면
			$('#payChoice').attr('value','easypay');
			$('.thing').text('간편결제');
		}else{
			$('.select-settlebank-info').css('display', 'block');   //내통장결제 화면
			$('#payChoice').attr('value','settlebank');
			$('.thing').text('내통장결제');
		}
	});
});

//홍현식 카드 select expand
$(document).ready(function(){
	$('.btn.dropdown-toggle.btn-default').click(function(){
		$('.dropdown.bootstrap-select.v1.small.bs3.dropup').addClass('open');	
	});
	
});

/*
if(${allDto.adult_cnt}==0){
	$('.data.adult').css('display','none');
}
if(${allDto.teenager_cnt}==0){
	$('.data.teen').css('display','none');
}
if(${allDto.oldMan_cnt}==0){
	$('.data.old').css('display','none');
}
*/




</script>
<!-- cti 일때만 출력 -->

<div class="cti-area" style="display:none">
    <p>이름</p>
    <input maxlength="20" name="riaName" type="text" title="이름 출력" class="input-text a-c w120px" placeholder="이름" value="">

    <p>생년월일</p>
    <input maxlength="8" name="riaBirthday" type="text" title="생년월일 출력" class="input-text a-c w150px" placeholder="6자리 또는 8자리" value="">

    <p>휴대폰번호</p>
    <input maxlength="11" name="riaMobileNo" type="text" title="휴대폰번호 출력" class="input-text a-c w150px" placeholder="- 없이 입력" value="">

    <p>회원</p>
    <input name="riaMemberYn" type="text" title="회원여부 출력" class="input-text a-c w100px" value="" readyonly="readyonly">

	
		
	
</div>
<fmt:parseNumber var="adult" integerOnly="true" value="${allDto.adult_cnt/rowsPerPage }*14000"/>
<fmt:parseNumber var="teen" integerOnly="true" value="${allDto.teenager_cnt/rowsPerPage }*12000"/>
<fmt:parseNumber var="old" integerOnly="true" value="${allDto.oldMan_cnt/rowsPerPage }*5000"/>
		<!-- seat-select-section -->
		<div class="seat-select-section">
			<!-- seat-section -->
			<div class="seat-section h-auto">

				<div class="tit-util">
					<h3 class="tit small">관람권 및 할인적용<!-- 관람권 및 할인적용--></h3>

					<div class="right">
						<button type="button" class="button gray-line small" id="btn_booking_init"><i class="iconset ico-reset-small"></i>초기화<!-- 초기화 --></button>
					</div>
				</div>

				<!-- discout-setting -->
				
					<div class="discout-setting">
						<div class="discout-list">
							<ul>
								<li id="movieWonLi">
									<a href="#mega_point" class="tit" id="grp_mega_point" name="grp_mega_dc" title="메가박스 포인트/쿠폰">
										메가박스 포인트/쿠폰<!-- 메가박스 포인트/관람권 -->
										<!-- <span class="text">멤버십 포인트는 월~금(주말 및 공휴일 제외) 평일에만 사용 가능합니다. </span> -->
										<i class="iconset ico-btn-more-arr"></i>
									</a>

									<div id="mega_point" class="cont-down">
										<div class="coupon-box">
											 <div class="item col-1">
												<a href="#layer_memp" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_memp" id="btn_pay_memp" title="메가박스 멤버십 포인트">
													<span class="txt">메가박스 멤버십 포인트 <!-- 메가박스 멤버십 포인트 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_memp" method="memp">취소 <!-- 취소 --></button>
											</div>
											<div class="item col-1">
												<a href="#layer_dcoupon" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_dcoupon" id="btn_pay_dcoupon" title="메가박스 할인쿠폰">
													<span class="txt">메가박스 할인쿠폰 <!-- 메가박스 할인쿠폰 --></span>
													<em class="tooltip01 hidden" id="movieWonEm"></em>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_dcoupon" method="dcoupon">취소 <!-- 취소 --></button>
											</div>
											<div class="item col-1">
												<a href="#layer_vip_coupon" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_vipCpon" id="btn_pay_vipCpon" title="메가박스 VIP영화쿠폰">
													<span class="txt">메가박스 VIP영화쿠폰<!-- 메가박스 VIP영화쿠폰 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_vipCpon" method="vipCpon">취소 <!-- 취소 --></button>
											</div>
										</div>
									</div>
								</li>

								<li class="praddbox">
									<a href="#mobile_coupon" class="tit" id="grp_mobile_point" name="grp_mega_dc" title="관람권/모바일상품권">
										
										관람권/모바일상품권 <!-- 제휴 모바일 쿠폰 -->
										<i class="iconset ico-btn-more-arr"></i>
									</a>
									<div id="mobile_coupon" class="cont-down">
										<div class="coupon-box">
											<div class="item col-1">
												<a href="#layer_movie_megabox_coupon" w-data="600" h-data="600" class="btn-modal-open" name="btn_pay_mcoupon" id="btn_pay_mcoupon" title="메가박스 관람권">
													<span class="txt">메가박스 관람권 <!-- 메가박스 관람권 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_mcoupon" method="mcoupon">취소 <!-- 취소 --></button>
											</div>
											<div class="item col-1">
												<a href="#layer_paysgift" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_paysgift" id="btn_pay_paysgift" title="메가박스/페이즈 금액권">
												<span class="txt">
														
														메가박스/페이즈 금액권
													<!-- 메가박스/페이즈 금액권 -->
													</span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_paysgift" method="paysgift">취소 <!-- 취소 --></button>
											</div>

											<div class="item col-1">
												<a href="#layer_store_change" w-data="600" h-data="560" class="btn-modal-open" name="btn_pay_scoupon" id="btn_pay_scoupon" title="스토어교환권">
													<span class="txt">스토어교환권 <!-- 스토어교환권 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_scoupon" method="scoupon">취소 <!-- 취소 --></button>
											</div>

											<div class="item col-1">
												<a href="#layer_mgfcard" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_mgfcard" id="btn_pay_mgfcard" title="모바일 관람권">
													<span class="txt">모바일 관람권 <!-- 모바일 상품권 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_mgfcard" method="mgfcard">취소 <!-- 취소 --></button>
											</div>

											

											
											
											


											<div class="item col-1">
												<a href="#layer_bookgift" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_bookgift" id="btn_pay_bookgift" title="도서문화상품권">
													<span class="txt">
														
														도서문화상품권
														<!-- 북앤라이프 - 도서문화상품권 -->
													</span>
												</a>
												<button type="button" class="btn-cancel" id="btn_cancel_bookgift" method="bookgift">취소 <!-- 취소 --></button>
											</div>


											<div class="item col-1">
												<a href="#layer_cultgift" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_cultgift" id="btn_pay_cultgift" title="컬쳐랜드 모바일 문화상품권">
													<span class="txt">
														
														컬쳐랜드 모바일 문화상품권
														<!-- 컬쳐랜드 - 문화상품권 -->
													</span>
												</a>
												<button type="button" class="btn-cancel" id="btn_cancel_cultgift" method="cultgift">취소 <!-- 취소 --></button>
											</div>

											

											

											

											<div class="item col-1">
												<a href="#layer_friends" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_friends" id="btn_pay_friends" title="플래티넘/스타카드/프렌즈">
													<span class="txt">플래티넘/스타카드/프렌즈 <!-- 스타카드/프렌즈 멤버십 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_friends" method="friends">취소 <!-- 취소 --></button>
											</div>

											<div class="item col-1">
												<a href="#layer_annus_card" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_annus" id="btn_pay_annus" title="메가박스 아너스카드">
													<span class="txt">메가박스 아너스카드 <!-- 메가박스 아너스카드 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_annus" method="annus">취소 <!-- 취소 --></button>
											</div>

										</div>
									</div>
									<div class="pointtxt">기프티콘, 기프티쇼, 아이넘버, 도넛북, 스마트콘, 스마일콘, G마켓 예매권은 [모바일 관람권]에서 사용하실 수 있습니다. </div>
								</li>

								<li>
									<a href="#point_coupon" class="tit" id="grp_point_coupon" name="grp_mega_dc" title="제휴포인트">
										
										제휴포인트 <!-- 포인트/할인쿠폰 -->
										<i class="iconset ico-btn-more-arr"></i>
									</a>
									<div id="point_coupon" class="cont-down">
										<div class="coupon-box">

											

											<div class="item col-1">
												<a href="#layer_uplus" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_uplus" id="btn_pay_uplus" title="U+ 멤버십">
													<span class="txt">
														
														U+ 멤버십
													</span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_uplus" method="uplus">취소 <!-- 취소 --></button>
											</div>

											<div class="item col-1">
												<a href="#layer_okcashbag" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_okcb" id="btn_pay_okcb" title="OK 캐쉬백">
													<span class="txt">OK 캐쉬백 <!-- OK 캐쉬백 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_okcb" method="okcb">취소 <!-- 취소 --></button>
											</div>

											<div class="item col-1">
												<a href="#layer_lpoint" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_lpoint" id="btn_pay_lpoint" title="OK 캐쉬백">
													<span class="txt">
														
														L.POINT
													</span><!-- L.포인트 -->
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_lpoint" method="lpoint">취소 <!-- 취소 --></button>
											</div>

											
												<div class="item col-1">
													<a href="#layer_gs_point" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_gsnp" id="btn_pay_gsnp" title="GS&amp;POINT">
														<span class="txt">GS&amp;POINT <!-- GS&amp;POINT --></span>
													</a>

													<button type="button" class="btn-cancel" id="btn_cancel_gsnp" method="gsnp">취소 <!-- 취소 --></button>
												</div>
											

											<div class="item col-1">
												<a href="#layer_oilbank" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_hyoil" id="btn_pay_hyoil" title="현대오일뱅크">
													<span class="txt">현대오일뱅크 <!-- 현대오일뱅크 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_hyoil" method="hyoil">취소 <!-- 취소 --></button>
											</div>

											<div class="item col-1">
												<a href="#layer_happypoint" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_happ" id="btn_pay_happ" title="해피포인트">
													<span class="txt">해피포인트 <!-- 해피포인트 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_happ" method="happ">취소 <!-- 취소 --></button>
											</div>

											<div class="item col-1">
												<a href="#layer_bluemembers" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_hbluep" id="btn_pay_hbluep" title="블루멤버스 포인트">
													<span class="txt">블루멤버스 포인트 <!-- 블루멤버스 포인트 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_hbluep" method="hbluep">취소 <!-- 취소 --></button>
											</div>

											<div class="item col-1">
												<a href="#layer_jmembership" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_joongang" id="btn_pay_joongang" title="중앙멤버십">
													<span class="txt">중앙멤버십 <!-- 중앙멤버십 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_joongang" method="joongang">취소 <!-- 취소 --></button>
											</div>

											<div class="item col-1">
												<a href="#layer_hyundai_m_point" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_hydm" id="btn_pay_hydm" title="현대 M 포인트 카드">
													<span class="txt">현대 M 포인트 카드 <!-- 현대 M 포인트 카드 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_hydm" method="hydm">취소 <!-- 취소 --></button>
											</div>

											<div class="item col-1" style="display:none;">
												<a href="#layer_hyundai_m_5point" w-data="600" h-data="550" class="btn-modal-open disabled" name="btn_pay_hydm5p" id="btn_pay_hydm5p" title="현대 M 포인트 카드">
													<span class="txt">현대 M 포인트 카드 <!-- 현대 M 포인트 카드 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_hydm5p" method="hydm5p">취소 <!-- 취소 --></button>
											</div>

											
											<div class="item col-1">
												<a href="#layer_happcash" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_happcash" id="btn_pay_happcash" title="해피머니상품권 해피캐시">
													<span class="txt">
														
														해피머니상품권 해피캐시
													</span><!-- 해피머니 - 해피캐시 -->
												</a>
												<button type="button" class="btn-cancel" id="btn_cancel_happcash" method="happcash">취소</button><!-- 취소 -->
											</div>

											<div class="item col-1">
												<a href="#layer_bookcash" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_bookcash" id="btn_pay_bookcash" title="도서상품권 북앤라이프캐시">
													<span class="txt">
														
                                                		도서상품권 북앤라이프캐시
													</span><!-- 북앤라이프 - 북앤라이프캐시 -->
												</a>
												<button type="button" class="btn-cancel" id="btn_cancel_bookcash" method="bookcash">취소</button><!-- 취소 -->
											</div>

											<div class="item col-1">
												<a href="#layer_cultcash" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_cultcash" id="btn_pay_cultcash" title="문화상품권 컬쳐캐쉬">
													<span class="txt">
														
														문화상품권 컬쳐캐쉬
													</span><!-- 컬쳐랜드 - 컬쳐캐쉬  -->
												</a>
												<button type="button" class="btn-cancel" id="btn_cancel_cultcash" method="cultcash">취소</button><!-- 취소 -->
											</div>

											
											<div class="item col-1">
												<a href="#layer_mnuri" w-data="600" h-data="550" class="btn-modal-open" name="btn_pay_culturenuri" id="btn_pay_culturenuri" title="문화누리카드">
													<span class="txt">문화누리카드 <!-- 문화누리카드 --></span>
												</a>

												<button type="button" class="btn-cancel" id="btn_cancel_culturenuri" method="culturenuri">취소 <!-- 취소 --></button>
											</div>

											
										</div>
									</div>
								</li>

							</ul>
						</div>
					</div>
				
				
				<!--// discout-setting -->
				
				<div class="tit-util mt40">
					<h3 class="tit small">결제수단선택 <!-- 결제수단선택 --></h3>
					<input type="hidden" id="payChoice" value="">
					<div class="right">
						<input type="checkbox" id="same_use_payment">
						<label for="same_use_payment" id="label_use_payment">다음에도 이 결제수단 사용 <!-- 다음에도 이 결제수단 사용 --></label>
					</div>
				</div>

				<!-- seat-section -->
				
				<!--// seat-section -->

				<!--
					체크 표시 on 클래스 추가

					<button type="button">

					<button type="button" class="on">
				-->
				<div class="select-payment ty2">

					<div class="radio-group">
						<span class="bg-chk small">
							<input type="radio" name="radio_payment" id="rdo_pay_credit" value="credit" > <label for="rdo_pay_credit">신용/체크카드</label>
						</span>
						<span class="bg-chk small">
							<input type="radio" name="radio_payment" id="rdo_pay_mobile" value="mobile"> <label for="rdo_pay_mobile">휴대폰 결제</label>
						</span>
						<span class="bg-chk small">
							<input type="radio" name="radio_payment" id="rdo_pay_easypay" value="easypay"> <label for="rdo_pay_easypay">간편결제</label>
						</span>
						
							<span class="bg-chk small">
								<input type="radio" name="radio_payment" id="rdo_pay_settlebank" value="settlebank"> <label for="rdo_pay_settlebank" class="new">내통장결제</label>
							</span>
						
					</div>



					<div class="select-payment-easypay" style="display:none;">
						
							<input type="radio" name="radio_payment" id="rdo_pay_naverpay" value="naverpay">
							<label for="rdo_pay_naverpay">네이버페이</label>
						

						<input type="radio" name="radio_payment" id="rdo_pay_kakaopay" value="kakaopay">
						<label for="rdo_pay_kakaopay">카카오페이</label>

						<input type="radio" name="radio_payment" id="rdo_pay_payco" value="payco">
						<label for="rdo_pay_payco">페이코</label>

						<input type="radio" name="radio_payment" id="rdo_pay_chai" value="chai">
						<label for="rdo_pay_chai" class="new">차이</label>

					</div>

					<!-- 2020.02.07 수단별 알림 문구 추가 -->
					<div class="select-mobile-info" style="display:none">
						<ul class="dash-list">
							<li>결제하신 금액은 익월 휴대폰 요금에 합산되어 청구되며, 휴대폰 결제한도는 통산사별 월 누적 이용 제한에 따라 적용됩니다.</li>
							<li>매월 말일 23시30분 ~ 익월 00시 10분까지(40분간)는 시스템 점검시간으로 이용이 어려울 수 있습니다.</li>
							<li>휴대폰 결제와 관련된 추가 안내는 FAQ를 참조해주세요.</li>
						</ul>
					</div>

					<div class="select-kakao-info" style="display:none">
						<ul class="dash-list">
							<li>즉시할인 신용카드 적용이 불가합니다.</li>
						</ul>
					</div>

					<div class="select-payco-info" style="display:none">
						<ul class="dash-list">
							<li>즉시할인 신용카드 적용이 불가합니다.</li>
							<li>페이코 포인트 결제 시 결제금액의 2% 추가적립 됩니다.</li>
						</ul>
					</div>

					<div class="select-naverpay-info" style="display:none">
						<ul class="dash-list">
							<li>네이버페이 결제 시, 메가박스에서 제공하는 카드 즉시할인, 청구할인, 카드포인트 적립 등의 혜택 제공이 불가합니다. 단, 네이버페이 간편결제사에서 제공되는 카드사별 무이자, 청구할인 혜택은 받을 수 있습니다.</li>
							<li>네이버페이 결제 시 결제금액의 1%가 적립 됩니다.</li>
						</ul>
					</div>

					<div class="select-chai-info" style="display:none">
						<ul class="dash-list">
							<li>CHAI는 은행 계좌만 등록하면 차이 비밀번호로 안전하게 결제할 수 있는 간편결제 서비스입니다.<br>(은행 점검시간인 23:30 ~ 00:30에는 이용이 어려울 수 있습니다.)</li>
							<li>결제 취소 또는 부분 취소 시 차이머니로 환불됩니다.</li>
							<li>결제 이용 한도는 1회 200만원입니다.</li>
							<li>이벤트를 통해 혜택을 적용 받은 주문의 경우, 즉시 할인 기준 금액에 따라 부분환불이 불가능할 수도 있습니다.</li>
						</ul>
					</div>

					<div class="select-settlebank-info" style="display:none">
						<ul class="dash-list">
							<li>내통장결제는 본인명의의 계좌를 최초 1회 등록 후 비밀번호 입력만으로 간편하게 이용할 수 있는 현금결제 서비스 입니다.</li>
							<li>은행 점검시간의 경우 내통장결제서비스 이용이 불가합니다.</li>
						</ul>
					</div>

					<div class="select-kj-info" style="display:none;">
						<ul class="dash-list">
							<li>메가박스 신용/체크카드(광주카드) 선할인은 즉시할인 버튼 선택 시에만 적용 가능합니다.</li>
						</ul>
					</div>
				</div>

				<dl class="term-list" id="terms" style="display: none;">
					<dt>
						<span class="bg-chk small">
							<input type="checkbox" id="agree"><label for="agree">결제대행 서비스 약관 필수 동의</label>
						</span>
					</dt>
					<dd class="tit">
						전자금융거래 이용약관<!-- 전자금융거래 이용약관 -->
						<a href="javascript:void(0);" onclick="openTermsPop('one')">내용보기</a>
					</dd>
					<dd class="tit">
						개인정보 수집 및 이용 안내<!-- 개인정보 수집 및 이용 안내 -->
						<a href="javascript:void(0);" onclick="openTermsPop('two')">내용보기</a>
					</dd>
					<dd class="tit">
						개인정보 제공 및 위탁 안내<!-- 개인정보 제공 및 위탁 안내 -->
						<a href="javascript:void(0);" onclick="openTermsPop('three')">내용보기</a>
					</dd>
				</dl>
			</div>
			<!--// seat-section -->

			<!-- seat-result -->
			<div class="seat-result">
				<div class="wrap">

					<div class="tit-area type2">
						<!--
							관람 등급 표시
							<span class="movie-grade small age-all">전체 관람가</span>
							<span class="movie-grade small age-12">12세 이상 관람가</span>
							<span class="movie-grade small age-15">15세 이상 관람가</span>
							<span class="movie-grade small age-19">청소년 관람 불가</span>
							<span class="movie-grade small age-no">미정</span>
						-->
						<span class="${allDto.m_age }" id="admisClassNm">12세이상관람가</span>

						<p class="tit" id="movieNm">${allDto.m_name }</p>
						<p class="cate" id="playKindNm">2D</p>
						<p class="theater" id="brchNm">${allDto.c_name }/${allDto.s_name }</p>
						<p class="date"><span id="playDe">${allDto.r_date }</span><em id="dowNm"></em> <span class="time" id="playTime"><i class="iconset ico-clock-white"></i>20:10~22:29</span></p>
					</div>
					<div class="price-process">
						<div class="box"><div class="data adult"><span class="tit">성인 <em>${allDto.adult_cnt }</em></span><span class="price">${allDto.adult_cnt*14000 }</span></div>
							<div class="data teen">
								<span class="tit">청소년 <em>${allDto.teenager_cnt }</em></span>
								<span class="price">${allDto.teenager_cnt*12000 }</span>
							</div>

							<div class="data old">
								<span class="tit">노인 <em>${allDto.oldMan_cnt }</em></span>
								<span class="price">${allDto.oldMan_cnt*5000 }</span>
							</div>
							<div class="all">
								<span class="tit">금액 <!-- 금액 --></span>
								<span class="price"><em>${allDto.total_fee }</em> <span>원 <!-- 원 --></span></span>
							</div>
						</div>

						<div class="box discout-box">

							<div class="all">
								<span class="tit">할인적용 <!-- 할인적용 --></span>
								<span class="price"><em>0</em> 원 <!-- 원 --></span>
							</div>
						</div>
					</div>

					<div class="pay-area">
						<div class="add-thing">
							<p class="tit">추가차액 <!-- 추가금액 --></p>

							<div class="money">0</div>
						</div>
						<div class="pay">
							<p class="tit">최종결제금액 <!-- 최종결제금액 --></p>

							<div class="money">
								<em>${allDto.total_fee }</em>
								<span>원 <!-- 원 --></span>
							</div>
						</div>
						<div class="payment-thing">
							<span class="tit">결제수단 <!-- 결제수단 --></span>
							<span class="thing">신용/체크카드</span>
						</div>
					</div>

					<div class="btn-group">
						<a href="#" class="button" id="btn_booking_back" title="이전">이전 <!-- 이전 --></a>
						
							
							
							
								<a href="#" w-data="600" h-data="400" class="button active btn-modal-open" id="btn_booking_pay" onclick="startPay()" title="결제">결제</a>
								
								
							
						
					</div>
				</div>
			</div>
			<!--// seat-result -->
			
			
				
					
					<div class="adbox">
						<div class="swiper-container payBannerSwiper swiper-container-initialized swiper-container-horizontal">
							<div class="swiper-wrapper" style="transform: translate3d(-1550px, 0px, 0px); transition-duration: 0ms;"><div class="swiper-slide swiper-slide-duplicate swiper-slide-next swiper-slide-duplicate-prev" data-swiper-slide-index="3" style="width: 310px;">
										
											
											
												<a href="https://www.megabox.co.kr/event/detail?eventNo=11438" target="_top" title="이벤트페이지 바로가기" classname="eventBtn">
													<img style="width:310px;" src="https://img.megabox.co.kr/SharedImg/cpBanner/2022/06/02/mUOjwR6STZRcWcOjOWW1E3hEm843JtGu.jpg" alt=" ">
												</a>
											
										
									</div>
								
									<div class="swiper-slide swiper-slide-duplicate-active" data-swiper-slide-index="0" style="width: 310px;">
										
											
											
												<a href="https://www.megabox.co.kr/event/detail?eventNo=11263" target="_top" title="할인쿠폰 받기" classname="eventBtn">
													<img style="width:310px;" src="https://img.megabox.co.kr/SharedImg/cpBanner/2022/08/05/WEjqj0X6lZYkvD3VHNLIw53ozpks9qS0.jpg" alt=" ">
												</a>
											
										
									</div>
								
									<div class="swiper-slide" data-swiper-slide-index="1" style="width: 310px;">
										
											
											
												<a href="https://www.megabox.co.kr/event/detail?eventNo=11730" target="_top" title="" classname="eventBtn">
													<img style="width:310px;" src="https://img.megabox.co.kr/SharedImg/cpBanner/2022/08/18/Fn5XqdjGhL5xAP1RcFy6gfrNXAeszkVZ.jpg" alt=" ">
												</a>
											
										
									</div>
								
									<div class="swiper-slide" data-swiper-slide-index="2" style="width: 310px;">
										
											
											
												<a href="https://m.megabox.co.kr/event/detail?eventNo=11738" target="_top" title="" classname="eventBtn">
													<img style="width:310px;" src="https://img.megabox.co.kr/SharedImg/cpBanner/2022/08/22/Jp89RYLLDEJ7azruPzOVv7nkHg3Ze1El.jpg" alt=" ">
												</a>
											
										
									</div>
								
									<div class="swiper-slide swiper-slide-prev swiper-slide-duplicate-next" data-swiper-slide-index="3" style="width: 310px;">
										
											
											
												<a href="https://www.megabox.co.kr/event/detail?eventNo=11438" target="_top" title="이벤트페이지 바로가기" classname="eventBtn">
													<img style="width:310px;" src="https://img.megabox.co.kr/SharedImg/cpBanner/2022/06/02/mUOjwR6STZRcWcOjOWW1E3hEm843JtGu.jpg" alt=" ">
												</a>
											
										
									</div>
								
							<div class="swiper-slide swiper-slide-duplicate swiper-slide-active" data-swiper-slide-index="0" style="width: 310px;">
										
											
											
												<a href="https://www.megabox.co.kr/event/detail?eventNo=11263" target="_top" title="할인쿠폰 받기" classname="eventBtn">
													<img style="width:310px;" src="https://img.megabox.co.kr/SharedImg/cpBanner/2022/08/05/WEjqj0X6lZYkvD3VHNLIw53ozpks9qS0.jpg" alt=" ">
												</a>
											
										
									</div></div>
						<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
						<div class="swiper-pagination swiper-pagination-clickable swiper-pagination-bullets"><span class="swiper-pagination-bullet swiper-pagination-bullet-active" tabindex="0" role="button" aria-label="Go to slide 1"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 2"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 3"></span><span class="swiper-pagination-bullet" tabindex="0" role="button" aria-label="Go to slide 4"></span></div>
					</div>
					
					
				
			

		</div>
		<!--// seat-select-section -->

	</div>
	<!--// quick-reserve -->
</div>
</body>
</html>