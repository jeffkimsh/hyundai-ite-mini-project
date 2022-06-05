package com.thehandsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.thehandsome.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
/*작성자: 김연식
 * mapper의 회원정보 얻기인 select 메소드가 잘 작동하는지 알아보는 Junit테스트용 클래스 
 */
public class MemberMapperTest_get {
	/*MemberMapper 주입*/
	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testget() {
		
	mapper.get("team1"); // "아이디가 team1인 member 얻어오기"
	}
}
