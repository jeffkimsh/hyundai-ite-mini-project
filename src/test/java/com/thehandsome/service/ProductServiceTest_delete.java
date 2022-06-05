// 작성자 : 김승환
// 기능 : Product Service - deleteProduct 테스트
package com.thehandsome.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.ShoppingBagVO;
import com.thehandsome.mapper.ProductMapper;
import com.thehandsome.mapper.ProductMapperTest_delete;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTest_delete {
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@Test
	public void testDeleteProduct() {
		ShoppingBagVO bagVO = new ShoppingBagVO();
		bagVO.setCartno(3);
		service.deleteProduct(bagVO);
	}//end testDeleteProduct
}//end class
