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
 * mapper의 회원정보수정인 update 메소드가 잘 작동하는지 알아보는 Junit테스트용 클래스 
 */
public class MemberMapperTest_modify {
	/*MemberMapper 주입*/
	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testModify() {
		MemberVO member = new MemberVO(); // member정보 담을 VO객체 생성
		
		member.setId("새 아이디");
		member.setPassword("asdf");
		member.setEmail("a@a");
		member.setPhone("010-0101-1212");
		member.setName("UUU");
		member.setBirth("20220506");
		
		mapper.modify(member); //회원정보 변경 Setter후 modify 메소드 호출
		log.info(member);
	}
}
