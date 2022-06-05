// 작성자 : 김승환
// 기능 : Product Service - 장바구니 getProduct 테스트
package com.thehandsome.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.ShoppingBagVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTest_getProduct {
	@Setter(onMethod_ = {@Autowired})
	private ProductService service;
	
	@Test
	public void testGetList() {
		service.getProduct().forEach(board -> log.info(board));		
	}//end test
	
	
	@Test public void testGetProduct() {
		for (ShoppingBagVO bagVO:service.getProduct()) { 
		   log.info(bagVO); 
		}//end for 
	  }//end testGetProduct
}
