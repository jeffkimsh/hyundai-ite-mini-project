//작성자 : 차은채
//기능 : BoardService를 implements하여 데이터베이스 관련해서 어떤 기능을 수행해야할지 mapper와 연결한다.
package com.thehandsome.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.thehandsome.domain.BoardVO;
import com.thehandsome.domain.Criteria;
import com.thehandsome.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	// 글 등록에 관련한 mapper 호출
	@Override
	public void register(BoardVO board) {
		log.info("register...."+board);
		mapper.insert(board);
	}

	// 글 목록에 관련한 mapper 호출
	@Override
	public BoardVO get(Long bno) {
		log.info("get....."+bno);
		return mapper.read(bno);
	}

	// 글 수정에 관련한 mapper 호출
	@Override
	public boolean modify(BoardVO board) {
		log.info("Modify....."+board);
		return mapper.update(board) == 1;
	}

	// 글 삭제에 관련한 mapper 호출
	@Override
	public boolean remove(Long bno) {
		log.info("remove..." + bno);
		return mapper.delete(bno) ==1	;
	}

	/*
	 * @Override public List<BoardVO> getList() { log.info("get List.............");
	 * return mapper.getList(); }
	 */
	
	// 페이징 정보를 담은 글 목록에 관련한 mapper 호출
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("get List with criteria..." + cri);
		return mapper.getListWithPaging(cri);
	}
	
	// 페이징 처리에 필요한 글 전체 갯수에 관련한 mapper 호출
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

}//end class
