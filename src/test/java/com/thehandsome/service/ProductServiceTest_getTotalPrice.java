// 작성자 : 김승환
// 기능 : Product Service - getTotalPrice 테스트
package com.thehandsome.service;

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
public class ProductServiceTest_getTotalPrice {
	@Setter(onMethod_ = @Autowired)
	private ProductService service;
	
	@Test
	public void testGetTotalPrice() {
		service.getTotalPrice("MO02");
	}//end testGetTotalPrice
}// end class
