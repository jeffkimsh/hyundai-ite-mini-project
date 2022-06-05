package com.thehandsome.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thehandsome.domain.MemberVO;
import com.thehandsome.service.MemberService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

/*작성자: 김연식
회원 관련 페이지의 주소를 매핑하는 컨트롤러 클래스*/
@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController {
	/*MemberService 주입*/
	@Autowired
	private MemberService service;
	
	/*로그인 화면 진입*/
	@GetMapping("/login")
	public void login() {
		log.info("/login");
	}
	
	/*로그인 폼에 데이터 입력 후 POST방식 전송*/
	@PostMapping("/loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVO member, HttpSession session) {
		member = service.loginCheck(member, session);
		ModelAndView mav = new ModelAndView();
		if(member != null) {
			session.setAttribute("member", member);
			mav.setViewName("redirect:/");
		} else {
			mav.setViewName("/member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	/*로그아웃 진행 페이지*/
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}
	
	/*회원가입 페이지 진입*/
	@GetMapping("/joinform")
	public String join() {
		return "/member/joinform";
	}
	
	/*회원가입 페이지에 폼 입력 후 POST방식 전송*/
	@PostMapping("/joinform")
	public String join(MemberVO member, RedirectAttributes rttr) {
				service.join(member);
				rttr.addFlashAttribute("msg", member);
		return "/member/joincomplete";
	}
	
	/*마이페이지 진입*/
	@GetMapping("/mypage")
	public String mypage() {
		return "/member/mypage";
	}
	
	/*회원정보 수정 페이지 진입 및 데이터 얻어오기*/
	@GetMapping("/modify")
	public String modify(HttpSession session, Model model) {
		model.addAttribute("member", service.get((String)session.getAttribute("id")));
		return "/member/modify";
	}
	
	/*회원정보 수정 반영 및 완료 페이지 보여주기*/
	@PostMapping("/modify")
	public String modify(MemberVO member) {
		service.modify(member);
		return "/member/modifycomplete";
	}
	
	/*회원탈퇴 페이지 진입*/
	@GetMapping("/secession")
	public String secession() {
		return "/member/secession";
	}
	
	/*회원탈퇴 처리 완료 후 페이지 보여주기*/
	@PostMapping("/secessioncomplete")
	public String secessioncomplete(String id, HttpSession session) {
	
		service.secession(id);
		session.invalidate();
		return "/member/secessioncomplete";
	}	
}
