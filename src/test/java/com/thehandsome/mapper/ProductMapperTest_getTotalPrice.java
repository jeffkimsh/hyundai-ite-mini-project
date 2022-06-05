// 작성자 : 김승환
// 기능 : Product Mapper - getTotalPrice 테스트
package com.thehandsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTest_getTotalPrice {
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Test
	public void testGetTotalPrice() {
		mapper.getTotalPrice("MO02");
	}//end testGetTotalPrice
}//end class
