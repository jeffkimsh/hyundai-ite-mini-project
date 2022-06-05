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
/* 작성자: 김연식
 * 가짜Mvc구조인 mockup을 이용하여 controller의 join이 잘 작동하는지 알아보는 Junit테스트용 클래스 
 */
public class MemberControllerTest_join {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx; //
	
	private MockMvc mockMvc;
	
	/*모든 테스트 전에 매번 실행되는 메서드*/
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}//end setup
	
	/*가상 URL과 파라미터를 사용하여 Controller의 join 테스트*/
	@Test
	public void testJoin() throws Exception {
		
		String resultPage = mockMvc.perform(
				MockMvcRequestBuilders.post("/member/joinform")
				.param("id", "team1")
				.param("password", "1234")
				.param("email", "ab@naver.com")
				.param("phone", "010-8787-0000")
				.param("name", "김일백")
				.param("birth", "2022-05-05")
				).andReturn()
				.getModelAndView()
				.getViewName();
		log.info(resultPage);
		
	}//end testreg
	

}//end class

