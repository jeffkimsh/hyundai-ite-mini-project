<!-- 
작성자 : 김승환
기능 : 상품 상세 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 최상단의 경로를 좀 더 편리하고, 수정시에도 경로가 어디인지 헷갈리지 않도록 변수 값에 저장해주었다. -->
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
<!-- 헤더 삽입  -->
<%@ include file="../header.jsp"%>
<meta charset="UTF-8">
<title>[ORDINARY FITS] 턱 데님 재킷 | JACKET | OUTER | MEN | HANDSOME
   | 더한섬닷컴</title>
<%@include file="/component/script.jsp"%>


<script type="text/javascript">
   var check_size = 0
   
   // 해당 상품의 다른 색상으로 전환 
   function changeColor(pcode, pindex, pcolor, cartcolorurl){
      $.ajax({
         url :'/product/productDetail2',
         type : 'POST',
         data: {"pcode": pcode},
         dataType: 'json',
         success : function(res) {
            
            console.log(res);
            
            var html = '';
            
            html += '<li><img src="'+res.imgUrl2.split(',')[pindex]+'" class="respon_image" onerror="this.src=\'http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg\'"></li>';
            html += '<li><img src="'+res.imgUrl3.split(',')[pindex]+'" class="respon_image" onerror="this.src=\'http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg\'"></li>';
            html += '<li><img src="'+res.imgUrl4.split(',')[pindex]+'" class="respon_image" onerror="this.src=\'http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg\'"></li>';
            html += '<li><img src="'+res.imgUrl5.split(',')[pindex]+'" class="respon_image" onerror="this.src=\'http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg\'"></li>';
            
            // 장바구니 form의 상품 색상 input값 설정 
            $("#cartcolor").val(pcolor);        
            $("#cartcolorurl").val(cartcolorurl);
            $("#ul_img").html(html);       
         },
         error : function(res){
            console.log(res);
            alert("no");
         }
      });
   } // end changeColor
   
	// 해당 상품의 다른 색상이 어떤 색상인지 text 출력
   function setColorName(color) {
       $("#colorNameContent").html(color);
   } // end setColorName
   
	// 사이즈 SET
   function setSize(t){
      check_size = 1
      $("#cartsize").val(t);
   } // end setSize
   
	// 수량 마이너스 버튼 클릭 시 수량 감소
   function setMinus(pprice){
      var total = $("#amount").val();
      total = total - 1   
      if (total == 0){
         total = 1
      }
      
      $("#amount").val(total);
      $("#cartamount").val(total);
      $("#sumPrice").text('₩' + total*pprice);
   } // end setMinus
   
	// 수량 플러스 버튼 클릭 시 수량 증가
   function setPlus(pprice){
      var total = parseInt($("#amount").val());
      if (total == 10){
         total = 1   
      }
      total = total + 1
      
      $("#amount").val(total);
      $("#cartamount").val(total);
      $("#sumPrice").text('₩' + total*pprice);
   } // end setPlus
   
   // 장바구니 담기
   function go_cart(member){
      if (member == 'a'){
         alert("로그인 부터 해주세요.");
      }
      else{
         if (check_size == 0){
            alert('사이즈 선택해주세요');   
         }
         else{
            $("#ProductForm").attr("action", "${root}/product/insertBag").submit();   
         }
      }   
   } // end go_cart

</script>


</head>
<body>

   <div id="bodyWrap" class="item_detail">
      <div class="adaptive_wrap">
         <div class="clearfix prd_detail1905" id="clearfix">
            <div class="clearfix image_view3">
               <div class="image_view1" id="image_view1">
                  <div class="item_visual" id="imageDiv" style="margin-top: 20px;">
                  		<%-- 장바구니에 담을 정보 Form (hidden) --%>
                        <form id = "ProductForm" action="" name = "ProductForm" method ="post">
                           <input type="hidden" name = "id" id = "id" value = "${member.id}">
                           <input type="hidden" name = "pcode" id = "pcode" value = "${productDetail.pcode}"> <!-- ok -->
                           <input type="hidden" name = "cartsize" id = "cartsize" value = "test"> <!-- ok -->
                           <input type="hidden" name = "cartcolor" id = "cartcolor" value = "${fn:split(productDetail.pcolor, ',')[0]}"> <!-- ok -->
                           <input type="hidden" name = "cartamount" id = "cartamount" value = "1"> <!-- ok -->
                           <input type="hidden" name = "cartregdate" id = "cartregdate" value = "2022-02-02">
                           <input type="hidden" name = "cartenabled" id = "cartenabled" value = "Y">
                           <input type="hidden" name = "cartcolorurl" id = "cartcolorurl" value = "${fn:split(productDetail.imgUrl2, ',')[0]}">
                        </form>
                     <ul id="ul_img">
                        <%-- 상품 상세 이미지 --%>
                        <li><img
                           src="${fn:split(productDetail.imgUrl2, ',')[0]}"
                           class="respon_image"
                           onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'"></li>
                        <li><img
                           src="${fn:split(productDetail.imgUrl3, ',')[0]}"
                           class="respon_image"
                           onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'"></li>

                        <li><img
                           src="${fn:split(productDetail.imgUrl4, ',')[0]}"
                           class="respon_image"
                           onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'"></li>

                        <li><img
                           src="${fn:split(productDetail.imgUrl5, ',')[0]}"
                           class="respon_image"
                           onerror="this.src='http://cdn.thehandsome.com/_ui/desktop/common/images/products/no_img1.jpg'"></li>
                     </ul>
                  </div>
               </div>
            </div>

            <div class="item_detail_info float_right" id="contentDiv"
               style="margin-top: 20px; top: 0px; left: 699px;">
               <div class="info">
                  <div class="info_sect">
                     <h4 class="item_name">
                        <div class="brand-name">
                           <a href="javascript:fn_goCategori('br32')"
                              onclick="GA_Detail('brand',$(this))">${productDetail.pbrand}</a>
                        </div>
                        <span class="name ko_fir_spel"> ${productDetail.pname}<input
                           type="hidden" id="brandName" value="FOURM MEN'S LOUNGE">
                           <input type="hidden" id="productName"
                           value="[ORDINARY FITS] 턱 데님 재킷"> <input type="hidden"
                           id="productCode" value="HS2C3NJC002MOF_BL">
                        </span>
                     </h4>

                     <div class="flag"></div>

                     <p class="price">
                        <span>₩${productDetail.pprice}</span> <input type="hidden" id="productPrice"
                           value="488000">
                     </p>
                     <!-- 상품추가설명 -->
                     <p class="selling_point"></p>
                     <!-- 20200914이후 추가 상품설명 (신) -->
                     <div class="prod-detail-con-box">
                        <strong class="number-code">상품품번 : <span>${productDetail.pcode}</span></strong>
                        <div class="round-style">
                           <p>${productDetail.pcontent}</p>
                        </div>
                        <div class="fit-info">
                           <p class="size-text">

                              - ORDINARY FITS는 '10년 후에도 입고 있고 싶은 옷'을 컨셉으로 데님의 산지 오카야마 현
                              코지마에서 2008년에 설립한 브랜드입니다.<br>- 피팅 정보 : 187cm, 100 사이즈 모델이
                              105 사이즈 착용
                           </p>
                        </div>
                     </div>
                     
                  </div>

                  <div class="info_sect">
                     <ul class="point_delivery">
                        <li><span class="title">한섬마일리지</span> <span class="txt">24,400&nbsp;M&nbsp;(5%)</span>
                        </li>

                        <li><span class="title">H.Point</span> <span class="txt">488&nbsp;P&nbsp;(0.1%)</span>
                           <a href="javascript:fn_cardBenefit();" id="cardbenef"
                           class="etc_info" onclick="GA_Event('상품_상세','카드사_혜택안내','클릭');">카드사
                              혜택안내</a></li>

                        <li><span class="title">배송비</span> <span class="txt">30,000원
                              이상 무료배송 (실결제 기준)</span> <a href="javascript:fn_popupDelivery();"
                           class="etc_info" onclick="GA_Event('상품_상세','배송안내','클릭');">배송안내</a>

                        </li>
                     </ul>
                  </div>

                  <div class="info_sect">
                     <ul class="color_size_qty">
                        <li><span class="title">색상</span>
                           <div class="txt">
                              <ul class="color_chip clearfix">
                                 <input type="hidden" id="colorName" value="BLUE">
                                 <c:set var = "clist" value = "${fn:split(productDetail.colorUrl, ',')}"></c:set>
                                 <%-- 색상이 여러 개 이면 여러 개 활용 --%>
                                 <c:forEach var = "i" begin = "0" end = "${fn:length(clist)-1}">
                                    <li id="HS2C3NJC002MOF_BL">
                                       <a href="javascript:void(0)"
                                       onclick="changeColor('${productDetail.pcode}', '${i}', '${fn:split(productDetail.pcolor, ',')[i]}', '${fn:split(productDetail.imgUrl2, ',')[i]}')"
                                       class="beige on"
                                       style="background: #2250a2 url(${fn:split(productDetail.colorUrl, ',')[i]}/24x24')"
                                       onmouseover="setColorName('${fn:split(productDetail.pcolor, ',')[i]}');"
                                       onmouseout="setColorName('');"></a>
                                    </li>
                                 </c:forEach>   
                              </ul>
                           </div> <span class="cl_name" id="colorNameContent"></span></li>
                        <li><span class="title">사이즈<!-- 사이즈 --></span> 
                        <span class="txt">
                           <c:set var = "size_list" value = "${fn:split(productDetail.psize, ',')}"></c:set>
                              <ul class="size_chip clearfix sizeChipKo1901">
                              	 <%-- 사이즈가 여러 개 이면 여러 개 활용 --%>
                                 <c:forEach var = "i" begin = "0" end = "${fn:length(size_list)-1}">
                                 <li id="HS2C3NJC002MOF_BL_100">
                                    <a href="javascript:void(0)"
                                    onclick="setSize(${size_list[i]});">${size_list[i]}</a>
                                 </li>
                                 </c:forEach>
                              </ul>
                           
                        </span> <!-- 2021.08.10 화장품 상품인 경우 사이즈조견표 영역 미노출 --> <a
                           href="javascript:fn_popupSizeQuickReference();"
                           class="etc_info" onclick="GA_Event('상품_상세','사이즈_조건표','클릭')">사이즈
                              조견표</a> <!-- 재입고알림 툴팁 --> <!-- //재입고알림 툴팁 --></li>
                        <li><span class="title">수량</span> <span class="txt">
                              <span class="qty_sel num"> <a
                                 href="javascript:void();" class="left" onclick = "setMinus('${productDetail.pprice}');">이전 버튼</a>
                                 <input type="text" name = "amount" id="amount" title="수량" value="1"
                                 class="mr0" readonly="readonly"> <a
                                 href="javascript:void();" class="right" onclick = "setPlus('${productDetail.pprice}');">다음 버튼</a>
                           </span>
                        </span> <input type="hidden" id="erpWorkOrderNumber"> <input
                           type="hidden" id="reserveSalesStockpile"> <input
                           type="hidden" id="erpWorkOrderProdCode"></li>
                     </ul>
                  </div>
                  <div class="total_price clearfix">
                     <div class="title float_left" style="width: auto;">총 합계</div>
                     <div class="pirce float_right">
                        <span id="sumPrice">₩${productDetail.pprice}</span>
                     </div>
                  </div>
                  <!-- st_receipt_wrap -->
                  <!-- //st_receipt_wrap -->

                  <!-- st_store_wrap -->
                  <div class="st_store_wrap1807" id="storePickupChoice"
                     style="display: none;">
                     <div class="st_store">
                        <dl>
                           <dt>선택 매장</dt>
                           <dd>
                              <p id="storePickupChoiceName"></p>
                              <p id="storePickupChoiceAddress"></p>
                              <p id="storePickupChoiceTelephone"></p>
                           </dd>
                           <dt>수령 신청일</dt>
                           <dd>
                              <p id="storePickupChoiceDate"></p>
                           </dd>
                        </dl>
                        <a href="javascript:fn_popupStorePickUp();" class="btn">매장변경</a>
                     </div>
                     <ul class="bul_sty01_li">
                        <li>매장 수령 시 상품 사이즈 및 컬러 변경은 불가합니다.</li>
                        <li>수령 가능 확정 일은 주문 완료 후, 수령 교환권을 SMS로 안내 드립니다.</li>
                        <li>수령 확정일로부터 <span style="color: #fe4242;">1일 경과 후
                              상품을 수령하지 않으시면 자동 취소</span> 됩니다.
                        </li>
                     </ul>
                  </div>
                  <!-- //st_store_wrap -->
                  <div class="btnwrap clearfix"
                     style="position: absolute; width: 473px; margin-top: 0px; margin-bottom: 0px;">
                     <input type="button" value=""
                        class="btn wishlist1803 float_left ml0  "
                        onclick="addWishListClick();GA_Event('상품_상세','하단 고정 버튼','좋아요');">

                     <div class="toast_popup">
                        <p style="display: none; top: -4.12381px; opacity: 0.031172;">위시리스트에서
                           삭제했습니다.</p>
                     </div>

                     <div class="toast_popup_pre_order1905">
                        <p>
                           예약 주문이 가능한 옵션(컬러/사이즈)가 있습니다. <br>옵션 선택 후 배송 예정일을 확인해 주세요.
                        </p>
                        <span class="arr">위치아이콘</span>
                     </div>

                     <form id="addToCartForm" name="addToCartForm"
                        action="/ko/HANDSOME/MEN/OUTER/JACKET/%5BORDINARY-FITS%5D-%ED%84%B1-%EB%8D%B0%EB%8B%98-%EC%9E%AC%ED%82%B7/p/HS2C3NJC002MOF_BL?categoryCode=me031"
                        method="post">
                        <%-- 장바구니 담기 --%>   
                        <input type="button" value="쇼핑백 담기"
                           class="btn cart1803 float_left ml0" id="addToCartButton" onclick = "go_cart('a${member.id}');">
                        <div>
                           <input type="hidden" name="CSRFToken"
                              value="689c2c47-cd64-4dc4-9d85-0209ddafb108">
                        </div>
                     </form>
                     <input type="button" value="바로주문"
                        class="btn order float_right mr0" id="addToCartBuyNowButton"
                        onclick="GA_Event('상품_상세','하단 고정 버튼','바로주문');addToCart(true);">
                  </div>

                  <dl class="toggle_type1" style="margin-top: 80px;">
                     <dt class="">
                        <a href="javascript:void(0);" id="NEW_DETAIL_INFO_EVT">상품상세정보</a>
                     </dt>
                     
                     <dt class="">
                        <a href="javascript:void(0);" id="DETAIL_INFO_EVT">상품정보제공고시</a>
                     </dt>

                     <!-- 2021.08.10 화장품 상품인 경우 실측사이즈 영역 미노출 -->
                     <dt class="">
                        <a href="javascript:void(0);" id="REAL_SIZE_EVT">실측사이즈</a>
                     </dt>

                     <dt>
                        <a href="#" id="DELI_RETURN_EVT">배송 및 교환/반품</a>
                     </dt>

                     <!--상품평 btn-->
                     <div class="popup_customer_review1807" id="customerReview">
                        <a href="#;" onclick="GA_Event('상품_상세','정보','상품평');">상품평(<span
                           id="customerReviewCnt">0</span>)
                           <div class="star_score1807" id="prodTotalStarScoreWrapper"
                              style="display: none;">
                              <span class="cmt_star"> <!-- 별점에 따라 class명 변경 (star1, star2 ,star3, star4, star5) -->
                                 <span class="cmt_per" id="prodTotalStarScore">별점</span>
                              </span>
                           </div>
                        </a>
                     </div>
                     <!--//상품평 btn-->

                  </dl>
               </div>

               <div class="clearfix mt30">
                  <div class="btnwrap float_left">
                     <a href="javascript:fn_popupProductQnA();" class="btn arrow mr0"
                        onclick="GA_Event('상품_상세','Q&amp;A','클릭');">Q&amp;A(<span
                        class="data" id="productQnACnt">0</span>)
                     </a>
                  </div>
               </div>

               <input type="hidden" id="viewExhibitionPageCode" value="">
               <input type="hidden" id="viewExhibitionPageName" value="">

               <!-- 코디상품 start -->
               <div class="related_evt">
                  <div class="cd-n-lb-tab" id="codi_lookbook_tab" style="">
                     <ul>
                        <li class="on"><a href="#cd-n-lb-tab-01"
                           onclick="GA_Event('상품_상세','함께 코디한 상품','함께 코디한 상품');">함께 코디한
                              상품</a></li>
                     </ul>
                  </div>
                  <!-- box1 -->
                  <div class="cd-n-lb-content-box" id="cd-n-lb-tab-01"
                     style="display: block;">
                     <div class="matches_list together-codi-list"
                        id="referencesListContent">
                        <ul class="clearfix slides">
                           <li id="prod_HS2C3TTO043M73_WT" style="margin-right: 10px;">
                              <div class="together-codi-pic">
                                 <a href="javascript:goDetailPage('HS2C3TTO043M73_WT');"
                                    onclick="GA_Event('상품_상세','코디상품','[TSPTR] 프린팅 티셔츠');"
                                    class="pic"> <img
                                    src="http://newmedia.thehandsome.com/HS/2C/SS/HS2C3TTO043M73_WT_S01.jpg"
                                    alt="코디상품" class="respon_image">
                                 </a> <a href="#;" id="HS2C3TTO043M73_WTLIKE"
                                    class="add_wishlist HS2C3TTO043M73_WTLIKE like "
                                    onclick="addWishListProdClick('HS2C3TTO043M73_WT');GA_Event('스타일', '코다상품 좋아요', 'FOURM MEN&amp;#039;S LOUNGE_[TSPTR] 프린팅 티셔츠');">위시리스트
                                    담기</a>
                              </div> <span class="info_wrap item_info2"> <span
                                 class="brand BR32">FOURM MEN'S LOUNGE</span> <span
                                 class="title">[TSPTR] 프린팅 티셔츠</span> <span class="price">
                                    ₩135,000</span>
                           </span> <!-- 컬러칩 추가(20210614) -->
                              <div class="we-codi-colorchip">
                                 <ul class="color_chip clearfix">
                                    <input type="hidden" id="colorName" value="WHITE">
                                    <li id="chipbtn_HS2C3TTO043M73_WT"><input type="hidden"
                                       class="colorNameVal" value="WHITE"> <a href="#;"
                                       onclick="javascript:chngColorChip(this, 'HS2C3TTO043M73_WT','HS2C3TTO043M73_WT');"
                                       class="beige on"
                                       style="background: #ffffff url('http://newmedia.thehandsome.com/HS/2C/SS/HS2C3TTO043M73_WT_C01.jpg/dims/resize/24x24')"></a>
                                    </li>
                                 </ul>
                              </div> <!-- //컬러칩 추가(20210614) -->
                           </li>
                           <li id="prod_HS2C3WPQ011MTP_IV" style="margin-right: 10px;">
                              <div class="together-codi-pic">
                                 <a href="javascript:goDetailPage('HS2C3WPQ011MTP_IV');"
                                    onclick="GA_Event('상품_상세','코디상품','[PT01] 포켓 스트레이트 쇼츠');"
                                    class="pic"> <img
                                    src="http://newmedia.thehandsome.com/HS/2C/SS/HS2C3WPQ011MTP_IV_S01.jpg"
                                    alt="코디상품" class="respon_image">
                                 </a> <a href="#;" id="HS2C3WPQ011MTP_IVLIKE"
                                    class="add_wishlist HS2C3WPQ011MTP_IVLIKE like "
                                    onclick="addWishListProdClick('HS2C3WPQ011MTP_IV');GA_Event('스타일', '코다상품 좋아요', 'FOURM MEN&amp;#039;S LOUNGE_[PT01] 포켓 스트레이트 쇼츠');">위시리스트
                                    담기</a>
                              </div> <span class="info_wrap item_info2"> <span
                                 class="brand BR32">FOURM MEN'S LOUNGE</span> <span
                                 class="title">[PT01] 포켓 스트레이트 쇼츠</span> <span class="price">
                                    ₩335,000</span>
                           </span> <!-- 컬러칩 추가(20210614) -->
                              <div class="we-codi-colorchip">
                                 <ul class="color_chip clearfix">
                                    <input type="hidden" id="colorName" value="IVORY">
                                    <li id="chipbtn_HS2C3WPQ011MTP_IV"><input type="hidden"
                                       class="colorNameVal" value="IVORY"> <a href="#;"
                                       onclick="javascript:chngColorChip(this, 'HS2C3WPQ011MTP_IV','HS2C3WPQ011MTP_IV');"
                                       class="beige on"
                                       style="background: #fbfaea url('http://newmedia.thehandsome.com/HS/2C/SS/HS2C3WPQ011MTP_IV_C01.jpg/dims/resize/24x24')"></a>
                                    </li>
                                    <li id="chipbtn_HS2C3WPQ011MTP_NY"><input type="hidden"
                                       class="colorNameVal" value="NAVY"> <a href="#;"
                                       onclick="chngColorChip(this, 'HS2C3WPQ011MTP_IV','HS2C3WPQ011MTP_NY');"
                                       class="beige"
                                       style="background: #23416e url('http://newmedia.thehandsome.com/HS/2C/SS/HS2C3WPQ011MTP_NY_C01.jpg/dims/resize/24x24')"
                                       onmouseover="setColorName('NAVY');"
                                       onmouseout="setColorName('');"></a></li>
                                 </ul>
                              </div>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <!-- //box1 -->

                  <!-- box2 -->
                  <div class="cd-n-lb-content-box" id="cd-n-lb-tab-02">
                     <div class="detail-pg-lookbook-aside-box">
                        <!-- title-slide -->
                        <div class="title-slide-zone">
                           <div class="swiper-container">
                              <div class="swiper-wrapper"></div>
                           </div>
                        </div>

                        <div class="sub-slide-zone"></div>
                     </div>
                  </div>
               </div>
            </div>
         </div>

      </div>

   <style>
      #delQnAFile {
         display: inline;
         position: absolute;
         top: 9px;
         right: 115px;
      }
      
      #textQnAFile {
         padding: 0 30px 0 6px;
         width: calc(100% - 24px);
         text-overflow: ellipsis;
      }
   </style>
</div>
   <%@ include file="../footer.jsp"%>
</body>
</html>