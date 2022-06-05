package com.thehandsome.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.thehandsome.domain.MemberVO;
import com.thehandsome.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
/*작성자: 김연식
 * mapper의 회원가입인 insert메소드가 잘 작동하는지 알아보는 Junit테스트용 클래스 
 */
public class MemberMapperTest_join {
	/*MemberMapper 주입*/
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testInsert() {
		MemberVO member = new MemberVO(); // member정보 담을 VO객체 생성
		member.setId("새 아이디");
		member.setPassword("newpass");
		member.setEmail("새 이메일");
		member.setPhone("010-9999-9999");
		member.setName("뉴비");
		member.setBirth("2022-05-05");
		
		mapper.join(member); //Member정보 Setter후 join메소드 호출
		
		log.info(member);
		}
}//end class
