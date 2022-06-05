// 작성자 : 차은채
// 기능 : 게시판 Mapper - update 테스트(글 수정)
package com.thehandsome.mapper;

import java.util.List;

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
public class BoardMapperTests_update {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		//실행전 존재하는 번호인지 확인
		board.setPostno(2);
		board.setTitle("수정된 제목");
		board.setQcontent("수정된 내용");
		
		int count = mapper.update(board);
		log.info("Update COUNT" + count);
				
	}
	
}//end class
