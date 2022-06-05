// 작성자 : 김승환
// 기능 : Product 서비스 - getList 테스트(페이징 정보를 담고있는 상품리스트 목록)
package com.thehandsome.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.Criteria;
import com.thehandsome.domain.ProductListVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTest_list {
	@Setter(onMethod_ = {@Autowired})
	private ProductService service;
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(1,8)).forEach(plVO -> log.info(plVO));		
	}//end testGetList
	
	@Test
	public void testGetList2() {
		for (ProductListVO plVO:service.getList(new Criteria(1,8))) { 
			   log.info(plVO); 
		  }//end for 		
	}//end testGetList2	 	
}// end class
