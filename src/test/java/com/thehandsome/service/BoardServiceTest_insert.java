// 작성자 : 차은채
// 기능 : 게시판 서비스 - register 테스트(insert 글 등록)
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
public class BoardServiceTest_insert {
	
	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 제목3");
		board.setQcontent("새로 작성하는 글3");
		board.setWriterid("hdfive");
		board.setWritedate("2022-05-01");
		board.setPostno(12);
		service.register(board);
		log.info("생성된 게시물 번호 : "+board.getPostno());
	}//end test

}//end clas
