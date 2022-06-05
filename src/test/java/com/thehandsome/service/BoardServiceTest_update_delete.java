// 작성자 : 차은채
// 기능 : 게시판 서비스 - remove, modify 테스트(글 삭제, 글 수정)
package com.thehandsome.service;

import static org.junit.Assert.assertNotNull;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.thehandsome.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest_update_delete {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	@Test
	public void testDelete() {
		//게시물의 번호 존재를 확인하고 테스트
		log.info("Remove RESULT..."+service.remove(2L));
		
	}//end test

	@Test
	public void testUpdate() {
		BoardVO board = service.get(4L);
		if(board == null) {
			return;
		}
		board.setTitle("제목 수정합니다.");
		log.info(""+service.modify(board));		
	}//end test
}//end clas
