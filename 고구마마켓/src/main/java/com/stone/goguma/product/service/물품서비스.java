package com.stone.goguma.product.service;

import java.sql.Timestamp;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.goguma.member.common.Member;
import com.stone.goguma.product.common.Heart;
import com.stone.goguma.product.common.Product;
import com.stone.goguma.product.common.Reply;
import com.stone.goguma.product.dataservice.I물품DAO;

@Service
public class 물품서비스 implements I물품서비스 {
	@Autowired I물품DAO 물품DAO;

	@Override
	public void 물품을등록하다(Product product) {
		물품DAO.저장하다(product);
	}

	@Override
	public boolean 물품작성이가능한가() {
		return true;
	}
//
//	@Override
//	public List<Product> 모든물품을수집하다() {
//		return 물품DAO.모든물품을수집하다();
//	}

	// 물품 상세 조회
	@Override
	public Product 물품상세보다(int pno) {
		Product product = 물품DAO.물품상세보다(pno);
		return product;
	}
	// 상세보기의 사진을 찾기 위해 번호 조회
	@Override
	public Product 사진찾다(int pno) {
		Product product = 물품DAO.사진찾다(pno);
		return product;
	}
		@Override
	public void 물품을삭제하다(int 물품번호) {
		물품DAO.삭제하다(물품번호);
	}
	@Override
	public void 물품을변경하다(Product 변경할물품, int 이미지변경여부) {
		물품DAO.변경하다(변경할물품, 이미지변경여부);
	}
	@Override
	public Product 물품변경준비하다(int 물품번호) {
		return 물품DAO.물품상세보다(물품번호);
	}
	@Override
	public void 물품상태를변경하다(int 물품번호, int 상태) {
		if(상태 == 1) {
			상태 = 0;
			물품DAO.물품상태를변경하다(물품번호, 상태);
		}else{
			상태 = 1;
			물품DAO.물품상태를변경하다(물품번호, 상태);
		}
	}
	@Override
	public Object[] 좋아요한물품을수집하다(int 로그인한회원번호, int 시작물품일련번호, int 페이지당물품수) {
		return 물품DAO.좋아요한물품을수집하다(로그인한회원번호, 시작물품일련번호, 페이지당물품수);
	}


	////////////////////////////////////////////////////////////////////
	@Override
	public Object[] 전체중고물품과물품수를수집하다(int 시작물품일련번호, int 페이지당물품수){
		
		return 물품DAO.중고물품과물품수를수집하다(시작물품일련번호, 페이지당물품수);
	}
	
	@Override
	public Object[] 검색한중고물품과물품수를수집하다(int 시작물품일련번호, int 페이지당물품수, String 검색어){
		
		return 물품DAO.검색한중고물품과물품수를수집하다(시작물품일련번호, 페이지당물품수, 검색어);
	}
	
	//좋아요
	@Override
	public boolean 눌렀냐(int 제품번호, int 회원번호) {
		return 물품DAO.눌렀냐(제품번호,회원번호);
	}

	@Override
	public void 좋아요를변경하다(int 제품번호,int 회원번호, boolean 좋아요) {
		if(좋아요) {
			Product 제품=new Product();
			제품.setPno(제품번호);
			Member 한회원=new Member();
			한회원.setMno(회원번호);
			Heart 추가하트 = new Heart();
			추가하트.setProduct(제품);
			추가하트.setMember(한회원);
			물품DAO.insertHeartM(추가하트);
		}else {
			물품DAO.deleteHeartM(제품번호, 회원번호 );
		}
	}

	/////////////////////////////////////////////////////////////////// 2022-02-18 윤원씨
	@Override
	public Object[] 내물품을수집하다(int 멤버번호, int 물품상태, int 시작일련번호, int 페이지당게시물수) {
		// TODO Auto-generated method stub
		return 물품DAO.내물품을수집하다(멤버번호, 물품상태, 시작일련번호, 페이지당게시물수);
	}

//		@Override
//		public Product 물품을조회하다And조회수증가하다(int 물품번호) {
//			return 물품DAO.물품을찾다And조회수증가하다(물품번호);
//		}
	// 물품 상세 조회
	@Override
	public Product product_detail(int pno) {
		Product product = 물품DAO.물품상세보다(pno);
		return product;
	}
	// 상세보기의 사진을 찾기 위해 번호 조회

	
	//
	@Override
	public List<Reply> 댓글목록수집하다(int 물품번호) {
		return 물품DAO.댓글목록수집하다(물품번호);
	}

	@Override
	public void 댓글등록하다(Reply 댓글) {
		물품DAO.댓글저장하다(댓글);			
	}

	@Override
	public void 댓글수정하다(Reply 댓글) {
		물품DAO.댓글수정하다(댓글);
	}

	@Override
	public void 댓글삭제하다(int 댓글번호, int 로그인한회원의번호) {
		물품DAO.댓글삭제하다(댓글번호, 로그인한회원의번호);
	}
			
}
