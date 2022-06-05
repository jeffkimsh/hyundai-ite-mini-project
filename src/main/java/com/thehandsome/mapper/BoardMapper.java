// 작성자 : 차은채
// 기능 : 커뮤니티 게시판에 관련한 데이터 베이스 요청 처리를 위해 BoardMapper.xml과 연결할 수 인터페이스
package com.thehandsome.mapper;

import java.util.List;

import com.thehandsome.domain.BoardVO;
import com.thehandsome.domain.Criteria;

public interface BoardMapper {
	// 페이징 처리에 필요한 카운트
	public int getTotalCount(Criteria cri);
	
	// 페이지 정보를 가지고 글 목록을 불러오기
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	// 페이지 정보를 가지지 않고 글 목록 불러오기
	public List<BoardVO> getList();
	
	// 글 작성
	public void insert(BoardVO board);
	
	// 글 목록
	public BoardVO read(Long bno);
	
	// 글 삭제
	public int delete (Long bno);
	
	// 글 수정
	public int update(BoardVO board);

}//end inter
