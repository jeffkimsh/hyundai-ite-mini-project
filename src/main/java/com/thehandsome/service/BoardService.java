// 작성자 : 차은채
// 기능 : 게시판과 관련해서 어떤 기능을 수행할 것인지 알려주는 서비스 인터페이스
package com.thehandsome.service;

import java.util.List;

import com.thehandsome.domain.BoardVO;
import com.thehandsome.domain.Criteria;

public interface BoardService {
	// 페이징 처리에 필요한 카운트
	public int getTotal(Criteria cri);
	
	// 글 등록
	public void register(BoardVO board);
	
	// 글 목록
	public BoardVO get(Long bno);
	
	// 글 수정
	public boolean modify(BoardVO board);
	
	// 글 삭제
	public boolean remove(Long bno);
	
	// 페이지 정보를 가지지 않고 글 목록 불러오기
	//public List<BoardVO> getList();		
	
	// 페이지 정보를 가지고 글 목록 불러오기
	public List<BoardVO> getList(Criteria cri);	

}//end int
