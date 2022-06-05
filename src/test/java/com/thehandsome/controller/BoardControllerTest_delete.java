// 작성자 : 차은채
// 기능 : 게시판 컨트롤러 - 글 삭제 테스트
package com.thehandsome.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class BoardControllerTest_delete {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
		
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
	}//end setup
	
	@Test
	public void testList() throws Exception {
		//삭제 테스트 전  DB에서 BOARD 조회에서 데이터 있는 지 확인
		String resultPage=
				mockMvc.perform(
				MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "6")
				).andReturn()
				.getModelAndView()
				.getViewName();
				
		log.info(resultPage);
		
	}//end testList
	
	

}//end class
