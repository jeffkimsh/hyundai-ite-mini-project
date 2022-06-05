package com.thehandsome.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.thehandsome.domain.MemberVO;

/*작성자: 김연식
회원관련 서비스 인터페이스*/
public interface MemberService {
	
	//회원가입
	public void join(MemberVO member);
	
	//회원정보수정
	public void modify(MemberVO member);
	
	//회원탈퇴
	public void secession(String id);
	
	//회원정보 얻어오기
	public MemberVO get(String id);
	
	//로그인
	public MemberVO loginCheck(MemberVO member, HttpSession session);
	
	
}
