package com.thehandsome.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
/* 작성자: 김연식
 * 회원탈퇴 서비스가 잘 작동하는지 알아보는 Junit테스트용 클래스 
 */
public class MemberServiceTest_secession {
	/*MemberService 주입*/
	@Autowired
	private MemberService service;
	
	@Test
	public void testModify() {
	service.secession("team"); //service의 회원탈퇴 메소드 실행
	}
}
