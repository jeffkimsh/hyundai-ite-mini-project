package com.thehandsome.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thehandsome.domain.MemberVO;
import com.thehandsome.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

/*작성자: 김연식
회원관련 메소드를 Service에 선언하고 구현한 구현 서비스 클래스*/
@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	
	/*매퍼 주입*/
	@Autowired
	private MemberMapper mapper;
		
	/*회원가입*/
	@Override
	public void join(MemberVO member) {
		log.info("join"+member);
		mapper.join(member);
	}
	
	/*회원정보수정*/
	@Override
	public void modify(MemberVO member) {
		log.info("modify"+member);
		mapper.modify(member);
	}
	
	/*회원정보얻기*/
	@Override
	public MemberVO get(String id) {
		log.info("get....."+id);
		return mapper.get(id);
	}
	
	/*회원탈퇴*/
	@Override
	public void secession(String id) {
		log.info("delete"+ id);
		mapper.secession(id);
	}
		
	/*로그인*/
	@Override
	public MemberVO loginCheck(MemberVO member, HttpSession session) {
		member = mapper.loginCheck(member); //로그인 메소드 실행후 멤버에 담기
		if(member != null) { //멤버 내용이 있으면
			session.setAttribute("id", member.getId()); //로그인 세션 유지
		}
		return member;
	}
}
