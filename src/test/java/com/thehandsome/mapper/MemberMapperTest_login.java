package com.thehandsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.MemberVO;
import com.thehandsome.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
/*작성자: 김연식
 * mapper의 로그인인 select 메소드가 잘 작동하는지 알아보는 Junit테스트용 클래스 
 */
public class MemberMapperTest_login {
	/*MemberMapper 주입*/
	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testlogin() {
		MemberVO member = new MemberVO(); // member정보 담을 VO객체 생성
		
		member.setId("새 아이디");
		member.setPassword("newpass");
		
		mapper.loginCheck(member); //ID, PW Setter후 login메소드 호출
		System.out.println("Result:"+mapper.loginCheck(member));
		
	}
}
