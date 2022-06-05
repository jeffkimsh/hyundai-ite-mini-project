package com.thehandsome.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Select;
import com.thehandsome.domain.MemberVO;

/* 작성자: 김연식 
회원 관련 메소드를 담은 매퍼 클래스 */ 
public interface MemberMapper {

	public void join(MemberVO member); // 회원 가입

	public void secession(String id); // 회원 탈퇴
	
	public void modify(MemberVO member); // 회원 정보 수정
	
	public MemberVO get(String id); //회원 정보 얻기
		
	public MemberVO loginCheck(MemberVO member); //회원 로그인	
}
