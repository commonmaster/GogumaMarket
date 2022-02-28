package com.stone.goguma.board.service;

import java.util.List;

import com.stone.goguma.board.common.Board;
import com.stone.goguma.board.common.Reply;

public interface I게시물업무자 {
	public  boolean 게시물작성이가능한가();	
	public void 게시물을등록하다(Board 새게시물);
	public Object[] 모든게시물을수집하다(int 시작게시물일련번호/*one-base*/, int 최대수집크기);
	public Board 게시물조회하다(int no);
	void 게시물변경하다(Board 변경할게시물);
	void 게시물삭제하다(int no);
	public Board 게시물변경준비하다(int no);
	
	////////////////////////////////////////////////////////////
	public List<Reply> 댓글목록수집하다(int 물품번호);
	public void 댓글등록하다(Reply 댓글);
	public void 댓글수정하다(Reply 댓글);
	public void 댓글삭제하다(int 댓글번호, int 로그인한회원의번호);
}
