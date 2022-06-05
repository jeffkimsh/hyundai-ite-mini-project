<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--작성자: 김연식 | 회원탈퇴 페이지-->
<!DOCTYPE html>
<html>
<head>
<!-- 헤더 -->
<%@ include file="../header.jsp"%>
<!-- 기준 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	회원탈퇴 | 더한섬닷컴</title>
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
<script type="text/javascript">

//     $("#memberSecessionBtn").click(function(){
    	
//     	if(confirm("탈퇴하시겠습니까?")){
//     		document.rmform.action="/member/secession";
//     		document.rmform.submit();
//     	}
//     });
// 		if($("rmform").submit(function(){
// 			if(!confirm("정말 탈퇴하시겠습니까?")){
// 				return false;
// 			}
// 		}));
		
// 		$(document).ready(function(){
// 			$("#secession").click(function(){
// 				//패스워드 입력 확인
// 				if($("#password").val() == ''){
// 					alert("패스워드를 입력해 주세요.");
// 					$("#password").focus();
// 					return;
// 				}
				
// 				//패스워드 맞는지 확인
// 				$.ajax({
// 					url: "/member/pwCheck",
// 					type: "POST",
// 					dataType:"json",
// 					data: $("#rmform").serializeArray(),
// 					success: function(data){
// 						if(data==0){
// 							alert("비밀번호가 틀렸습니다.");
// 							return;
// 						}else{
// 							//탈퇴
// 							if(confirm('정말 탈퇴 하시겠습니까?')){
// 								$("#rmform").submit();
// 							}
// 						}
// 					}
// 			})
// 		});
</script>
 
<script type="text/javascript" src="/_ui/desktop/common/js/handsome/common.js"></script>
<script type="text/javascript" src="/_ui/desktop/common/js/handsome/html5shiv-printshiv.js"></script>
<script type="text/javascript" src="/_ui/desktop/common/js/handsome/jquery.flexslider.js"></script>
<script type="text/javascript" src="/_ui/desktop/common/js/handsome/ui.js?20211105"></script>
<script type="text/javascript" src="/_ui/desktop/common/js/jquery.form-3.51.js"></script>
<script type="text/javascript" src="/_ui/desktop/common/js/common_function.js?20220411"></script>
<script type="text/javascript" src="/_ui/desktop/common/js/videojs-ie8.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="/_ui/desktop/common/js/handsome/html5shiv.js"></script>
<script type="text/javascript" src="/_ui/desktop/common/js/handsome/respond.js"></script>
<![endif]-->
 
<script type="text/javascript" src="/_ui/desktop/common/js/jquery-ui-1.11.2.min.js"></script>

<script type="text/javascript" src="/_ui/desktop/common/js/instagramAPI.js"></script>
<script type="text/javascript" src="/_ui/desktop/common/js/makePCookie.js"></script>

<script type="text/javascript" src="/_ui/desktop/common/wisenut/js/jquery.min.js"></script>

<script type="text/javascript" src="/_ui/desktop/common/js/netfunnel.js" charset="UTF-8"></script>
<script type="text/javascript" src="/_ui/desktop/common/js/netfunnel_skin.js" charset="UTF-8"></script>

<script type="text/javascript" src="/_ui/desktop/common/js/unorm.js"></script>

<script type="text/javascript" src="/_ui/desktop/common/js/appboy.min.js"></script>
<script type="text/javascript">

function GA_Event(Category,Action,Label) {
    
    Label = unescape(Label).replace(/\&#039;/gi,"'");
    
    var v_Label = Label;
    var v_Category = Category;
    var v_Action = Action;
    //공백처리을  _ 처리
    if(Category != null){
        v_Category = Category.replace(/\s{2,}/gi,' ').trim().replace(/\s/gi,'_');
    }
    if(Action != null){
        v_Action = Action.replace(/\s{2,}/gi,' ').trim().replace(/\s/gi,'_');
    }
    if(Label != null){
        v_Label = Label.replace(/\s{2,}/gi,' ').trim().replace(/\s/gi,'_');
    }
    ga('gp.send','event',v_Category,v_Action,v_Label);
}
</script>
<style media="screen">
 .blsmflw1 {animation: target_image 1.5s;animation-iteration-count: 2;transform-origin:50% 50%;}
 @keyframes target_image {
	0% { transform: rotate(-1deg); }
	50% { transform: rotate(9deg) }
	100% { transform: rotate(-1deg); }
 }
</style>
</head>

	<form id="CSRFForm" action="/ko/mypage/memberSecession" method="post"><div>
<input type="hidden" name="CSRFToken" value="b6225150-9223-454b-ba0f-3267c61eed6f" />
</div></form>
		
		<div id="bodyWrap">
	<h3 class="cnts_title">
		<span id="menuTitle">개인정보 변경/탈퇴</span>
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
			
			
			<script type="text/javascript" src="/_ui/desktop/common/js/jquery-1.11.2.min.js"></script>

	<input type="hidden" name="prk" id="prk" value="8929558659076" />
	<input type="hidden" name="chkEnable" id="chkEnable" value="" /> <!-- 오프라인 회원 동시탈퇴 체크 유무 -->
										<!-- 회원정보 -->
<div class="profile_info clearfix">
        <div class="name ">
	            <span class="ico_grade">${member.name}&nbsp;<span>님</span></span>
	             <span class="grade_txt">우수회원</span>
	        </div>
	        <div class="point">
	            <p class="title">POINT</p>
	            <a class="count" href="/ko/mypage/mypoint">0&nbsp;<span>P</span></a>
	        </div>
	        <div class="point">
			            <p class="title">H.POINT</p>
			            <a class="count" href="https://www.h-point.co.kr/cu/myh/myPnt.shd" target="_blank">80&nbsp;<span>P</span></a>
			        </div>
		        <div class="point">
	            <p class="title">GIFT CARD</p>
	           <a class="count" href="/ko/mypage/mygiftcard">0&nbsp;<span>원</span></a>
	        </div>
	        <div class="point">
				<p class="title">e-money</p>
				<a class="count" href="/ko/mypage/myEGiftCard">0&nbsp;<span>원</span></a>
			</div>
	        <div class="point">
	            <p class="title">COUPON</p>
	            <a class="count" href="/ko/mypage/voucher">5&nbsp;<span>장</span></a>
	        </div>
        </div>
<!-- 회원정보 -->
<div class="sub_cnts">
	<div class="title_wrap line mt30">
		<h4 class="float_left">회원 탈퇴 안내<!-- 회원 탈퇴 안내 --></h4>
		<p class="txt_line">회원 탈퇴 전 다음 사항을 반드시 숙지해 주시기 바랍니다.<!-- 회원 탈퇴 전 다음 사항을 반드시 숙지해 주시기 바랍니다. --></p>
	</div>

	<div class="dropout_info info_cont190830">
		<ul>
			<li>
				<div>
				<strong>1</strong>
					<p>
						더한섬닷컴 <b>탈퇴 시 보유하신 쿠폰, 회원정보, 거래정보 등은 모두 삭제</b>됩니다.<!-- 회원 탈퇴 시 회원님께서 보유하셨던 e-money 잔액, 쿠폰, 회원정보, 거래정보 등은 모두 삭제 됩니다. -->
					</p>
				</div>
			</li>
			<li>
				<div>
						<strong>2</strong>
						<p>
								더한섬닷컴만 탈퇴 되며, 기존 가입한 한섬 통합멤버십(한섬 오프라인 매장/H패션몰/EQL)과 H.Point 통합멤버십은 유지됩니다. <br>한섬 통합멤버십 또는 H.Point 통합회원 탈퇴를 원하실 경우, 탈퇴 유형 선택 페이지에서 다시 선택해주세요.<!-- 회원탈퇴 시 온라인회원에서만 탈퇴 되며, 오프라인 회원 탈퇴는 고객센터로 문의해 주시기 바랍니다. -->							
						</p>
					</div>
				</li>
			<li>
				<div class="line2">
					<strong>3</strong>
					<p>
						거래 정보가 있는 경우, 판매 거래 정보 관리를 위하여 구매와 관련된 상품정보, 거래 내역 등에 대한 기본정보는 탈퇴 후 5년간 <br>보관합니다. <!-- 거래 정보가 있는 경우, 판매 거래 정보 관리를 위하여 구매와 관련된 상품정보, 아이디, 거래 내역 등에 대한 기본정보는 탈퇴 후 5년간 보관합니다. -->
							
						</p>
				</div>
			</li>
            <li>
                <div class="line2">
		            <strong>4</strong>
		            <p>
			            회원 <b>탈퇴 후 90일간 재가입이 불가</b>하며, 탈퇴 후 재가입 시에는 신규 회원가입으로 처리됩니다.<br>(탈퇴 전 쿠폰, 회원정보, 거래내역 등은 복구되지 않습니다.)</p>
                </div>
	        </li>
	        <li>
	            <div class="line2">
		            <strong>5</strong>
		            <p>
			            더한섬닷컴의 주문(배송/교환/반품) 및 상담 등이 진행중이거나, e-money의 자산을 보유한 경우 탈퇴가 불가합니다.<br>(진행 건 처리 완료 및 자산 소진 시 탈퇴 가능)</p>
	            </div>
	        </li>
	        </ul>
	</div>
    
	<form action="/member/secessioncomplete" name="rmform" id="rmform" method="post">
		<input type="hidden" name="id" value="${sessionScope.id}">
		<table border=1>
<!-- 			<tr> -->
<!-- 			<th scope="row"><strong class="reqd">*</strong>비밀번호</th> -->
<!--                                             <td> -->
<!--                                             <input type="password" class="form-control" style="width:120px" title="비밀번호" id="password"  name="password"> -->
<!--                                             </td> -->
<!-- 			</tr> -->
		</table>
		<div class="btnwrap">
<!-- 		<tr>  -->
<!-- 				<td colspan=2 align="center"><a href="#" id="secession">탈퇴하기</a></td> -->
<!-- 			</tr>  -->
											<!--  버튼에 경로 지정 -->
		<input type="submit" class="btn gray" id="secession" name="secession" onclick="secession();" value="회원탈퇴 "/>
	</div>
	</form>
</div>

</div>
		<!-- //cnts -->
	</div>
</div>

</html>
