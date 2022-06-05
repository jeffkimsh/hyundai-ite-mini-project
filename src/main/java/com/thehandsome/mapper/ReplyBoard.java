// 작성자 : 차은채
// 기능 : 데이터 베이스 요청 처리를 위해 BoardMapper.xml과 연결할 수 인터페이스
package com.thehandsome.mapper;

import java.util.List;

import com.thehandsome.domain.ReplyVO;

public interface ReplyBoard {
	
	public List<ReplyVO> list( int bno) ;
	
    public void create(ReplyVO vo) ;
	
	public int update(ReplyVO vo) ;
	
	public int delete (int rno) ;

}
