// 작성자 : 김승환
// 기능 : Product Mapper - getList 테스트(페이징 정보를 담고 있는 상품 리스트 불러오기)
package com.thehandsome.mapper;

import java.util.List;

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
public class ProductMapperTest_list {
	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		
		List<ProductListVO> list = mapper.getList(cri);
		
		list.forEach(board -> log.info(board));
		
		for ( ProductListVO i : list){
			log.info(i);
		}//end for

		
	}//end testGetList
}
