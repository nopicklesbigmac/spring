<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료페이지</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path }/resources/css/megabox.min.css" media="all">

</head>
<body>
<div class="member-wrap">
		<h1 class="ci"><a href="${path}/main" title="메인 페이지로 이동">MEGABOX : Life Theater</a></h1>

		<!-- col-wrap -->
		<div class="col-wrap">
			<!-- col -->
			<div class="col">
				<!-- step-member -->
				<div class="step-member" title="step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 단계 중 step4 가입완료 단계"><!--step1 본인인증, step2 약관동의, step3 정보입력, step4 가입완료 단계 중 step4 가입완료 단계-->
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
							<p class="step">
								<em>STEP3.</em> <span>정보입력<!--정보입력--></span>
							</p>
						</li>
						<li>
							<p class="step on">
								<em>STEP4.</em> <span>가입완료<!--가입완료--></span>
							</p>
						</li>
					</ol>
				</div>
				<!--// step-member -->

				<!-- join-complete -->
				<div class="join-complete">
					<i class="iconset ico-join-complete"></i>

					<p class="name">${name }님 메가박스 가입을 환영합니다.<!--님 메가박스 가입을 환영합니다.--></p>

					<p class="txt">이제부터 메가박스에서 제공하는 다양한 멤버십 혜택을 이용하실 수 있습니다.<!--이제부터 메가박스에서 제공하는 다양한 멤버십 혜택을 이용하실 수 있습니다.--></p>

					<!--
					<div class="link">
						<a href="/benefit/membership" title="멤버십 페이지로 이동">멤버십혜택 안내  <i class="iconset ico-arr-right-gray"></i></a>
					</div>
					-->
				</div>
				<!--// join-complete -->

				<div class="btn-member-bottom">
					<a href="/event/detail?eventNo=9737" title="신규회원 혜택 확인 이동" class="button purple large">신규회원 혜택 확인</a>
				</div>
			</div>
			<!--// col -->
		</div>
		<!--// col-wrap -->
	</div>
</body>
</html>