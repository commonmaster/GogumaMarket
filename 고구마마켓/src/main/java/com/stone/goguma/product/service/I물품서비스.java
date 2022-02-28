package com.stone.goguma.product.service;


import java.sql.Timestamp;
import java.util.List;

import com.stone.goguma.product.common.Product;
import com.stone.goguma.product.common.Reply;

public interface I물품서비스 {
	public  boolean 물품작성이가능한가();	
	public void 물품을등록하다(Product product);
//	public List<Product> 모든물품을수집하다();
	public Product 물품상세보다(int pno);
	public Product 사진찾다(int pno);
	public void 물품을삭제하다(int 물품번호);
	public void 물품을변경하다(Product 변경할물품, int 이미지변경여부);
	public Product 물품변경준비하다(int pno);
	public void 물품상태를변경하다(int 물품번호, int 상태);
	public Object[] 좋아요한물품을수집하다(int 로그인한회원번호, int 시작물품일련번호, int 페이지당물품수);
	//////////////////////////////////////////////////////
	public Object[] 전체중고물품과물품수를수집하다(int 시작물품일련번호, int 페이지당물품수);
	public Object[] 검색한중고물품과물품수를수집하다(int 시작물품일련번호, int 페이지당물품수, String 검색어);
	
	//좋아요
	public boolean 눌렀냐(int 제품번호, int 회원번호);
	public void 좋아요를변경하다(int 제품번호,int 회원번호, boolean 좋아요); //좋아요가 참이면 삽입, 반대면 삭제
	
	//
	public List<Reply> 댓글목록수집하다(int 물품번호);
	public void 댓글등록하다(Reply 댓글);
	public void 댓글수정하다(Reply 댓글);
	public void 댓글삭제하다(int 댓글번호, int 로그인한회원의번호);
	
	
	////////////////////////2022-02-18 윤원씨
	public Object[] 내물품을수집하다(int 멤버번호,int 물품상태,int 시작일련번호,int 페이지당게시물수);
	public Product product_detail(int pno);
}
