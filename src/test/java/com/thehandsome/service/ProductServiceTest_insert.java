// 작성자 : 김승환
// 기능 : Product Service - 장바구니 insert 테스트
package com.thehandsome.service;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.ShoppingBagVO;
import com.thehandsome.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTest_insert {
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Test
	public void testInsertBag() {
		Date date = new Date();

        long timeInMilliSeconds = date.getTime();
        java.sql.Date date1 = new java.sql.Date(timeInMilliSeconds);
        
		ShoppingBagVO shVO = new ShoppingBagVO();
		shVO.setPcode("MO02");
		shVO.setId("team5");
		shVO.setCartsize("100");
		shVO.setCartcolor("GREY");
		shVO.setCartamount(4);
		shVO.setCartregdate(date1);
		shVO.setCartenabled("Y");
		shVO.setCartcolorurl("test");
	
		mapper.insertProduct(shVO);
		log.info(shVO);
	}//end testInsertBag
}// end class
