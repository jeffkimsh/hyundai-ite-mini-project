// 작성자 : 차은채
// 기능 : 게시판 Mapper - getListWithPaging 테스트 (조건에 따른 검색어처리가 적용되는지 확인)
package com.thehandsome.mapper;

import java.util.List;

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
public class BoardMapperTests_listWithSearch {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("ss"); ;
		cri.setType("") ;
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board.getPostno()));		
	}//end testP	
	
	@Test
	public void testSearch2() {
		Criteria cri = new Criteria();
		cri.setKeyword("ss"); ;
		cri.setType("T") ;
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board.getPostno()));		
	}//end testP	
	
	@Test
	public void testSearch3() {
		Criteria cri = new Criteria();
		cri.setKeyword("ss"); ;
		cri.setType("TC") ;
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board.getPostno()));		
	}//end testP	
	
	@Test
	public void testSearch4() {
		Criteria cri = new Criteria();
		cri.setKeyword("ss"); ;
		cri.setType("TCW") ;
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board.getPostno()));		
	}//end testP	
	
}//end class
