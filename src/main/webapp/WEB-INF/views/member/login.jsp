<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--작성자: 김연식 | 로그인 페이지-->
<!DOCTYPE html>
<html>
<head>
<%@ include file="../header.jsp"%>
<c:set var="root" value="${pageContext.request.contextPath}"/> <!-- 기준 경로 설정 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
		<title>더한섬닷컴</title>
		<link rel="shortcut icon" href="http://cdn.thehandsome.com/_ui/desktop/common/images/common/thehandsome_ic_16x16.ico">
		<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/common.css?20220401" media="all">
		<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/layout.css?20220331" media="all">
		<meta name="robots" content="index,follow">
		<meta name="referrer" contents="always">
		<meta name="format-detection" content="telephone=no">
		<meta name="X-CSRF-TOKEN" content="d231e742-c478-40f6-b20e-434b1cf65d03">
		<meta name="keywords" content="리바트, 가구, 종합가구, 사무가구, 매장가구, 리모델링, 사무가구, 윌리엄스 소노마, 포터리반 키즈, 포터리반, 웨스트엘름">
		<meta name="description" content="현대 리바트 가구 쇼핑몰, 온라인, 매장가구, 리모델링, 사무가구, 윌리엄스 소노마, 포터리반 키즈, 포터리반, 웨스트엘름 등 종합 브랜드 통합 쇼핑몰">
		<meta property="og:title" content="현대 리바트 통합 쇼핑몰">
		<meta property="og:site_name" content="리바트몰">
		<meta property="og:type" content="website">
		<meta property="og:url" content="https://www.hyundailivart.co.kr">
		<meta property="og:description" content="현대 리바트 가구 쇼핑몰, 온라인, 매장가구, 리모델링, 사무가구, 윌리엄스 소노마, 포터리반 키즈, 포터리반, 웨스트엘름 등 종합 브랜드 통합 쇼핑몰">
		
		
		<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/contents.css?20220221" media="all">
		<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/common.css?20220401" media="all">
		<link rel="stylesheet" href="https://static.hyundailivart.co.kr/assets/css/member.css?ver=20220425">
		<script src="https://at.artistchai.co.kr/script/at_v14.min.js?0.039739383205843914"></script><script async="" src="//st2.exelbid.com/js/cts2.js"></script><script src="https://static.hyundailivart.co.kr/assets/js/jquery.min.js"></script>
		
	    <script src="https://static.hyundailivart.co.kr/assets/js/js.cookie-2.2.1.min.js"></script>
	    <script src="https://static.hyundailivart.co.kr/assets/js/common-ui.js"></script>
	    <script src="https://static.hyundailivart.co.kr/assets/duijs/eshopfront.js"></script>
	    <script src="https://static.hyundailivart.co.kr/assets/duijs/eshopfrontCommon.js"></script>
	    <script src="https://static.hyundailivart.co.kr/assets/duijs/eshopfrontHpntinf.js"></script>
	    <script src="https://static.hyundailivart.co.kr/assets/js/rsa/jsbn.js"></script>
        <script src="https://static.hyundailivart.co.kr/assets/js/rsa/rsa.js"></script>
        <script src="https://static.hyundailivart.co.kr/assets/js/rsa/prng4.js"></script>
        <script src="https://static.hyundailivart.co.kr/assets/js/rsa/rng.js"></script>
        <!-- 넷스루 -->
        <script src="https://static.hyundailivart.co.kr/assets/js/nlogger.js"></script>
        <script src="https://static.hyundailivart.co.kr/assets/js/nlogger_common.js"></script>
        
        <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
		</head>
		<body>		
                
<section id="container" class="section-responsive" role="main">
	<div class="container">
		<!--<div class="row" style= "width: 200px; height:100px; text-align: center">아이디/비밀번호 로그인</div>-->
		<input type="hidden" name="loginLayer" id="loginLayer" value="E">
		
		<div id="bodyWrap" class="login">
		<h3 class="cnts_title"><span>로그인</span></h3></div>

		<div class="section-loginform">
			<!-- 회원 로그인 -->
			<div id="tabpanel-01" class="tabpanel" role="tabpanel" aria-labelledby="tab-01" tabindex="0">
				<div class="section-inner">
					<!-- 아이디/비밀번호 로그인 -->
					<section id="section-__show-idpw" class="showpanel mt3" aria-hidden="false">
						<h3 class="sr-only">아이디/비밀번호 로그인</h3>
						<!-- form 구역 설정 -->
						<form role="form" id="login" name="login" method="post">
							<fieldset>
								<legend>아이디/비밀번호 로그인</legend>
								<input type="hidden" name="esntlId" id="esntlId">
					   			<input type="hidden" name="socialTypeCd" id="socialTypeCd">
					   			<input type="hidden" name="isSaveHId" id="isSaveHId">
					   			<input type="hidden" name="type" id="type">
					   			<input type="hidden" name="returnUrl" id="returnUrl" value="/index">
								<!-- RSA 세팅 -->
					   			<input type="hidden" id="RSAModulus" value="bbfab89ad2d05f1471ecf3755264549383d10122b41c8cde3fdffc4744f9a5452e972222fa7b75560849e638e997b9e5d7392cadd7c3a8a57002d7244291ba978c0c1b50c460cda68f1724fdbdb9938259de2bf7044325b6a650a18b28231715279988f2d6e293ad719ac7eeaa32070c903c6a170f07a5bbc224108faae8c815">
                       			<input type="hidden" id="RSAExponent" value="10001">
                       			<!-- RSA 세팅 -->
								<div class="field">
									<div class="control">
										<input class="input" type="text" name="id" id="id" data-valid-engnum="true" placeholder="아이디 입력" value="" title="아이디" maxlength="20">
									</div>
								</div>
								<div class="field">
									<div class="control">
										<input class="input" type="password" id="password" name="password" placeholder="비밀번호 입력" title="비밀번호" maxlength="30" autocomplete="off">
										<br>
										<br>
										<br>
									</div>
								</div>
								<!-- 아이디/비밀번호 불일치시 하단 메시지 출력 부분-->
								<div class="field mt2">
									<c:if test="${message == 'error'}">
 										<div style="color:red; font-size: medium; margin-bottom: 50px; margin-top: -10px"> 아이디 또는 비밀번호가 일치하지 않습니다.</div></c:if>
									<!-- 버튼을 눌렀을 때 자바스크립트로 form 전송 -->
									<input type="button" class="button is-fullwidth mbr-btn-blue b-loginBtn" value="로그인" id="loginBtn">
									<a href="/member/joinform" class="button is-fullwidth is-primary is-outlined mbr-btn-black mt1">회원 가입</a>
								</div>
							</fieldset>
							</form>
							</section>
						</div>
					
					</div>
					
	</div>
</div>
					</section>
		
						<ul class="section-responsive-loginmenu">

<!-- 							<li><a href="/member/find_id_form">아이디 찾기</a></li> -->
<!-- 							<li><a id="find_id_btn">아이디 찾기</a></li> -->
<!-- 							<li style=margin-right:235px><a href="/member/find_password_form">비밀번호 찾기</a></li> -->
							 <!--
							<li><a href="javascript:$.eshopfront.hpnt.hPntFindId();">아이디 찾기</a></li>
							<li><a href="javascript:$.eshopfront.hpnt.hPntFindPw();">비밀번호 찾기</a></li>
							-->
						</ul>
						<script type="text/javascript">
	/* 로그인 버튼 클릭 메서드 */
	$(document).ready(function(){
		// 로그인 버튼 클릭시 필수 입력사항을 입력하지 않았을 경우 알림창을 출력, 모든 요건이 충족되면 로그인 실행
		$("#loginBtn").click(function(){
			var id=$("#id").val();
			var password=$("#password").val();
			if(id==""){
				alert("아이디를 입력하세요");
				$("#id").focus();
				return;
			}
			if(password==""){
				alert("비밀번호를 입력하세요");
				$("#password").focus();
				return;
			}
			$("#login").attr("action", "${root}/member/loginCheck.do").submit();
	});
});
</script>
		<!-- 푸터 -->	
	<%@ include file="../footer.jsp"%>
</body>
</html>