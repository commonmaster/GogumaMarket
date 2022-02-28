package com.stone.goguma.board.dataservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.stone.goguma.board.common.Board;
import com.stone.goguma.board.common.Reply;
import com.stone.goguma.member.dataservice.I회원Mapper;

@Repository
public class 게시물DAO implements I게시물DAO {
	@Autowired
	I게시물Mapper 게시물DAO;
	@Autowired
	I회원Mapper 회원DAO;
	@Autowired
	IBoard댓글Mapper 댓글Mapper;

	@Transactional
	@Override
	public void 저장하다(Board 새게시물) {
		게시물DAO.게시물을저장하다(새게시물);
	}

	@Override
	public Object[] 모든게시물을수집하다(int 시작일련번호, int 페이지당게시물수) {
		// zero base
		List<Board> 게시물리스트 = 게시물DAO.모든게시물을수집하다((시작일련번호 - 1), 페이지당게시물수);

		int 게시물수 = 게시물DAO.수집된게시물수();

		Object[] obj = { 게시물리스트, 게시물수 };

		return obj;
	}


	@Override
	public Board 게시판상세보다(int bno) {
		게시물DAO.게시물조회수증가하다(bno);
		return 게시물DAO.게시물번호를찾다(bno);
	}

	@Override
	public void 게시물변경하다(Board 변경할게시물) {
		게시물DAO.게시물변경하다(변경할게시물);

	}

	@Override
	public void 게시물삭제하다(int bno) {
		게시물DAO.게시물삭제하다(bno);

	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	@Transactional
	@Override
	public List<Reply> 댓글목록수집하다(int 물품번호) {
		return 댓글Mapper.댓글목록수집하다(물품번호);
		
	}

	@Transactional
	@Override
	public void 댓글저장하다(Reply 댓글) {
		댓글Mapper.댓글저장하다(댓글);
	}

	@Transactional
	@Override
	public void 댓글수정하다(Reply 댓글) {
		댓글Mapper.댓글수정하다(댓글);
	}	

	@Transactional
	@Override
	public void 댓글삭제하다(int 댓글번호, int 로그인한회원의번호) {
		댓글Mapper.댓글삭제하다(댓글번호, 로그인한회원의번호);
		
	}

}
