package com.thehandsome.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.MemberVO;
import com.thehandsome.service.MemberService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
/* 작성자: 김연식
 * 회원정보수정 서비스가 잘 작동하는지 알아보는 Junit테스트용 클래스 
 */
public class MemberServiceTest_modify {
	/*MemberService 주입*/
	@Autowired
	private MemberService service;
	
	@Test
	public void testModify() {
	MemberVO member = service.get("team"); //아이디 파라미터의 get함수로 회원정보 가져오기
	member.setId("team");
	member.setPassword("123");
	member.setEmail("abcd@naver.com");
	member.setPhone("010-7878-8989");
	member.setName("김백천");
	member.setBirth("2022-05-09");
	service.modify(member); //Service의 수정 메소드 호출
	}
}
