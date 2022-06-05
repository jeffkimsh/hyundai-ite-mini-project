// 작성자 : 김승환
// 기능 : Product 컨트롤러 - ProductDetail2 테스트 (상품의 다른 색상 정보 조회)
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
import org.springframework.web.servlet.ModelAndView;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class ProductControllerTest_detailColor {
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}//end setup
	
	
	@Test
	public void testDetailColor() throws Exception {
		
		ModelAndView resultPage = mockMvc.perform(
				MockMvcRequestBuilders.post("/product/productDetail2")
				.param("pcode", "MO02")
				).andReturn()
				.getModelAndView()
				;
		log.info(resultPage);
		
	}//end test testDetailColor
}// end class
