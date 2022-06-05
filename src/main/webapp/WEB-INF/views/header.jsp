<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<%@ include file="/component/header_script.jsp"%>
<title>더한섬닷컴 | THE HANDSOME.COM</title>
<body>
	<div id="headerWrap">
		<div class="header header_fixed header_main1903">
			<script type="text/javascript"
				src="http://www.thehandsome.com/_ui/desktop/common/js/SsoAjax.js"></script>
			<script type="text/javascript"
				src="http://www.thehandsome.com/_ui/desktop/common/wisenut/ark/js/beta.fix.js"></script>
			<script type="text/javascript"
				src="http://www.thehandsome.com/_ui/desktop/common/wisenut/ark/js/ark.js"></script>
			<script type="text/javascript"
				src="http://www.thehandsome.com/_ui/desktop/common/wisenut/js/search.js"></script>
			<form id="autologinForm" name="autologinForm"
				action="/ko/hp/autologin" method="get">
				<input type="hidden" name="hcid" id="hcid" value="e2gaf@naver.com">
			</form>
			<div class="top_nav topnav1903">
				<div class="top_nav_wrap clearfix">
					<div class="brand_menu brand_menu1903">
						<ul class="clearfix">
							<!-- 선호 브랜드 없음 -->
							<li><span class="on"><a href="/"
									onclick="GA_Event('공통','탑_네비게이션','HOME')">HOME</a></span></li>
							<!-- 로그인 상태 -->
							<!-- 비로그인 상태 -->
							<p class="brand_menu_guide_text">
								로그인 후 아래 '브랜드' 메뉴에서 좋아하는 브랜드를 <span
									style="margin-top: -1px; display: inline-block;">♥</span>해주세요
							</p>
						</ul>
					</div>
					<div class="util_menu" style="display: block;">
						<ul class="clearfix">
							<c:choose>
								<c:when test="${member != null}">
								<li style=margin-right:50px><a href='/member/mypage' onclick="GA_Event('공통','헤더_메뉴','')" >${member.id}님 환영합니다!</a></li>
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
							<c:choose>
                               <c:when test="${member == null}">
                                   <li style=margin-right:5px><a href="/member/login" onclick="GA_Event('공통','헤더_메뉴','로그인')">로그인</a></li>
                               </c:when>
                               <c:otherwise>
                                   <li style=margin-right:5px><a href="/member/logout" onclick="GA_Event('공통','헤더_메뉴','로그아웃')">로그아웃</a></li>
                               </c:otherwise>
                            </c:choose>
							<li><a href="/board/list">커뮤니티</a></li>
							<li class="header_dropmemu mypage"><a href="/ko/mypage"
								class="btn" onclick="GA_Event('공통','헤더_메뉴','마이페이지')">마이페이지</a>
								<div class="list">
									<ul>
										<li><a href="/ko/mypage/order/myorders"
											onclick="GA_Event('공통','헤더_메뉴','마이페이지_주문조회')">주문조회<!-- 주문조회 --></a></li>
										<li><a href="/ko/mypage/myGradeInfo"
											onclick="GA_Event('공통','헤더_메뉴','마이페이지_나의회원등급')">나의회원등급<!-- 온라인등급 --></a></li>
										<li><a href="/ko/mypage/voucher"
											onclick="GA_Event('공통','헤더_메뉴','마이페이지_쿠폰조회')">쿠폰조회<!-- 쿠폰조회 --></a></li>
										<li><a href="/ko/mypage/mypoint"
											onclick="GA_Event('공통','헤더_메뉴','마이페이지_마일리지조회')">마일리지조회<!-- 포인트조회 --></a></li>
										<li><a href="/ko/mypage/myEGiftCard"
											onclick="GA_Event('공통','헤더_메뉴','마이페이지_e-Gift Card')">e-Gift
												Card<!-- e-Gfit Card -->
										</a></li>
										<li><a href="/member/modify"
											onclick="GA_Event('공통','헤더_메뉴','마이페이지_회원정보변경')">회원정보변경<!-- 회원정보변경 --></a></li>
										<li><a href="/ko/svcenter/mantomaninquiry"
											onclick="GA_Event('공통','헤더_메뉴','마이페이지_온라인상담')">온라인상담<!-- 온라인 상담 --></a></li>
									</ul>
								</div></li>

							<li>
								<div class="header_dropmemu lang_switch lang_1911">
									<a href="javascript:void(0);" class="btn"
										onclick="GA_Event('공통','헤더_메뉴','LANGUAGE')">LANGUAGE</a>
									<div class="list"
										style="display: none; height: 87px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
										<ul>
											<li><a href="javascript:language('ko')"
												onclick="GA_Event('공통','헤더_메뉴','LANGUAGE_한국어')">한국어</a></li>
											<li><a href="javascript:language('en')"
												onclick="GA_Event('공통','헤더_메뉴','LANGUAGE_ENGLISH')">ENGLISH</a></li>
											<li><a href="javascript:language('zh')"
												onclick="GA_Event('공통','헤더_메뉴','LANGUAGE_中文')">中文</a></li>
										</ul>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>

			<!-- validation check message global -->
			<input type="hidden" id="validationCheckPwd"
				value="비밀번호를 재입력 하셔야 합니다."> <input type="hidden"
				id="validationCheck" value="필수데이터가 입력되지 않았습니다."> <input
				type="hidden" id="validationCheckMsg" value="다음 사항을 확인해 주세요.">
			<input type="hidden" id="validationCheckMsg1"
				value="필수데이터가 입력되지 않았습니다."> <input type="hidden"
				id="validationCheckMsg2" value="동일문자를 3번 이상 사용할 수 없습니다."> <input
				type="hidden" id="validationCheckMsg3"
				value="연속된 문자열(123 또는 321, abc, cba 등) 3자리이상 올 수 없습니다."> <input
				type="hidden" id="validationCheckMsg4" value="Caps Lock 이 켜져 있습니다.">
			<input type="hidden" id="validationCheckMsg5"
				value="이메일 아이디의 중복 확인이 필요합니다."> <input type="hidden"
				id="validationCheckMsg6" value="이메일의 중복확인이 필요합니다."> <input
				type="hidden" id="deliveryOkMsg" value="확인"> <input
				type="hidden" id="deliveryCancelMsg" value="취소">

			<form id="chatbotForm"
				action="https://talk.thehandsome.com/front/v1/jsp/view/chat.jsp"
				method="post" target="chatwindow">
				<input type="hidden" name="token" id="chatbot_token"> <input
					type="hidden" name="talkId" id="chatbot_talkId">
				<div>
					<input type="hidden" name="CSRFToken"
						value="0ac1af97-b493-4b40-bac1-f0269b57bc11">
				</div>
			</form>
			<!-- //headerWrap -->
			<div class="gnbwarp com clearfix">
				<h1 class="logo logo1903">
					<a href="/" onclick="GA_Event('공통', '로고', '상단');">thehandsome.com</a>
				</h1>
				<div class="gnb_nav gnb_nav1903 hscene1906 hscene1910">
					<h2 class="invisible">주메뉴</h2>
					<ul class="cate_m cate_banner gnbul1" id="cate_m_main">
						<li><a href="javascript:void(0);" class="gnb_brand"
							onclick="GA_Event('공통','GNB','브랜드');">브랜드<span class="arr">arrow</span></a>
						</li>

						<li><a href="/ko/item/we"
							onclick="GA_Event('공통','GNB','여성');GA_Event('공통_카테고리','1DEPTH','여성');"
							class="">여성<span class="arr">arrow</span></a>
							<div class="sub_back" style="height: 0px; border-bottom: 0px;">
								<div class="sub_menu clearfix" style="display: none;">
									<ul class="al_frt1 sm_dep1"
										style="margin-left: 165px; margin-bottom: 25px;">
										<li><a href="/ko/c/we"
											onclick="GA_Event('공통_카테고리','2DEPTH','여성_전체보기');">전체보기<!-- 전체보기 --></a>
										</li>
										<li><a href="/ko/c/we09/"
											onclick="GA_Event('공통_카테고리','2DEPTH','여성_SPECIAL SHOP*');">SPECIAL
												SHOP*</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/ko/c/we09v/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_MINE : CODE MINE E');">MINE
														: CODE MINE E</a></li>
												<li><a href="/ko/c/we09k/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_LATT : EXCLUSIVE -THE LINES');">LATT
														: EXCLUSIVE -THE LINES</a></li>
												<li><a href="/ko/c/we093/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_SYSTEM : JEANS');">SYSTEM
														: JEANS</a></li>
												<li><a href="/ko/c/we094/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_SJSJ : SCENT IN TALES');">SJSJ
														: SCENT IN TALES</a></li>
												<li><a href="/ko/c/we098/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_SYSTEM : PARIS PRESENTATION');">SYSTEM
														: PARIS PRESENTATION</a></li>
												<li><a href="/ko/c/we091/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_OBZEE : ICONIC OBZEE');">OBZEE
														: ICONIC OBZEE</a></li>
												<li><a href="/ko/c/we09b/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_O&amp;#039;2ND : 25TH ANNIV. MARIE ASSENAT ');">O'2ND
														: 25TH ANNIV. MARIE ASSENAT </a></li>
												<li><a href="/ko/c/we09j/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_TOMGREYHOUND: THE GREY');">TOMGREYHOUND:
														THE GREY</a></li>
												<li><a href="/ko/c/we095/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_FOURM THE STORE : PALETTE');">FOURM
														THE STORE : PALETTE</a></li>
												<li><a href="/ko/c/we096/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_FOURM STUDIO : RE:STUDIO');">FOURM
														STUDIO : RE:STUDIO</a></li>
												<li><a href="/ko/c/we097/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_LANVIN COLLECTION : IT. 1');">LANVIN
														COLLECTION : IT. 1</a></li>
												<li><a href="/ko/c/we092/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_TIME : SIGNATURE SUIT');">TIME
														: SIGNATURE SUIT</a></li>
												<li><a href="/ko/c/we09q/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_SPECIAL SHOP*_LATT : WITH 신민아');">LATT
														: WITH 신민아</a></li>
											</ul></li>
										<!--  status2.last end -->
										<li><a href="/ko/c/we05/"
											onclick="GA_Event('공통_카테고리','2DEPTH','여성_아우터');">아우터</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/ko/c/we051/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_재킷');">재킷</a>
												</li>
												<li><a href="/ko/c/we052/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_점퍼');">점퍼</a>
												</li>
												<li><a href="/ko/c/we015/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_가디건/베스트');">가디건/베스트</a>
												</li>
												<li><a href="/ko/c/we053/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_트렌치 코트');">트렌치
														코트</a></li>
												<li><a href="/ko/c/we054/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_코트');">코트</a>
												</li>
												<li><a href="/ko/c/we055/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_아우터_다운/패딩');">다운/패딩</a>
												</li>
											</ul></li>
										<!--  status2.last end -->
										<li><a href="/ko/c/we01/"
											onclick="GA_Event('공통_카테고리','2DEPTH','여성_탑');">탑</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/ko/c/we011/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_탑_티셔츠');">티셔츠</a>
												</li>
												<li><a href="/ko/c/we012/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_탑_블라우스');">블라우스</a>
												</li>
												<li><a href="/ko/c/we013/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_탑_셔츠');">셔츠</a></li>
												<li><a href="/ko/c/we014/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_탑_니트');">니트</a></li>
											</ul></li>
										<!--  status2.last end -->
										<li><a href="/ko/c/we04/"
											onclick="GA_Event('공통_카테고리','2DEPTH','여성_드레스');">드레스</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/ko/c/we041/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_드레스_미니 드레스');">미니
														드레스</a></li>
												<li><a href="/ko/c/we042/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_드레스_미디 드레스');">미디
														드레스</a></li>
												<li><a href="/ko/c/we043/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_드레스_롱/맥시 드레스');">롱/맥시
														드레스</a></li>
											</ul></li>
										<!--  status2.last end -->
										<li><a href="/ko/c/we02/"
											onclick="GA_Event('공통_카테고리','2DEPTH','여성_팬츠');">팬츠</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/ko/c/we021/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_팬츠_캐주얼');">캐주얼</a>
												</li>
												<li><a href="/ko/c/we022/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_팬츠_포멀');">포멀</a></li>
												<li><a href="/ko/c/we023/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_팬츠_데님');">데님</a></li>
												<li><a href="/ko/c/we024/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_팬츠_쇼츠');">쇼츠</a></li>
											</ul></li>
										<!--  status2.last end -->
										<li style="margin-right: 0px"><a href="/ko/c/we03/"
											onclick="GA_Event('공통_카테고리','2DEPTH','여성_스커트');">스커트</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/ko/c/we031/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_스커트_미니 스커트');">미니
														스커트</a></li>
												<li><a href="/ko/c/we032/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_스커트_펜슬 스커트');">펜슬
														스커트</a></li>
												<li><a href="/ko/c/we033/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_스커트_플레어 스커트');">플레어
														스커트</a></li>
												<li><a href="/ko/c/we034/"
													onclick="GA_Event('공통_카테고리','3DEPTH','여성_스커트_롱/맥시 스커트');">롱/맥시
														스커트</a></li>
											</ul></li>
									</ul>
									<div class="gnb_banner float_right"></div>
								</div>
							</div> <!--  status2.last end --> <!-- categoryItemList end --></li>
						<li><a href="/product/productList?pageNum=1&amount=8"
							onclick="GA_Event('공통','GNB','남성');GA_Event('공통_카테고리','1DEPTH','남성');"
							class="">남성<span class="arr">arrow</span></a>
							<div class="sub_back" style="height: 0px; border-bottom: 0px;">
								<div class="sub_menu clearfix" style="display: none;">
									<ul class="al_frt1 sm_dep1"
										style="margin-left: 165px; margin-bottom: 25px;">
										<li><a href="/ko/c/me"
											onclick="GA_Event('공통_카테고리','2DEPTH','남성_전체보기');">전체보기<!-- 전체보기 --></a>
										</li>
										<li><a href="/ko/c/me09/"
											onclick="GA_Event('공통_카테고리','2DEPTH','남성_SPECIAL SHOP*');">SPECIAL
												SHOP*</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/ko/c/me09c/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_SPECIAL SHOP*_SYSTEM HOMME : PLAYER LINE');">SYSTEM
														HOMME : PLAYER LINE</a></li>
												<li><a href="/ko/c/me094/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_SPECIAL SHOP*_SYSTEM HOMME : PARIS PRESENTATION');">SYSTEM
														HOMME : PARIS PRESENTATION</a></li>
												<li><a href="/ko/c/me093/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_SPECIAL SHOP*_SYSTEM HOMME : TYPE 2');">SYSTEM
														HOMME : TYPE 2</a></li>
												<li><a href="/ko/c/me091/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_SPECIAL SHOP*_CLUB MONACO : PANTS ARCHIVE');">CLUB
														MONACO : PANTS ARCHIVE</a></li>
												<li><a href="/ko/c/me095/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_SPECIAL SHOP*_TIME HOMME : ONLINE EXCLUSIVE');">TIME
														HOMME : ONLINE EXCLUSIVE</a></li>
											</ul></li>
										<!--  status2.last end -->
										<li><a href="/ko/c/me03/"
											onclick="GA_Event('공통_카테고리','2DEPTH','남성_아우터');">아우터</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/product/productList?pageNum=1&amount=8"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_재킷');">재킷</a>
												</li>
												<li><a href="/ko/c/me032/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_점퍼');">점퍼</a>
												</li>
												<li><a href="/ko/c/me015/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_가디건/베스트');">가디건/베스트</a>
												</li>
												<li><a href="/ko/c/me033/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_트렌치코트');">트렌치코트</a>
												</li>
												<li><a href="/ko/c/me034/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_코트');">코트</a>
												</li>
												<li><a href="/ko/c/me035/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_아우터_다운/패딩');">다운/패딩</a>
												</li>
											</ul></li>
										<!--  status2.last end -->
										<li><a href="/ko/c/me01/"
											onclick="GA_Event('공통_카테고리','2DEPTH','남성_탑');">탑</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/ko/c/me011/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_탑_티셔츠');">티셔츠</a>
												</li>
												<li><a href="/ko/c/me012/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_탑_셔츠');">셔츠</a></li>
												<li><a href="/ko/c/me013/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_탑_니트');">니트</a></li>
												<li><a href="/ko/c/me014/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_탑_스웨터');">스웨터</a>
												</li>
											</ul></li>
										<!--  status2.last end -->
										<li><a href="/ko/c/me02/"
											onclick="GA_Event('공통_카테고리','2DEPTH','남성_팬츠');">팬츠</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/ko/c/me021/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_팬츠_루즈/테이퍼드');">루즈/테이퍼드</a>
												</li>
												<li><a href="/ko/c/me025/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_팬츠_슬림/스트레이트');">슬림/스트레이트</a>
												</li>
												<li><a href="/ko/c/me028/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_팬츠_조거/트랙');">조거/트랙</a>
												</li>
												<li><a href="/ko/c/me022/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_팬츠_데님');">데님</a></li>
												<li><a href="/ko/c/me023/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_팬츠_쇼츠');">쇼츠</a></li>
											</ul></li>
										<!--  status2.last end -->
										<li style="margin-right: 0px"><a href="/ko/c/me04/"
											onclick="GA_Event('공통_카테고리','2DEPTH','남성_수트');">수트</a>
											<ul class="clearfix sm_dep2">
												<li><a href="/ko/c/me041/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_수트_드레스셔츠');">드레스셔츠</a>
												</li>
												<li><a href="/ko/c/me042/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_수트_수트재킷');">수트재킷</a>
												</li>
												<li><a href="/ko/c/me044/"
													onclick="GA_Event('공통_카테고리','3DEPTH','남성_수트_수트팬츠');">수트팬츠</a>
												</li>
											</ul></li>
									</ul>
									<div class="gnb_banner float_right"></div>
								</div>
							</div> <!--  status2.last end --> <!-- categoryItemList end --></li>
						<li><a href="/ko/c/as"
							onclick="GA_Event('공통','GNB','잡화');GA_Event('공통_카테고리','1DEPTH','잡화');"
							class="">잡화<span class="arr">arrow</span></a>
							</li>
						<li><a href="/ko/c/be"
							onclick="GA_Event('공통','GNB','뷰티');GA_Event('공통_카테고리','1DEPTH','뷰티');">뷰티<i
								class="ico-new">new</i><span class="arr">arrow</span></a>
							
						<li><a href="/ko/c/ls"
							onclick="GA_Event('공통','GNB','라이프스타일');GA_Event('공통_카테고리','1DEPTH','라이프스타일');"
							class="">라이프스타일<span class="arr">arrow</span></a>
					</ul>

					<ul class="cate_m cate_banner gnbul2" id="cate_m_main"
						style="float: right;">
						<li><a href="/ko/magazine/exhibitions"
							onclick="GA_Event('공통','GNB','기획전');">기획전<!-- 기획전 --></a></li>
						<li><a href="/ko/magazine/events"
							onclick="GA_Event('공통','GNB','이벤트');">이벤트</a></li>
						<!-- THE 매거진 수정 200330 -->
						<li><a href="/ko/magazine/submain" class="magazine1803"
							onclick="GA_Event('공통','GNB','THE 매거진');">THE 매거진<!-- 매거진 -->
								<span class="arr">arrow</span></a></li>
						<!-- // THE 매거진 수정 200330 -->
						<!-- 20210319 편집샵 추가 -->
						<li><a href="/ko/ed/edMain"
							onclick="GA_Event('공통','GNB','편집샵');" class="">편집샵</a></li>
						<!-- 20200710 룩북 추가 -->
						<li><a href="/ko/magazine/lookbook" class="">룩북</a></li>
						<li><a href="/ko/ou/outletMain"
							onclick="GA_Event('공통','GNB','아울렛');" class="">아울렛*</a></li>
					</ul>
				</div>
				<!-- 첫번째 c:if -->

				<div id="transparent_mask"></div>
				<!-- 201803 util menu -->
				<div class="util_menu util_menu1803">
					<ul class="clearfix">
						<li><a href="javascript:void(0);"><span class="ico_sh">search</span></a></li>
						<li><a href="/ko/mypage/myWish"
							onclick="GA_Event('공통','유틸_메뉴','위시리스트');"><span
								class="ico wishlist">wish list</span> <span class="count">(<span
									id="wishlistCount">0</span>)
							</span></a></li>
						<li><a href="/ko/shoppingbag"
							onclick="GA_Event('공통','유틸_메뉴','쇼핑백');"><span
								class="ico cart">장바구니</span> <span class="count">(<span
									id="cartCount">0</span>)
							</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
