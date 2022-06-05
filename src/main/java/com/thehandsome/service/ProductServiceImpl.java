//작성자 : 김승환
//기능 : ProductService를 implements하여 데이터베이스 관련해서 어떤 기능을 수행해야할지 mapper와 연결한다.
package com.thehandsome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.domain.Criteria;
import com.thehandsome.domain.ProductDetailVO;
import com.thehandsome.domain.ProductListVO;
import com.thehandsome.domain.ShoppingBagVO;
import com.thehandsome.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService{
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	// 상품 리스트 불러오는 mapper 호출
	@Override
	public List<ProductListVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getList(cri);
	}
	
	// 상품 상세 정보 불러오는 mapper 호출
	@Override
	public ProductDetailVO getDetail(String pcode) {
		// TODO Auto-generated method stub
		return mapper.getDetail(pcode);
	}
	
	// 장바구니에 같은 상품이 있으면 update, 없으면 insert 해주는 mapper 호출
	@Override
	public void insertProduct(ShoppingBagVO bagVO) {
		// TODO Auto-generated method stub
		mapper.insertProduct(bagVO);
	}
	
	// 장바구니에 있는 상품 정보들을 불러오는  mapper 호출
	@Override
	public List<ShoppingBagVO> getProduct() {
		// TODO Auto-generated method stub
		return mapper.getProduct();
	}
	
	// 장바구니 안에 있는 상품들의 총 가격 합계를 불러오는 mapper 호출
	@Override
	public ShoppingBagVO getTotalPrice(String id) {
		// TODO Auto-generated method stub
		return mapper.getTotalPrice(id);
	}
	
	// 상품 수량 변경 후 update 해주는 mapper 호출
	@Override
	public void updateAmount(ShoppingBagVO bagVO) {
		// TODO Auto-generated method stub
		mapper.updateAmount(bagVO);
	}
	
	// 장바구니 안에 있는 상품을 상제할 수 있는 mapper 호출
	@Override
	public void deleteProduct(ShoppingBagVO bagVO) {
		// TODO Auto-generated method stub
		mapper.deleteProduct(bagVO);
	}

} // end class
