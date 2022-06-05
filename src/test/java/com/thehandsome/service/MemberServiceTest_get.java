package com.thehandsome.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
/* 작성자: 김연식
 * 회원정보 얻기 서비스가 잘 작동하는지 알아보는 Junit테스트용 클래스 
 */
public class MemberServiceTest_get {
	/*MemberService 주입*/
	@Autowired
	private MemberService service;
	
	@Test
	public void testGet() {
		service.get("team1");
	}
}
