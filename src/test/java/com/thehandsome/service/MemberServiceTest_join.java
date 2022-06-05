package com.thehandsome.service;

import static org.junit.Assert.assertNotNull;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.MemberVO;
import com.thehandsome.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
/* 작성자: 김연식
 * 회원가입 서비스가 잘 작동하는지 알아보는 Junit테스트용 클래스 
 */
public class MemberServiceTest_join {
	/*MemberService 주입*/
	@Setter(onMethod_ = {@Autowired})
	private MemberService service;
	
	@Test
	public void testJoin() {
		MemberVO member = new MemberVO(); //member정보 담을 VO객체 생성
		member.setId("team");
		member.setPassword("1234");
		member.setEmail("ab@naver.com");
		member.setPhone("010-8787-0000");
		member.setName("김일백");
		member.setBirth("2022-05-05");
		service.join(member); //서비스의 join메소드 호출
	}//end test
	
}
