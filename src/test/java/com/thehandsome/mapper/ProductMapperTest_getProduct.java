// 작성자 : 김승환
// 기능 : Product Mapper - getProduct 테스트
package com.thehandsome.mapper;

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
public class ProductMapperTest_getProduct {
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Test
	public void testGetProduct() {
		mapper.getProduct().forEach(shVO -> log.info(shVO));		
	}//end testGetProduct

	@Test
	public void testGetProduct2() {
		for(  ShoppingBagVO  shVO:mapper.getProduct() ) {
			log.info(shVO);
		}
	}//end testGetProduct2
}//end class
