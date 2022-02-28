package com.stone.goguma.board.presentation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stone.goguma.board.common.Board;
import com.stone.goguma.board.common.Reply;
import com.stone.goguma.board.service.I게시물업무자;
import com.stone.goguma.member.common.Member;
import com.stone.goguma.product.common.Product;

class replyDate{
	int rno;
	int bno; //게시물 번호
	int mno; //작성자id
	String contents; //내용
	

	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
}

@Controller
public class 게시물컨트롤러 { 
	@Autowired I게시물업무자 게시물업무자;
	
	@GetMapping("/board")
	public String 게시물작성을준비하다() {
		if(게시물업무자.게시물작성이가능한가()) {		
			return "board/게시물등록창";
		}
		return null;//실제는 작성이 불가 안내 창
	}
	
	@PostMapping("/board")
	public String 게시물을등록하다(Board 새게시물, HttpSession session) {
	
		 //로그인한 회원의 번호 구해야함-로그인 당시 회원번호를 setAttribute 했다는 것을 전제로 할때 
		 int 로그인한회원의번호=(int)session.getAttribute("mno"); 
		 //로그인한 회원이 작성자이므로 새게시물에 작성자를 set 해주어야함 
		 Member 작성한회원=new Member(); 
		 작성한회원.setMno(로그인한회원의번호);
		새게시물.setWriter(작성한회원);
		
		System.out.println("게시물등록");
		게시물업무자.게시물을등록하다(새게시물);
		return "board/게시물등록알림창";
	}
	
	@GetMapping("/boards")
	public ModelAndView 게시물목록을출력하다(@RequestParam(value="pageno", required=false, defaultValue="1") int 페이지번호) {
		int 페이지당게시물수 = 5;
		int 범위끝게시물일련번호=페이지당게시물수*페이지번호;
		int 시작게시물일련번호 = 범위끝게시물일련번호-(페이지당게시물수-1);
		
		Object[] 수집된게시물들과게시물수=게시물업무자.모든게시물을수집하다(시작게시물일련번호, 페이지당게시물수);
		int 총수집된게시물수=(int) 수집된게시물들과게시물수[1]; //테이블내의 게시물수가 아닌 수집된 게시물의 수
		System.out.println("수집된게시물갯수: " + ((List<Board>) 수집된게시물들과게시물수[0]).size());
		int 마지막페이지번호= (int)(총수집된게시물수/페이지당게시물수)+((총수집된게시물수%페이지당게시물수>0)? 1 :0);
		
		
	
		ModelAndView mv=new ModelAndView();
		mv.setViewName("board/게시물목록창");
		mv.addObject("boards", 수집된게시물들과게시물수[0]);		
		mv.addObject("pageNo", 페이지번호);
		mv.addObject("lastPageNo",마지막페이지번호);
		return mv;
	}
	@GetMapping("/board_detail/{bno}")
	public ModelAndView 게시물상세츨력하다(@PathVariable int bno ,HttpSession session) {
		Board 찾은게시물=게시물업무자.게시물조회하다(bno);
	
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("board/게시물상세창");
		mv.addObject("board",찾은게시물);
		//로그인 안되어 있으면=>  로그인회원와게시물작성자가동일인물인가=null
		Boolean 로그인회원와게시물작성자가동일인물인가=null;
		Integer 회원번호 = null;
		if(session!=null) {
	    	회원번호=(Integer)session.getAttribute("mno");
	    	 if(회원번호!=null) { //로그인된 경우
	    		 //로그인 회원와 게시물 작성자가 동일 인물
	    		 if(회원번호==찾은게시물.getWriter().getMno()) {
	    			 로그인회원와게시물작성자가동일인물인가=true;
	    		 }
	    		 else //로그인 회원와 게시물 작성자가 다른 인물
	    		 {
	    			 로그인회원와게시물작성자가동일인물인가=false;
	    		 }
	    	 }
	    }
	    
		mv.addObject("isWriter", 로그인회원와게시물작성자가동일인물인가);
		mv.addObject("loginMno", 회원번호);
		return mv;
	}
	@GetMapping("/board_update")
	ModelAndView 게시물을변경준비하다(int bno){
		Board 찾은게시물 = 게시물업무자.게시물변경준비하다(bno);
		
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("/board/게시물변경창");
		mv.addObject("board", 찾은게시물);
		return mv;
	}
	

	@PostMapping("/board_update")
	ModelAndView 게시물을변경하다(Board 변경할게시물){
		게시물업무자.게시물변경하다(변경할게시물);
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("/board/게시물변경통보창");
		mv.addObject("bno", 변경할게시물.getBno());
		return mv;
	}
	
	
	
	@GetMapping("/board_delete")
	ModelAndView 게시물을삭제하다(int bno) {
		게시물업무자.게시물삭제하다(bno);
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("/board/게시물삭제통보창");
		return mv;
	}
	////////////////////////////////////////////////////////////////////////////////////////////
		
	@PostMapping("/getBoardReplyList")
	public @ResponseBody List<Reply>  댓글목록출력하다(@RequestParam("bno") int 게시물번호){
		return 게시물업무자.댓글목록수집하다(게시물번호);
	}
	
	@PostMapping("/boardReply_save")
	public @ResponseBody String 댓글등록하다(@RequestBody replyDate 댓글data, HttpSession session){
		int 로그인한회원의번호=(int)session.getAttribute("mno");
		Member 작성한회원= new Member();			
		작성한회원.setMno(로그인한회원의번호);
		Board 댓글작성게시물 = new Board();
		댓글작성게시물.setBno(댓글data.getBno());
		
		Reply 댓글 = new Reply();			
		댓글.setMno(작성한회원);		
		댓글.setBno(댓글작성게시물);
		댓글.setContents(댓글data.getContents());
		
		게시물업무자.댓글등록하다(댓글);
		
		return "ok";
	}

	@PostMapping("/boardReply_update")
	public @ResponseBody String 댓글변경하다(@RequestBody replyDate 댓글data, HttpSession session){
		int 로그인한회원의번호=(int)session.getAttribute("mno");
		Member 작성한회원= new Member();			
		작성한회원.setMno(로그인한회원의번호);
		
		Reply 댓글 = new Reply();
		댓글.setContents(댓글data.getContents());
		댓글.setRno(댓글data.getRno());
		댓글.setMno(작성한회원);		

		게시물업무자.댓글수정하다(댓글);
		return "ok";
	}
	
	@PostMapping("/boardReply_delete")
	public @ResponseBody String 댓글삭제하다(@RequestBody replyDate 댓글data, HttpSession session) {
		int 로그인한회원의번호=(int)session.getAttribute("mno");			
		System.out.println(댓글data.getRno()+ "------- " + 댓글data.getMno());
		게시물업무자.댓글삭제하다(댓글data.getRno(), 로그인한회원의번호);
		return "ok";
	}

	
}
