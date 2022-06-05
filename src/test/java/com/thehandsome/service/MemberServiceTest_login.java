package com.thehandsome.service;

import static org.junit.Assert.assertNotNull;
import javax.servlet.http.HttpSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.MemberVO;
import com.thehandsome.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
/* 작성자: 김연식
 * 로그인 서비스가 잘 작동하는지 알아보는 Junit테스트용 클래스 
 */
public class MemberServiceTest_login {
	/*MemberService 주입*/
	@Autowired
	private MemberService service;
	
	@Test
	public void testlogin() {
		MemberVO member = new MemberVO(); //member정보 담을 VO객체 생성
		MockHttpSession session = new MockHttpSession(); //세션을 테스트 하기 위해 MockHttpSession사용
		member.setId("team");
		member.setPassword("1234");
		service.loginCheck(member, session); //service의 로그인 메소드 실행
		System.out.println(""+member+session);
	}
}
