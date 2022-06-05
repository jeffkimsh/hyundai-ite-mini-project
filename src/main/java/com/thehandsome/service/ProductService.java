// 작성자 : 김승환
// 기능 : 상품 관리와 관련해서 어떤 기능을 수행할 것인지 알려주는 서비스 인터페이스
package com.thehandsome.service;

import java.util.List;

import com.thehandsome.domain.Criteria;
import com.thehandsome.domain.ProductDetailVO;
import com.thehandsome.domain.ProductListVO;
import com.thehandsome.domain.ShoppingBagVO;

public interface ProductService {
	// 상품 리스트 불러오기
	public List<ProductListVO> getList(Criteria cri);
	
	// 상품 상세 정보들 불러오기
	public ProductDetailVO getDetail(String pcode);
	
	// 장바구니에 담을 때 같은 상품이면 update, 다른 상품이면 insert
	public void insertProduct(ShoppingBagVO bagVO);
	
	// 장바구니에 담겨있는 상품들 불러오기
	public List<ShoppingBagVO> getProduct();
	
	// 장바구니에 담겨있는 상품들의 총 가격 합계 불러오기
	public ShoppingBagVO getTotalPrice(String id);
	
	// 상품 수량 변경 후 update
	public void updateAmount(ShoppingBagVO bagVO);
	
	// 장바구니에 담겨진 상품을 삭제
	public void deleteProduct(ShoppingBagVO bagVO);
} // end class
