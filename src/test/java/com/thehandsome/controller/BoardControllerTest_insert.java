// 작성자 : 차은채
// 기능 : 게시판 컨트롤러 - insert 테스트
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
@Log4j
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class BoardControllerTest_insert {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}//end setup
	
	
	@Test
	public void testRegister() throws Exception {
		
		String resultPage = mockMvc.perform(
				MockMvcRequestBuilders.post("/board/register")
				.param("title", "새글 테스트 제목")
				.param("qcontent", "테스트 새글 내용")
				.param("writerid", "123")
				.param("writedate", "2022-05-01")
				.param("postno", "123")
				).andReturn()
				.getModelAndView()
				.getViewName()
				;
		log.info(resultPage);
		
	}//end testreg
	

}//end class
