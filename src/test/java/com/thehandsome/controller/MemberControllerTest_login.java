package com.thehandsome.controller;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.thehandsome.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
/* 작성자: 김연식
 * 가짜Mvc인 MockMvc를 이용하여 controller의 login이 잘 작동하는지 알아보는 Junit테스트용 클래스 
 */
public class MemberControllerTest_login {
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	/*모든 테스트 전에 매번 실행되는 메서드*/
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();		
	}//end setup
	
	/*가상 URL과 파라미터를 사용하여 Controller의 modify 테스트*/
	@Test
	public void loginTest() throws Exception{
		ModelAndView resultPage =
				mockMvc.perform(MockMvcRequestBuilders.post("/member/loginCheck.do")
						.param("id", "team1")
						.param("password", "1234")
						).andReturn().getModelAndView();
		log.info(resultPage);
		
		
	}//end testList
	
	

}//end class
