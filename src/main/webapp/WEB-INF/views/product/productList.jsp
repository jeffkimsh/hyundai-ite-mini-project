<!-- 
작성자 : 김승환
기능 : 상품 리스트 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!-- 최상단의 경로를 좀 더 편리하고, 수정시에도 경로가 어디인지 헷갈리지 않도록 변수 값에 저장해주었다. -->
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp"%>
<%@include file="/component/script.jsp"%>
<title>더한섬닷컴</title>

	<script type="text/javascript">	
		// 같은 상품에 다른 색상을 클릭하면 해당 색상의 이미지로 전환
		function changeColor(cindex, pcode, status){
			$.ajax({
				url :'/product/productDetail2',
				type : 'POST',
				data: {"pcode": pcode},
				dataType: 'json',
				success : function(res) {
					
					console.log(res);
					
					var html = '';
					
					html += '<img src = "' + res.imgUrl1.split(',')[status] + '"' + '>';
					console.log(html);
					
					$("#s_img"+cindex).html(html); 		
				},
				error : function(res){
					console.log(res);
					alert("no");
				}
			});
		} // end changeColor

	</script>
</head>
<body>
	<script type="text/javascript" src="//static.criteo.net/js/ld/ld.js"
		async="true"></script>
	<div id="bodyWrap" class="products">
		<!-- 클롭 모나코 팝업 -->
		<div id="mainPopwrap1"></div>
		<!-- 클롭 모나코 팝업 -->
		<!--title-->
		<!-- #1141 - 카테고리 개편(카테고리/브랜드 Navigation) -->
		<h3 class="cnts_title ou1804">
			<span> <!-- 정상 브랜드 카테고리 목록 --> <a href="/ko/c/ME/"
				onclick=""> 남성</a> <img
				src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/ou_location_arr.png"
				alt="location arr"> <a href="/ko/c/ME03/"
				onclick=""> 아우터</a> <img
				src="http://cdn.thehandsome.com/_ui/desktop/common/images/products/ou_location_arr.png"
				alt="location arr"> <a href="javascript:void(0);"
				onclick=""> 재킷</a>
			</span>
		</h3>
		<div class="adaptive_wrap">

			<form id="categoryListForm" action="/ko/c/categoryList">

				<input type="hidden" id="rememberPage" name="rememberPage" value="">
				<input type="hidden" id="FKD-001_015" value="컬러 더보기">

				<!-- sort wrap -->
				<div class="filterWrap hsDelivery1902">
					<ul class="clearfix float_left">
						<!-- 정상용 브랜드 검색 -->
						<li class="brand"><a href="javascript:void(0);"
							class="select" onclick="">브랜드<span
								class="ico_arr">arrow</span></a></li>
						<li class="color"><a href="#" class="select"
							onclick="">색상<span
								class="ico_arr">arrow</span></a></li>
						<li class="size"><a href="#" class="select"
							onclick="">사이즈<span
								class="ico_arr">arrow</span></a></li>
						<li class="price"><a href="#" class="select"
							onclick="">가격<span
								class="ico_arr">arrow</span></a></li>

						<li class="sortby"><a href="#" class="select"
							onclick="">정렬순<span
								class="current">신상품</span><span class="ico_arr">arrow</span></a></li>
						<li class="prd_list_filter1810 sale_filter">
							<div class="input_wrap">
								<input type="checkbox" id="checkSale" name="checkSale"
									onclick="setCheckSaleCode();"
									style="margin: 3px 10px 0 0;"><label for="checkSale"
									id="checkSale" style="color: #ff0000;">SALE</label>
							</div>
						</li>
						<li class="prd_list_filter1810 delivery" style="display: none">
							<div class="input_wrap">
								<input type="checkbox" id="checkDelivery" name="checkDelivery"
									onclick="sethsDeliveryCode();"><label
									for="checkDelivery" id="hsDelivery">한섬딜리버리</label>
							</div> <img
							src="http://cdn.thehandsome.com/_ui/desktop/common/images/common/ico_quest.png"
							alt="한섬딜리버리란?" class="tlt" onmouseover="onMouseOverRecommend();"
							onmouseout="onMouseOutRecommend();">
							<div class="rmd_pb_popup" style="display: none;">
								<p>4PM, 퀵배송이 가능합니다.</p>
								<span class="box_arr"></span>
							</div>
						</li>
						<li class="btn"><a href="javascript:reset();"
							onclick="">초기화</a><a
							href="javascript:gubunSearch(1);"
							onclick="">적용</a></li>
					</ul>
					<div class="items_count float_right">
						<span class="num">48</span> <span>전체</span>
					</div>
				</div>
			</form>
			<!-- sort wrap -->
			<div class="items_list cate_item4" id="listContent"
				style="display: block;">
				<c:if test="${productList.size() != 0}">
					<ul class="clearfix" id="listBody">
						<!-- 상품이 여러 개 일 경우 여러 개 출력 -->
						<c:forEach var="product" items="${productList}" varStatus = "status">
							<li>
								<div class="item_box">
									<a href="/product/productDetail?pcode=${product.pcode}" class="item_info1" 
										onclick="setEcommerceData('0', 'CATEGORY');"> 
										<span class="item_img" id = "s_img${status.index}"> 
											<img src="${fn:split(product.imgUrl1, ',')[0]}">
										</span>
									</a> <a href="/ko/p/HS2C3NJC002MOF_BL?categoryCode=me031"
										class="item_info2"
										onclick="setEcommerceData('0', 'CATEGORY');"> <span
										class="brand">${product.pbrand}</span> <span class="title">${product.pname}</span>
										<span class="price">
											<span id="price_HS2C3NJC002MOF_BL">
												<span>￦${product.pprice}</span>
											</span>
										</span>
										<span class="flag"> <span class="product">NEW</span>
									</span>
									</a>
									<div class="color_more_wrap">
									<c:set var = "clist" value = "${fn:split(product.colorUrl, ',')}"></c:set>
									<c:forEach var = "i" begin = "0" end = "${fn:length(clist)-1}">
										<a href="javascript:void(0);" class="cl wt"
											style="background: #2250a2 url(${fn:split(product.colorUrl, ',')[i]}13x14');"
											onclick="changeColor('${status.index}', '${product.pcode}', '${i}')"></a>
									</c:forEach> 
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
			<!-- 페이징 처리 -->
			<div class="paging" style="display: block;">
				<a class="prev2" href="/product/productList?pageNum=1&amount=8">처음 페이지로 이동</a><a
					href="/product/productList?pageNum=1&amount=8" class="prev">이전 페이지로 이동</a><span
					class="num">
					<a href="/product/productList?pageNum=1&amount=8" class="pageBtn" pagenum="1">1</a><a
					href="/product/productList?pageNum=2&amount=8" class="pageBtn" onclick = "pageclick();" pagenum="2">2</a></span><a
					href="/product/productList?pageNum=2&amount=8" class="next">다음 페이지로 이동</a><a
					href="/product/productList?pageNum=2&amount=8" class="next2">마지막 페이지로 이동</a>
			</div>

			<div class="sh_result none" id="searchResult_None"
				style="display: none;">조건에 맞는 상품 정보가 없습니다.</div>
		</div>

	</div>

	<%@ include file="../footer.jsp"%>
</body>
</html>