package com.stone.goguma.board.dataservice;


import java.util.List;

import com.stone.goguma.board.common.Board;
import com.stone.goguma.board.common.Reply;

public interface I게시물DAO {
	
	public  void  저장하다(Board 새게시물);
	public Object[] 모든게시물을수집하다(int 시작일련번호, int 페이지당게시물수);
	public Board 게시판상세보다(int bno);	
	void 게시물변경하다(Board 변경할게시물);
	void 게시물삭제하다(int no);
	
	//Reply
	public List<Reply> 댓글목록수집하다(int 물품번호);
	public void 댓글저장하다(Reply 댓글);
	public void 댓글수정하다(Reply 댓글);
	public void 댓글삭제하다(int 댓글번호, int 로그인한회원의번호);
	
}
