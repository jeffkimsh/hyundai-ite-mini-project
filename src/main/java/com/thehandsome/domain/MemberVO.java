package com.thehandsome.domain;

import org.springframework.stereotype.Component;

import lombok.Data;
/* 작성자: 김연식
회원 정보를 담는 VO 클래스 */
@Data
public class MemberVO {

	private String id; //회원 아이디
	private String password; //회원 비밀번호
	private String email; // 회원 이메일
	private String phone; // 회원 전화번호
	private String name; // 회원 이름
	private String birth; // 회원 생년월일
}
