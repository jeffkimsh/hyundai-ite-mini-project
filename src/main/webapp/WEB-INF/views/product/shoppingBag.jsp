<!-- 
작성자 : 김승환
기능 : 쇼핑백 (장바구니) 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>

<%@include file="/component/script.jsp"%>

<meta charset="UTF-8">	
<title>쇼핑백 | 더한섬닷컴</title>

<script type="text/javascript">
	var result = 0;
	
	// 채크 박스 체크 여부 확인, 체크 시 가격 업데이트
	function check(index, sprice){
		if($('#cart_checkbox'+index).is(':checked')){
			result += parseInt(sprice);
			$("#cartDataSubtotal").text('₩'+ result);
			 $("#cartDataTotalPrice").text('₩'+ result);
		}else{
			result -= parseInt(sprice);
			$("#cartDataSubtotal").text('₩'+ result);
			$("#cartDataTotalPrice").text('₩'+ result);
		}
	} // end check
	
	// 상단 체크 박스 클릭 시, 전체 체크 박스 체크된 상태로 가격도 업데이트
	function is_checked() {
	  const checkbox = document.getElementById('entryCheckAll');
	  const is_checked = checkbox.checked;

	  console.log(is_checked);
	  
	  if(is_checked == true){
		 $("input:[id^='cart_checkbox']").attr("checked", true);
		 totalPrice();
	  }else{
		  $("input:[id^='cart_checkbox']").attr("checked", false);
		  $("#cartDataSubtotal").text('₩'+ 0);
		  $("#cartDataTotalPrice").text('₩'+ 0);
		  result = 0
	  }
	  
	} // e
	
	// 총 가격 합계 불러오기
	function totalPrice(){
		$.ajax({
			url :'/product/getTotalPrice',
			type : 'POST',
			data: {"member": "admin"},
			dataType: 'json',
			success : function(res) {
				console.log(res.total);
				result = res.total;
				$("#cartDataSubtotal").text('₩'+res.total);
				$("#cartDataTotalPrice").text('₩'+res.total);
				console.log($("#cartDataTotalPrice").text());
			},
			error : function(res){
				console.log(res);
				alert("no");
			}
		});
	} // end totalPrice
	
	// 수량 변경 시 업데이트
	function changeQuantity(index, cartno){
		var amount = $("#amount"+index).val();
		
		$.ajax({
			url :'/product/updateAmount',
			type : 'POST',
			data: {"cartno": cartno, "cartamount" : amount},
			dataType: 'json',
			async : false,
			success : function(res) {
				console.log(res);
				location.href = "/product/getProduct"
			},
			error : function(res){
				console.log(res);
				alert("no");
			}
		});
	} // end changeQuantity
	
	// 수량 마이너스 버튼 클릭 시 수량 감소
	function setMinus(index){
		var total = $("#amount"+index).val();
		total = total - 1	
		if (total == 0){
			total = 1
		}
		
		$("#amount"+index).val(total);

	} // end setMinus
	
	// 수량 플러스 버튼 클릭 시 수량 증가
	function setPlus(index){
		var total = parseInt($("#amount"+index).val());
		if (total == 10){
			total = 1	
		}
		total = total + 1
		
		$("#amount"+index).val(total);

	} // end setPlus
	
	// 상품 삭제
	function removeProduct(cartno){
		$.ajax({
			url :'/product/deleteProduct',
			type : 'POST',
			data: {"cartno": cartno},
			dataType: 'json',
			async : false,
			success : function(res) {
				console.log(res);
				location.href = "/product/getProduct"
			},
			error : function(res){
				console.log(res);
				alert("no");
			}
		});
	} // end removeProduct
</script>

</head>
<body>
	<%@include file="/WEB-INF/views/bag_header.jsp"%>
	<!-- Loading -->
	<div class="loading_bar" id="loadingBarDiv" style="display: none;">
		<img src="http://www.thehandsome.com/_ui/desktop/common/images/common/loading.gif" alt="loading">
		<span>�로딩중</span>
	</div>
	<!-- //Loading -->


	<!-- bodyWrap -->
	<div id="bodyWrap">
		<!--title-->
		<h3 class="cnts_title cnts_tlt1807">
			<span>쇼핑백</span>
		</h3>
		<!--//title-->

		<!-- 장바구니개편 -->
		<span id="shoppingbagCartView"> <!--sub_container-->
			<div class="sub_container ">
				<!--order wrap-->
				<div class="shopping_cart_tab1807 tab_a">
					<!-- 장바구니개편 -->
					<ul class="tab3">
						<li><a href="#;" name="cartDivision" data-division=""
							onclick="GA_Event('쇼핑백', '탭', '택배');" class="active"><span
								class="delt_ico"></span>택배</a></li>
						<li><a href="#;" name="cartDivision" data-division="store"
							onclick="GA_Event('쇼핑백', '탭', '매장수령');" class=""><span
								class="spt_ico"></span>매장수령</a></li>
						<li><a href="#;" name="cartDivision" data-division="quick"
							onclick="GA_Event('쇼핑백', '탭', '퀵배송                                           ');"
							class=""><span class="quk_ico"></span>퀵배송</a></li>
					</ul>
					<!-- //장바구니개편 -->
				</div>

				<div class="orderwrap1807">
					<div class="tbl_info_wrap">
						<p class="cart_top_text"></p>

						<div class="fourpm_pd_ck">
							<div class="input_wrap"></div>
						</div>
					</div>
					<!--shoppingbag table-->
					<div class="tblwrap">
						<table class="tbl_ltype">
							<caption>쇼핑백</caption>
							<colgroup>
								<col style="width: 10px;">
								<col>
								<col style="width: 120px">
								<col style="width: 105px">
								<col style="width: 140px">
								<col style="width: 110px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<!-- 2019.11.07 쇼핑백 진입 시 선택 상품 없도록 수정 --> 
										<input type="checkbox" id="entryCheckAll" onclick = "is_checked();" value="cartlist">
									</th>
									<th scope="col">상품정보</th>
									<th scope="col">수량</th>
									<th scope="col">판매가</th>
									<th scope="col">적립율</th>
									<th scope="col">선택</th>
								</tr>
							</thead>
							<tbody>
							<!-- 장바구니에 담긴 상품들 -->
							<c:forEach var="getProduct" items="${getProduct}" varStatus = "status">
								<tr name="entryProductInfo" data-pk="10686628790316"
									data-deliverykind="" data-outofstock="false"
									data-category="ME031">
									<td class="frt">
										<input
										type="checkbox" id = "cart_checkbox${status.index}" name="cartlist" onclick = "check('${status.index}', '${getProduct.sprice}')" 
										data-pk="10686628790316"
										data-division="" data-deliverykind="" value="0">
									</td>
									<td class="pt_list_wrap">
										<!-- pt_list_all -->
										<div class="pt_list_all">
											<a
												href="/ko/HANDSOME/MEN/OUTER/JACKET/%EC%9A%B8-%EB%B8%94%EB%A0%8C%EB%93%9C-%EC%8A%A4%ED%8A%B8%EB%A0%88%EC%B9%98-%EC%9E%AC%ED%82%B7/p/TH2C5WJC056M_BK_100"
												onclick="javascript:setEcommerceData('0', 'Click ADD');GA_Event('쇼핑백','상품','울 블렌드 스트레치 재킷');">
												<img
												src="${fn:replace(fn:replace(getProduct.cartcolorurl, '_W', '_S'),'/dims/resize/684x1032/', '')}"
												alt="">
											</a>
											<div class="tlt_wrap">
												<a
													href="/ko/HANDSOME/MEN/OUTER/JACKET/%EC%9A%B8-%EB%B8%94%EB%A0%8C%EB%93%9C-%EC%8A%A4%ED%8A%B8%EB%A0%88%EC%B9%98-%EC%9E%AC%ED%82%B7/p/TH2C5WJC056M_BK_100"
													class="basket_tlt"
													onclick="javascript:setEcommerceData('0', 'Click ADD');GA_Event('쇼핑백','상품','울 블렌드 스트레치 재킷');">
													<span class="tlt">${getProduct.pbrand}</span> <span class="sb_tlt">
														${getProduct.pname }</span>
												</a>

												<p class="color_op">

													color : ${getProduct.cartcolor} <span class="and_line">/</span> size : ${getProduct.cartsize }
												</p>

											</div>
										</div> <!-- //pt_list_all-->
									</td>
									<td class="al_middle">
										<form id="updateCartForm0"
											data-cart="{&quot;cartCode&quot; : &quot;372776418&quot;,&quot;productPostPrice&quot;:&quot;790000.0&quot;,&quot;productName&quot;:&quot;울 블렌드 스트레치 재킷&quot;}"
											action="/ko/shoppingbag/update" method="post">
											
											<!-- qty_sel -->
											<span class="qty_sel num"> <a href="#none"
												class="left" onclick="setMinus('${status.index}');">이전 버튼</a>
												<input id="amount${status.index}" name="amount" type="text"
												class="mr0" value="${getProduct.cartamount}"><a
												href="#none"
												class="right" onclick="setPlus('${status.index}');">다음
													버튼</a>
											</span>
											<!-- //qty_sel -->
											<a href="#none" id="QuantityProduct${status.index}"
												onclick = "changeQuantity('${status.index}', '${getProduct.cartno}');" class="btn wt_ss qty_w mr0">변경</a>
											<div>
												<input type="hidden" name="CSRFToken"
													value="dee7161b-559f-44f5-98e8-08fdc56bce29">
											</div>
										</form>
									</td>
									<td class="al_middle">
										<!-- Price -->
										<div class="price_wrap">
											<span>₩${getProduct.sprice}</span>
										</div> <!-- //Price -->
									</td>
									<td class="al_middle"><span class="earn">5%
											(한섬마일리지)</span> <br> <span class="earn">0.1% (H.Point)</span></td>
									<td class="al_middle">
										<!-- Button size -->
										<div class="btn_wrap">
											<a href="#none"
												id="RemoveProduct${status.index}" class="btn wt_ss"
												onclick="removeProduct('${getProduct.cartno}')">삭제</a>
										</div> <!-- //Button size -->
									</td>
								</tr>
							</c:forEach>
								<!-- Info wrap -->
								<tr>
									<td colspan="6" class="basket_wrap">
										<!-- Info -->
										<div class="basket_info">
											<span class="btn_arr">위치아이콘</span>
											<div class="info">
												<!-- Products -->
												<div class="pt_list" id="pt_list_0"></div>
												<!-- //Products -->
												<!-- btns -->
												<div class="btns">
													<a href="#none" class="btn wt_ss mr0" id="UpdateCart_0">변경</a>
													<a href="#none" class="btn wt_ss mt10 mr0"
														id="optCancelLayer_0">취소</a> <a href="#none"
														class="btn_close" id="optCloseLayer_0">닫기</a>
												</div>
												<!-- //btns -->
											</div>
										</div> <!-- //Info -->
									</td>
								</tr>
								<tr>
									<td colspan="6" class="basket_wrap"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--// shoppingback table-->
					<!--Total wrap-->
					<div class="total_wrap">
						<!-- total -->
						<div class="total_price_wrap">
							<dl>
								<dt>상품 합계</dt>
								<dd>
									<span id="cartDataSubtotal" value = "0">₩0</span>
								</dd>
								<dt class="delch_wrap">
									<p class="tlt_ship">배송비</p>
									<!--delivery charge layer popup-->
									<div class="delch_box" style="display: none;">
										<span class="arr">위치아이콘</span>
										<ul class="bul_sty01_li">
											<li>쿠폰/바우처 할인금액 및 한섬마일리지/H.Point 사용을 제외한 실 결제금액 기준 <strong>3만원
													미만 결제 시 2,500원 배송비가 부과</strong> 됩니다.(3만원 이상 구매 시 무료배송)
											</li>
											<li>도서산간 지역은 배송비가 추가 될 수 있습니다.</li>
											<li>한섬마일리지, H.Point, e-money로 배송비 결제가 불가합니다.</li>
										</ul>
									</div>
									<!--//delivery charge layer popup-->
								</dt>
								<dd>
									<span id="cartDataDeliveryCost">₩0</span>
								</dd>
							</dl>
							<dl class="total ">
								<dt>합계</dt>
								<dd>
									<span id="cartDataTotalPrice">₩0</span>
								</dd>
							</dl>
						</div>
						
					</div>
					<!--button wrap-->
					<div class="btnwrap order" id="checkout_btn_wrap">
						<a href="#;"
							onclick="checkoutPage();"> <input value="선택상품 주문하기"
							class="btn gray mr0" type="button">
						</a>
					</div>
				</div>
			</div> 
		</span>



		<!--Guide table-->
		<div class="gd_wrap mt60">
			<dl class="shoppingbag_list">
				<dt>쇼핑백 이용안내</dt>
				<dd class="shoppingbag_list_text">
					<ul class="bul_sty01_li">
						<li id="infoAddN1">4PM 상품은 오후 4시 이전에 주문 하셔야 다음날 배송이 가능하며 재고가
							소진될 경우 일반택배로 주문하실 수 있습니다.</li>
						<li id="infoAddN2">3만원 구매 시 무료 배송됩니다. 3만원 미만 구매 시 배송비 2,500원이
							추가되며, 도서산간 지역으로 배송을 원하실 경우<br>배송비가 추가될 수 있습니다.
						</li>
						<li>쇼핑백에 담긴 상품은 30일 동안 보관됩니다. 30일이 지난 상품 자동 삭제됩니다.<br>더
							오래 보관하고 싶은 상품은 위시리스트에 담아주세요.
						</li>
						<li>쇼핑백에 최대 50개까지 상품 보관이 가능하며, 실제 구매 시에는 가격이나 혜택이 변동될 수 있습니다.</li>

						<li>쇼핑백에 담은 상품이 판매종료가 되었을 경우 자동 삭제 됩니다.</li>
						<li>쿠폰은 배송&amp;결제정보 화면에서 입력 할 수 있습니다.</li>
						<li>상품별 지급율에 따라 한섬마일리지 및 H.POINT가 적립됩니다. 배송완료 10일 이후 적립되며 실
							결제금액기준입니다.</li>
						<li>해외 배송을 원할 경우 더한섬닷컴의 영문 혹은 중문 서비스를 이용해 주시기 바랍니다.</li>
						<li></li>
					</ul>
				</dd>
			</dl>

		</div>
	</div>
</body>
<!-- //bodyWrap -->