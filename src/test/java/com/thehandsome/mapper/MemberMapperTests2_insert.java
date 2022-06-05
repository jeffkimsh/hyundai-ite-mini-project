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
public class MemberMapperTests2_insert {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testInsert() {
		MemberVO member = new MemberVO();
		member.setId("새 아이디");
		member.setPassword("newpass");
		member.setEmail("새 이메일");
		member.setPhone("010-9999-9999");
		member.setName("뉴비");
		member.setBirth("2022-05-05");
		
		mapper.join(member);
		
		log.info(member);
		}
	
	
	
}//end class
