// 작성자 : 차은채
// 기능 : 게시판 Mapper - getTotalCount 테스트 (조건에 따른 검색어의 글 갯수 확인)
package com.thehandsome.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests_getTotalCount {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Test
	public void testTotalCount() {
		Criteria cri = new Criteria();
		cri.setKeyword("ss"); ;
		cri.setType("") ;
		log.info("Total COUNT: " +mapper.getTotalCount(cri));
	}//end testP		
		
	@Test
	public void testTotalCount2() {
		Criteria cri = new Criteria();
		cri.setKeyword("ss"); ;
		cri.setType("T") ;
		log.info("Total COUNT: " +mapper.getTotalCount(cri));
	}//end testP		
	
	@Test
	public void testTotalCount3() {
		Criteria cri = new Criteria();
		cri.setKeyword("ss"); ;
		cri.setType("TC") ;
		log.info("Total COUNT: " +mapper.getTotalCount(cri));
	}//end testP		
	
	@Test
	public void testTotalCount4() {
		Criteria cri = new Criteria();
		cri.setKeyword("ss"); ;
		cri.setType("TCW") ;
		log.info("Total COUNT: " +mapper.getTotalCount(cri));
	}//end testP		
	
	
	
}//end class
