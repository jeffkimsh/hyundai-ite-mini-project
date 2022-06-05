// 작성자 : 차은채
// 기능 : 커뮤니티 게시판 컨트롤러
package com.thehandsome.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.thehandsome.domain.BoardVO;
import com.thehandsome.domain.Criteria;
import com.thehandsome.domain.PageDTD;
import com.thehandsome.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {	
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@GetMapping("/register")
	public void register() {
		
	}//end reg
	/*
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}//end list
	*/
	
//	페이징처리에 필요한 정보를 담아서 get방식으로 글 전체 목록을 불러온다.
	@GetMapping("/list")
	public void list(Criteria cri,  Model model) {
		log.info("list" + cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTD(cri, total));
	}//end list
	
//	글 등록을 요청할 때 정보를 가지고 post로 mapping 시켰다. 서비스의 register을 호출하여 insert가 실행될 수 있도록 연결해주었다.
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info( "register: " +board);		
		service.register(board);		
		rttr.addFlashAttribute("result", board.getPostno());		
		return "redirect:/board/list";		
	}//end register

//	한개의 글 상세 정보를 호출하거나, 수정을 요청할 시 파라미터로 글 번호를 가지고 서비스의 get을 호출하여 read(select)가 실행될 수 있도록 연결해주었다.
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,	Model model) {
		log.info("/get or Modify");
		model.addAttribute("board", service.get(bno));		
	}//end get
	
//	글 수정을 할 때 게시판에 필요한 정보들을 담아서 post로 값을 전달하고 서비스의 modify를 호출하여 update가 실행될 수 있도록 연결해주었다. 또한 글 수정 시 리스트로 넘어가도록 연결해주었다.
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify :" + board);
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";		
	}//end modify
	
//	글 삭제를 할 때 게시글의 글 번호를 파라미터로 받아와서 서비스의 remove를 호출하여 delete가 실행될 수 있도록 연결해주었다. 또한 글 삭제 시 리스트로 넘어가도록 연결해주었다.
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno,RedirectAttributes rttr ) {
		
		log.info("remove..." + bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}//end if
		return "redirect:/board/list";		
	}//end remove

}//end class
