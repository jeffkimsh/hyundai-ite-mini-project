// 작성자 : 김승환
// 기능 : Product Service - updateAmount 테스트
package com.thehandsome.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.ShoppingBagVO;
import com.thehandsome.mapper.ProductMapper;
import com.thehandsome.mapper.ProductMapperTest_update;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTest_update {
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@Test
	public void testUpdateAmount() {
		ShoppingBagVO bagVO = new ShoppingBagVO();
		bagVO.setCartamount(4);
		bagVO.setCartno(3);
		service.updateAmount(bagVO);
	}//end testUpdateAmount
}
