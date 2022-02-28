package com.stone.goguma.product.dataservice;

import java.util.List;

import com.stone.goguma.product.common.Heart;
import com.stone.goguma.product.common.Product;
import com.stone.goguma.product.common.Reply;

public interface I물품DAO {
	
	void 저장하다(Product product);
	
	public Object[] 내물품을수집하다(int 멤버번호,int 물품상태,int 시작일련번호, int 페이지당게시물수); // 내물품 목록 찾기
	public Object[] 중고물품과물품수를수집하다(int 시작일련번호, int 페이지당게시물수); // 전체 물품 목록 찾기
	public Object[] 검색한중고물품과물품수를수집하다(int 시작일련번호, int 페이지당게시물수, String 검색어); // 검색한 물품 목록 찾기
	public Object[] 좋아요한물품을수집하다(int 회원번호, int 시작일련번호, int 페이지당게시물수);
	
	public Product 물품상세보다(int pno);
	public Product 사진찾다(int pno);
	
	public void 변경하다(Product 변경할물품, int 이미지변경여부);	
	public int 물품상태를변경하다(int 물품번호, int 상태);

	public void 삭제하다(int 삭제할물품번호);
	
	//Heart
	boolean 눌렀냐(int 제품번호, int 회원번호);
	void deleteHeartM(int 제품번호, int 회원번호);
	public int insertHeartM(Heart 추가하트);
	
	//Reply
	public List<Reply> 댓글목록수집하다(int 물품번호);
	public void 댓글저장하다(Reply 댓글);
	public void 댓글수정하다(Reply 댓글);
	public void 댓글삭제하다(int 댓글번호, int 로그인한회원의번호);

	
	
}
