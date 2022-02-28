package com.stone.springmvc.presentation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.stone.springmvc.common.Board;
import com.stone.springmvc.service.게시물관리;

@Controller
public class 게시물관리컨트롤러 {
	@Autowired 게시물관리 게시물관리;
	
	@RequestMapping("list")
	ModelAndView 게시물목록을출력하다(@RequestParam(value="pageno", required=false, defaultValue="1") int 페이지번호  ) {
		
		int 페이지당게시물수 = 5;
		//int 시작게시물DB인덱스 = (페이지번호-1) * 페이지당게시물수;
		int 블럭끝게시물일련번호 = 페이지번호 * 페이지당게시물수;
		int 시작게시물일련번호 = 블럭끝게시물일련번호 - (페이지당게시물수-1);
				
		
		Object[] 게시물들과게시물수 =게시물관리.게시물목록을수집하다(시작게시물일련번호, 페이지당게시물수);
		
		int 수집된게시물수 = (int)게시물들과게시물수[1];
		int 마지막페이지번호 = (수집된게시물수 / 페이지당게시물수) + ((수집된게시물수 % 페이지당게시물수 > 0)? 1 : 0); 
		
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("게시물목록창");
		
		/* 1. 요청한 페이지 번호(실행 후에는 현재 페이지가 되겠죠?)
		 * 2. 마지막 페이지 번호(게시판 상의 마지막 페이지-> 가장 처음에 작성된 게시글을 표현될 페이지)
		 * 3. 요청한 페이지에 보여줄 게시물 리스트
		 * */
		
		mv.addObject("pageNo", 페이지번호);
		mv.addObject("lastPageNo", 마지막페이지번호);
		mv.addObject("boards", 게시물들과게시물수[0]);
		
		return mv;
	}
	
	
	@RequestMapping("add")
	ModelAndView 게시물을등록하다(Board board) {
	
		게시물관리.게시물을등록하다(board);
		
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("forward:/list");
		return mv;
	}
	
	@RequestMapping("prepare")
	ModelAndView 게시물등록을준비하다( ) {
		게시물관리.게시물등록준비하다();
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("게시물등록창");
		return mv;
	}
	
	@RequestMapping("detail")
	ModelAndView 상세내용을출력하다(int no){
		Board 찾은게시물 = 게시물관리.게시물변경준비하다(no);
		
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("게시물상세창");
		mv.addObject("board", 찾은게시물);
		return mv;
	}
	
	@RequestMapping("prepare_update")
	ModelAndView 게시물을변경준비하다(int no){
		Board 찾은게시물 = 게시물관리.게시물을조회하다(no);
		
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("게시물변경창");
		mv.addObject("board", 찾은게시물);
		return mv;
	}
	
	@RequestMapping("update")
	ModelAndView 게시물을변경하다(Board board) {
	
		게시물관리.게시물을변경하다(board);
		
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("게시물변경통보창");
		return mv;
	}
	
	@RequestMapping("delete")
	ModelAndView 게시물을삭제하다(Integer no) {
	
		게시물관리.게시물을삭제하다(no);
		
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("게시물삭제통보창");
		return mv;
	}
}
