// 작성자 : 차은채
// 기능 : 게시판 서비스 - getList 테스트(페이징 정보를 담고있는 글 목록)
package com.thehandsome.service;

import static org.junit.Assert.assertNotNull;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.BoardVO;
import com.thehandsome.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest_listWithPaging {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(1,10)).forEach(board -> log.info(board));		
	}//end test
	
	@Test
	public void testGetList2() {
		for (BoardVO board:service.getList(new Criteria(1,10))) { 
			   log.info(board); 
		  }//end for 		
	}//end test	 	

}//end class
