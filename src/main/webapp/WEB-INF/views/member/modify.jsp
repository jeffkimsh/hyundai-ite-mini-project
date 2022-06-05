<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.thehandsome.domain.MemberVO" %>
<!--작성자: 김연식 | 회원정보 수정 페이지-->
<!DOCTYPE html>
<html>
<head>
<!-- 헤더 -->
<%@ include file="../header.jsp"%>
<!-- 경로 지정 -->
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta name="naver-site-verification" content="2f9358e1e36605519854a595f243f0171519dd1d"/>
<meta name="google-site-verification" content="0bGV8gPhwO_PzritNvIsz2k74EH5yPsrXXluJ8ZUed8" />
<meta name="google-site-verification" content="dO99-Ao-ywXeVDEz4jz5nJBXzQXVCgmX4WXzxl_Nf3c" />
<meta name="facebook-domain-verification" content="jvxpdjfrqqan9oe1qdrjfyxj553an6" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="No-Cache"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=1, target-densitydpi=medium-dpi" />
<meta property="og:type" content="article">
        <meta property="og:title" content="더한섬닷컴 | THE HANDSOME.COM">
        <meta property="og:description" content="타임, 마인, 시스템, SJSJ 등 프리미엄 브랜드 및 트렌디한 해외·편집숍까지 가득한 스타일 플랫폼!">
        <meta property="og:image" content="http://s3.ap-northeast-2.amazonaws.com/cdn.thehandsome.com-kr/pc/210510_logo/%E3%84%B9%EB%A1%9C%EA%B3%A0.png">
        <meta property="og:url" content="http://www.thehandsome.com/ko/">
        <meta name="keywords" contents="한섬, 더한섬닷컴, 한섬몰, 한섬아울렛, 한섬닷컴, 더한섬, 한섬올라인몰, HANDSOME, thehandsome">
<title>
	&#44060;&#51064;&#51221;&#48372; &#48320;&#44221; | &#45908;&#54620;&#49452;&#45815;&#52980;</title>
<link rel="shortcut icon" href="http://cdn.thehandsome.com/_ui/desktop/common/images/common/thehandsome_ic_16x16.ico" />
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/font_443.css" media="all" />
    <link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/common.css?20220401" media="all" />
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/layout.css?20220331" media="all" />
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/popup.css?20210225" media="all" />
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/jquery-ui.min.css" media="all" />

<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/brand.css" media="all" />
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/footer.css?20220406" media="all" />
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/contents.css?20220221" media="all" />
<style type="text/css" media="print">
	@IMPORT url("https://www.thehandsome.com/_ui/desktop/common/blueprint/print.css");
</style>

<script type="text/javascript" src="https://www.thehandsome.com/_ui/desktop/common/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="https://www.thehandsome.com/_ui/desktop/common/js/jquery.vticker.js"></script><!-- 200318 ì¶ê° -->

</head>
<script type="text/javascript">
	//변경사항 저장 클릭 시 동작하는 함수
	$(document).ready(function(){
		$("#saveBtn").click(function(){
			$("#modify").attr("action", "${root}/member/modify").submit();
		});
	});
</script>
<body oncontextmenu='return false'>
		<div id="bodyWrap">
	<h3 class="cnts_title">
		<span id="menuTitle">개인정보 변경</span>
	</h3>
	<div class="sub_container">
		<!-- lnb -->
		<div class="lnb_wrap">
			<h4><a href="/ko/mypage" >마이페이지<!-- 마이페이지 --></a></h4>
			<div class="lnb">
						<dl>
							<dt>주문조회</dt>
							<dd><a href="/ko/mypage/order/myorders" onclick="GA_Event('마이페이지','LNB','주문/배송/반품/취소');">주문/배송/반품/취소</a></dd>
							</dl>
						<dl>
							<dt>혜택관리</dt>
							<dd><a href="/ko/mypage/myGradeInfo" onclick="GA_Event('마이페이지','LNB','나의 회원 등급');">나의 회원 등급</a></dd>
							<dd><a href="/ko/mypage/voucher" onclick="GA_Event('마이페이지','LNB','나의 쿠폰');">나의 쿠폰<!-- 쿠폰함 --></a></dd>
							<dd><a href="/ko/mypage/mypoint" onclick="GA_Event('마이페이지','LNB','나의 한섬마일리지');">나의 한섬마일리지</a></dd>
							<dd><a href="/ko/mypage/myEGiftCard" onclick="GA_Event('마이페이지','LNB','E-GIFT CARD');">e-Gift Card</a></dd>
</dl>
						<dl>
							<dt>나의 상품관리</dt>
							<dd><a href="/ko/mypage/myWish" onclick="GA_Event('마이페이지','LNB','위시리스트');">위시리스트<!-- 위시리스트 --></a></dd>
							<dd><a href="/ko/mypage/rsalarm" onclick="GA_Event('마이페이지','LNB','재입고 알림');">재입고 알림<!-- 재입고알림 --></a></dd>
							</dl>
						<dl>
							<dt>나의 정보관리</dt>
							<dd><a href="/ko/mypage/personInfomationChangePWCheck" onclick="GA_Event('마이페이지','LNB','개인정보 변경/탈퇴');">개인정보 변경/탈퇴</a></dd>
							<dd><a href="/ko/mypage/shoppingAddressPWCheck" onclick="GA_Event('마이페이지','LNB','배송지 관리');">배송지 관리</a></dd>
							<dd><a href="/ko/mypage/oneClick" onclick="GA_Event('마이페이지','LNB','원클릭 결제 관리');">원클릭 결제 관리</a></dd>
							<dd><a href="/ko/mypage/mergeCustomerInfo" onclick="GA_Event('마이페이지','LNB','한섬 멤버십 통합');">한섬 멤버십 통합</a></dd>
							</dl>
						<dl>
							<dt>나의 활동관리</dt>
							<!-- <dd><a href="#">회원등급</a></dd> -->
							<dd><a href="/ko/mypage/myreview" onclick="GA_Event('마이페이지','LNB','내 상품평');">내 상품평</a></dd>
							<dd><a href="/ko/mypage/myqna" onclick="GA_Event('마이페이지','LNB','상품 Q&A');">상품 Q&A</a></dd>
							<dd><a href="/ko/mypage/mymantomaninquiry" onclick="GA_Event('마이페이지','LNB','1:1 문의');">1:1 문의</a></dd>
							<!-- <dd><a href="#">이벤트 참여현황</a></dd> -->
						</dl>
						</div>
					<!-- ph_guide -->
					<div class="ph_guide">
						<p class="tlt">고객센터 운영 안내</p>
						<p class="phone">1800-5700<span style="color:#c69c6d;" class="txt">(유료)</span></p>
						<p class="txt">평일(월~금)<br>am 09:00 ~ pm 18:00<span>토/일, 공휴일 휴무</span></p>
						<a href="mailto:shophelp@thehandsome.com">shophelp<br>@thehandsome.com</a>
					</div>
					<!-- //ph_guide -->
				</div>
		<!-- //lnb -->
		<!-- cnts -->
		<div class="sub_cnts">

	<!-- //lnbWrap -->
	<div>
		<div class="title_wrap mt30">
			<h4 class="float_left">개인정보 변경</h4>
			<p class="txt_line">회원정보를 확인하고, 변경할 수 있습니다. </p>
			<p class="reqd_txt"><strong class="reqd">*</strong> 표시는 필수항목입니다.</p>
		</div>

			<fieldset>
				<legend>회원정보입력</legend>
			<form id="modify" method="post" name="modify">
				<div class="tblwrap">
					<table class="tbl_wtype1">
						<caption>회원가입 입력항목</caption>
						<colgroup>
							<col style="width:140px" />
							<col />
						</colgroup>
																	<!-- 각 입력 폼의 value에 JSTL로 각 해당 값으로 설정해주어 입력된 값이 출력되게 함  -->
						<tbody>
							<tr>
								<th scope="row" class="th_space"><strong class="reqd">*</strong>아이디</th>
								<td><input type="hidden" id="id" name="id" style="width:100%;margin:5px 0" value="${member.id }" title="id" class="form-control" />${member.id }</td>
							</tr>
							<tr>
								<th scope="row" class="th_space"><strong class="reqd">*</strong>이름</th>
								<td><input type="hidden" id="name" name="name" style="width:100%;margin:5px 0" value="${member.name }" title="name" class="form-control"/>${member.name }</td>
							</tr>
							<tr>
								<th scope="row" class="th_space"><strong class="reqd">*</strong>생년월일</th>
								<td><input type="text" name="birth" id="birth" value="${member.birth}" title="birth" class="form-control"/></td>
							</tr>
							<tr>
								<th scope="row" class="th_space"><strong class="reqd">*</strong><label for="pwChangeBtn">비밀번호</label></th>
								<td>
								<input type="password" id="password" name="password" style="width:100%;margin:5px 0" value="${member.password }" title="password" class="form-control"/> 					
									</td>
							</tr>
							<tr>
								<th scope="row" class="th_space"><strong class="reqd">*</strong>이메일</th>
								<td><input type="text" id="email" name="email" style="width:100%;margin:5px 0" value="${member.email }" title="email" class="form-control"/></td>
							</tr>
							<tr>
								<th scope="row" class="th_space"><strong class="reqd">*</strong>전화번호</th>
								<td><input type="text" id="phone" name="phone" style="width:100%;margin:5px 0" value="${member.phone }" title="phone" class="form-control"/></td>
							</tr>
						</tbody>
					</table>
				</div>
				</form>
			</fieldset>

		<!-- btn_btwrap -->
		<!-- 각 버튼에 클릭 시 함수실행 명령이나 id로 실행 경로 설정 -->
		<div class="btn_btwrap">
			<input type="button" class="btn wt_ss" value="회원탈퇴" id="memberSecessionBtn" onclick="location.href='/member/secession'"/>
		</div>
		<div class="btnwrap mypage2">
			<input type="button" class="btn wt" value="취소" id="cancleBtn" onclick="location.href='/'"/>
			<input type="button" class="btn gray" value="변경사항 저장" id="saveBtn"/>
		</div>
		<!-- //btn_btwrap -->
	</div>
</div>
		<!-- //cnts -->
		<!-- 푸터 -->
<%@ include file="../footer.jsp"%>
</body>

</html>
