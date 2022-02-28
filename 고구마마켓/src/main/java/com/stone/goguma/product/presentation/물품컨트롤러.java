package com.stone.goguma.product.presentation;

import java.sql.Timestamp;
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

import com.stone.goguma.member.common.Member;
import com.stone.goguma.member.service.I회원관리서비스;
import com.stone.goguma.member.service.회원관리서비스;
import com.stone.goguma.product.common.Product;
import com.stone.goguma.product.common.Reply;
import com.stone.goguma.product.service.I물품서비스;

class 눌렸냐Data{
	int pno;
    boolean press;
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public boolean getPress() {
		return press;
	}
	public void setPress(boolean press) {
		this.press = press;
	}
}

class replyDate{
	int rno;
	int pno; //게시물 번호
	int mno; //작성자id
	String contents; //내용
	

	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
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
public class 물품컨트롤러 {
	@Autowired I물품서비스 물품서비스;
	@Autowired I회원관리서비스 회원관리서비스;
	
	@GetMapping("/product")
	public String 물품작성을준비하다() {
	if(물품서비스.물품작성이가능한가()) {		
		return "product/물품등록창";
	}
	return null;//실제는 작성이 불가 안내 창
	}	
	@PostMapping("/product")
	public String 믈품을등록하다(Product 새물품, HttpSession session) {
		
		  //로그인한 회원의 번호 구해야함-로그인 당시 회원번호를 setAttribute 했다는 것을 전제로 할때 
		int 로그인한회원의번호=(int)session.getAttribute("mno"); //로그인한 회원이 작성자이므로 새물품물에 작성자를 set 해주어야함 
		Member 작성한회원=new Member(); 
		작성한회원.setMno(로그인한회원의번호);
		새물품.setUser(작성한회원);		 
		
		물품서비스.물품을등록하다(새물품);
		
		return "product/물품등록알림창";
	}
	@GetMapping("/picture/{pno}") //예 /profile/1
	public ModelAndView 프로필사진을주다(@PathVariable int pno, Product product) {
		
		Product 물품 = 물품서비스.사진찾다(pno);
		ModelAndView mv =new ModelAndView();
		mv.addObject("PictureData", 물품.getPicture() );
		mv.setViewName("Picture");
	    return mv;	
	}
	
	// 물품 상세
	@GetMapping("/product_detail/{pno}")
	public ModelAndView 물품상세보다(@PathVariable int pno, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/물품상세창");
		Product product = 물품서비스.물품상세보다(pno);
		mv.addObject("product", product);
		List<Reply> reply = 물품서비스.댓글목록수집하다(pno);
		mv.addObject("reply", reply);
		if(session!=null) {
			Integer loginMno=(Integer)session.getAttribute("mno");
		if(loginMno!=null) { //로그인된 경우
			boolean 눌렀었다 = 물품서비스.눌렀냐(pno, loginMno);
			mv.addObject("눌렀었다",눌렀었다);
			 
			Boolean 로그인회원와물품물작성자가동일인물인가=null;
			//로그인 회원와 물품물 작성자가 동일 인물
			if(loginMno==product.getUser().getMno()) {
				 로그인회원와물품물작성자가동일인물인가=true;
			}
			else //로그인 회원와 물품물 작성자가 다른 인물
			{
				로그인회원와물품물작성자가동일인물인가=false;
			}
			mv.addObject("isWriter", 로그인회원와물품물작성자가동일인물인가);
			mv.addObject("loginMno", loginMno);
		  }
	    	
	    }
		return mv;
	}

	/*
	 * // 내 물품글 상세 조회
	 * 
	 * @GetMapping("/mproduct_detail/{pno}") public ModelAndView
	 * 내물품상세보다(@PathVariable int pno, HttpSession session) { ModelAndView mv = new
	 * ModelAndView(); mv.setViewName("product/내물품상세창"); Product product =
	 * 물품서비스.물품상세보다(pno); mv.addObject("product", product);
	 * 
	 * if(session!=null) { Integer loginMno=(Integer)session.getAttribute("mno");
	 * if(loginMno!=null) { //로그인된 경우 boolean 눌렀었다 = 물품서비스.눌렀냐(pno, loginMno);
	 * mv.addObject("눌렀었다",눌렀었다);
	 * 
	 * Boolean 로그인회원와물품물작성자가동일인물인가=null; //로그인 회원와 물품물 작성자가 동일 인물
	 * if(loginMno==product.getUser().getMno()) { 로그인회원와물품물작성자가동일인물인가=true; } else
	 * //로그인 회원와 물품물 작성자가 다른 인물 { 로그인회원와물품물작성자가동일인물인가=false; }
	 * mv.addObject("isWriter", 로그인회원와물품물작성자가동일인물인가); }
	 * 
	 * } return mv; }
	 */
		// 회원 좋아요
	@PostMapping("/heart")
	public @ResponseBody String 좋아요하다(@RequestBody 눌렸냐Data 한눌렸냐Data, HttpSession session) {
		int 회원번호=(int)session.getAttribute("mno");
		물품서비스.좋아요를변경하다(한눌렸냐Data.getPno(), 회원번호, 한눌렸냐Data.getPress());
		return "ok";
	}
	@GetMapping("/product_state_update")
	ModelAndView 물품상태를변경하다(@RequestParam(value="pno")int 물품번호, @RequestParam(value="pstate")int 상태){
		ModelAndView  mv =new ModelAndView();
		물품서비스.물품상태를변경하다(물품번호, 상태);
		mv.setViewName("redirect:/mproduct_detail/"+물품번호);
		return mv;
	}
	@GetMapping("/product_update")
	ModelAndView 물품변경준비하다(int pno){
		Product 찾은물품 = 물품서비스.물품변경준비하다(pno);
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("/product/물품변경창");
		mv.addObject("product", 찾은물품);
		return mv;
	}	
	@PostMapping("/product_update")
	ModelAndView 물품을변경하다(Product 변경할물품, @RequestParam(value = "imgChange", required = false, defaultValue = "0")int 이미지변경유무){
		물품서비스.물품을변경하다(변경할물품, 이미지변경유무);
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("/product/물품변경통보창");
		mv.addObject("pno", 변경할물품.getPno());
		return mv;
	}		
	@GetMapping("/product_delete")
	ModelAndView 물품을삭제하다(int pno) {
		물품서비스.물품을삭제하다(pno);
		ModelAndView  mv =new ModelAndView();
		mv.setViewName("/product/물품삭제통보창");
		return mv;
	}
	//내가 좋아요한 물품 목록 출력
	@GetMapping("/hearted_products")
	public ModelAndView 좋아요한물품목록을출력하다(@RequestParam(value = "pageno", required = false, defaultValue = "1") int 페이지번호, HttpSession session) {
		
		int 페이지당물품수 = 2;
		// int 시작물품물DB인덱스 = (페이지번호-1) * 페이지당물품물수;
		int 블럭끝물품물일련번호 = 페이지번호 * 페이지당물품수;
		int 시작물품일련번호 = 블럭끝물품물일련번호 - (페이지당물품수 - 1);
		
		
		int 로그인한회원번호=(int)session.getAttribute("mno");
															
		Object[] 좋아요한물품목록과물품수 = 물품서비스.좋아요한물품을수집하다(로그인한회원번호, 시작물품일련번호, 페이지당물품수);
		

		int 수집된물품물수 = (int) 좋아요한물품목록과물품수[1];
		int 마지막페이지번호 = (수집된물품물수 / 페이지당물품수) + ((수집된물품물수 % 페이지당물품수 > 0) ? 1 : 0);
				System.out.println("좋아요물품마지막페이지번호 "+마지막페이지번호);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("product/좋아요물품목록창");
		mv.addObject("hproducts", 좋아요한물품목록과물품수[0]);
		mv.addObject("pageNo", 페이지번호);
		mv.addObject("lastPageNo", 마지막페이지번호);
		return mv;
		
		
		
		
//		
//		int 로그인한회원번호 =(int)session.getAttribute("mno");
//		List<Product> 좋아요한물품들 = 물품서비스.좋아요한물품을수집하다(로그인한회원번호);
//		ModelAndView mv=new ModelAndView();
//		mv.setViewName("product/좋아요물품목록창");
//		mv.addObject("products", 좋아요한물품들);
//		return mv;
	}
	////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	@GetMapping("/products")
	ModelAndView 물품목록을출력하다(@RequestParam(value = "pageno", required = false, defaultValue = "1") int 페이지번호,
			HttpSession session, @RequestParam(value="search", required = false, defaultValue = "")String search) {

		ModelAndView mav = new ModelAndView();

		Integer mno = (Integer) session.getAttribute("mno"); // 회원번호 받아오기		
		
		int 페이지당물품수 = 4;
		// int 시작물품물DB인덱스 = (페이지번호-1) * 페이지당물품물수;
		int 블럭끝물품물일련번호 = 페이지번호 * 페이지당물품수;
		int 시작물품일련번호 = 블럭끝물품물일련번호 - (페이지당물품수 - 1);
		Object[] 물품들과물품수 = null;
		
		// 검색한 내용이 없는 경우
		if(search.trim().equals("")) {
			물품들과물품수 = 물품서비스.전체중고물품과물품수를수집하다(시작물품일련번호, 페이지당물품수);
		}else {
			물품들과물품수 = 물품서비스.검색한중고물품과물품수를수집하다(시작물품일련번호, 페이지당물품수, search);
		}

		int 수집된물품물수 = (int) 물품들과물품수[1];
		int 마지막페이지번호 = (수집된물품물수 / 페이지당물품수) + ((수집된물품물수 % 페이지당물품수 > 0) ? 1 : 0);

		mav.setViewName("product/물품목록창");

		/*
		 * 1. 요청한 페이지 번호(실행 후에는 현재 페이지가 되겠죠?) 2. 마지막 페이지 번호(물품판 상의 마지막 페이지-> 가장 처음에 작성된
		 * 물품글을 표현될 페이지) 3. 요청한 페이지에 보여줄 물품물 리스트
		 */

		mav.addObject("pageNo", 페이지번호);
		mav.addObject("lastPageNo", 마지막페이지번호);
		mav.addObject("products", 물품들과물품수[0]);
		mav.addObject("search", search);
		

		return mav;
	}
	
	/////////////////////////////////////////////////////////////////////// 2022-02-18 윤원씨
	//내물품목록을 출력하다
		@GetMapping("/mproducts")
		public ModelAndView 내물품목록을출력하다(@RequestParam(value = "pageno", required = false, defaultValue = "1") int 페이지번호,
				@RequestParam(value = "pstate", required = false, defaultValue = "1") int 물품상태, HttpSession session) {
			
			int 페이지당물품수 = 5;
			// int 시작물품물DB인덱스 = (페이지번호-1) * 페이지당물품물수;
			int 블럭끝물품물일련번호 = 페이지번호 * 페이지당물품수;
			int 시작물품일련번호 = 블럭끝물품물일련번호 - (페이지당물품수 - 1);
			
			
			int 로그인한회원의번호=(int)session.getAttribute("mno");
																
			Object[] 내물품목록과물품수 = 물품서비스.내물품을수집하다(로그인한회원의번호, 물품상태, 시작물품일련번호, 페이지당물품수);
			

			int 수집된물품물수 = (int) 내물품목록과물품수[1];
			int 마지막페이지번호 = (수집된물품물수 / 페이지당물품수) + ((수집된물품물수 % 페이지당물품수 > 0) ? 1 : 0);
					System.out.println("내물품마지막페이지번호 "+마지막페이지번호);
			ModelAndView mv=new ModelAndView();
			mv.setViewName("product/내물품목록창");
			mv.addObject("mproducts", 내물품목록과물품수[0]);
			mv.addObject("pageNo", 페이지번호);
			mv.addObject("lastPageNo", 마지막페이지번호);
			mv.addObject("pstate", 물품상태);
			return mv;
		}
		// 내물품글 상세 조회
		@GetMapping("/mproduct_detail/{pno}")
		public ModelAndView mproduct_detail(@PathVariable int pno, HttpSession session) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("product/내물품상세창");
			Product product = 물품서비스.product_detail(pno);
			mv.addObject("product", product);

			if(session!=null) {
				Integer loginMno=(Integer)session.getAttribute("mno");
			if(loginMno!=null) { //로그인된 경우
				boolean 눌렀었다 = 물품서비스.눌렀냐(pno, loginMno);
				mv.addObject("눌렀었다",눌렀었다);
				 
				Boolean 로그인회원와물품물작성자가동일인물인가=null;
				//로그인 회원와 물품물 작성자가 동일 인물
				if(loginMno==product.getUser().getMno()) {
					 로그인회원와물품물작성자가동일인물인가=true;
				}
				else //로그인 회원와 물품물 작성자가 다른 인물
				{
					로그인회원와물품물작성자가동일인물인가=false;
				}
				mv.addObject("isWriter", 로그인회원와물품물작성자가동일인물인가);
				mv.addObject("loginMno", loginMno);
			  }
		    	
		    }
			return mv;
		}
			
		
		@PostMapping("/reply_ready")
		public String 댓글작성하다(Reply reply) {
			물품서비스.댓글등록하다(reply);
			
			return "redirect:/product_detail/"+reply.getPno();
		}
		
		@PostMapping("/getReplyList")
		public @ResponseBody List<Reply>  댓글목록출력하다(@RequestParam("pno") int 물품번호){
			return 물품서비스.댓글목록수집하다(물품번호);
		}
		
		@PostMapping("/reply_save")
		public @ResponseBody String 댓글등록하다(@RequestBody replyDate 댓글data, HttpSession session){
			int 로그인한회원의번호=(int)session.getAttribute("mno");
			Member 작성한회원= new Member();			
			작성한회원.setMno(로그인한회원의번호);
			Product 댓글작성물품 = new Product();
			댓글작성물품.setPno(댓글data.getPno());
			
			Reply 댓글 = new Reply();			
			댓글.setMno(작성한회원);		
			댓글.setPno(댓글작성물품);
			댓글.setContents(댓글data.getContents());
			
			물품서비스.댓글등록하다(댓글);
			
			return "ok";
		}
	
		@PostMapping("/reply_update")
		public @ResponseBody String 댓글변경하다(@RequestBody replyDate 댓글data, HttpSession session){
			int 로그인한회원의번호=(int)session.getAttribute("mno");
			Member 작성한회원= new Member();			
			작성한회원.setMno(로그인한회원의번호);
			
			Reply 댓글 = new Reply();
			댓글.setContents(댓글data.getContents());
			댓글.setRno(댓글data.getRno());
			댓글.setMno(작성한회원);		

			물품서비스.댓글수정하다(댓글);
			return "ok";
		}
		
		@PostMapping("/reply_delete")
		public @ResponseBody String 댓글삭제하다(@RequestBody replyDate 댓글data, HttpSession session) {
			int 로그인한회원의번호=(int)session.getAttribute("mno");			
			System.out.println(댓글data.getRno()+ "------- " + 댓글data.getMno());
			물품서비스.댓글삭제하다(댓글data.getRno(), 로그인한회원의번호);
			return "ok";
		}
			
}
