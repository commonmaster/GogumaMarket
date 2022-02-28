package com.stone.goguma.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.goguma.board.common.Board;
import com.stone.goguma.board.common.Reply;
import com.stone.goguma.board.dataservice.I게시물DAO;


@Service
public class 게시물업무자 implements I게시물업무자 {
    @Autowired I게시물DAO 게시물DAO;
    
	
	@Override
	public boolean 게시물작성이가능한가() {
	
		return true;
	}

	@Override
	public void 게시물을등록하다(Board 새게시물) {
		
		게시물DAO.저장하다(새게시물);
	}

	@Override
	public Board 게시물조회하다(int no) {
		return 게시물DAO.게시판상세보다(no);
	}
	
	@Override
	public Object[] 모든게시물을수집하다(int 시작게시물일련번호, int 최대수집크기) {
		return 게시물DAO.모든게시물을수집하다(시작게시물일련번호, 최대수집크기);
	}

	@Override
	public void 게시물변경하다(Board 변경할게시물) {
		게시물DAO.게시물변경하다(변경할게시물);
	}

	@Override
	public void 게시물삭제하다(int no) {
		게시물DAO.게시물삭제하다(no);
	}	

	@Override
	public Board 게시물변경준비하다(int 게시물번호) {
		return 게시물DAO.게시판상세보다(게시물번호);
	}


	//////////////////////////////////////////////////////////////////////////////

	@Override
	public List<Reply> 댓글목록수집하다(int 물품번호) {
		return 게시물DAO.댓글목록수집하다(물품번호);
	}

	@Override
	public void 댓글등록하다(Reply 댓글) {
		게시물DAO.댓글저장하다(댓글);			
	}

	@Override
	public void 댓글수정하다(Reply 댓글) {
		게시물DAO.댓글수정하다(댓글);
	}

	@Override
	public void 댓글삭제하다(int 댓글번호, int 로그인한회원의번호) {
		게시물DAO.댓글삭제하다(댓글번호, 로그인한회원의번호);
	}



	

}
