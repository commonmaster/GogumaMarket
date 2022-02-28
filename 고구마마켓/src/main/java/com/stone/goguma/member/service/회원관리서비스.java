package com.stone.goguma.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.goguma.member.common.Member;
import com.stone.goguma.member.dataservice.I회원DAO;

@Service
public class 회원관리서비스 implements I회원관리서비스 {

	@Autowired
	I회원DAO 회원DAO;	
	
	@Override
	public Integer 회원등록서비스(Member 새회원) {
		
		return 회원DAO.insert회원(새회원);
	}
	
	@Override
	public boolean ID사용가능확인서비스(String id) {
		
		return !회원DAO.아이디가있는가(id);
	}
	
	@Override
	public Member 회원찾기서비스ByMno(int mno) {
		
		return 회원DAO.get회원ByNo(mno);
	}
	
	@Override
	public Member 회원찾기서비스ById(String id) {
		
		return 회원DAO.get회원ById(id);
	}
	
	@Override
	public Boolean 비밀번호변경서비스(int no, String origin_password, String new_password) {
		
		Boolean isInputedCorrect = 회원DAO.비밀번호일치조회ByNo(no, origin_password);
		
		if(isInputedCorrect != null &&  isInputedCorrect) {
			 회원DAO.update비밀번호(no, new_password);
		}
		
		return isInputedCorrect;
		
	}
	
	@Override
	public Boolean 회원정보변경서비스(Member 회원, int 이미지변경여부) {
		
		// 회원정보 변경시 비밀번호가 일치해야 변경됨
		Boolean isInputedCorrect = 회원DAO.비밀번호일치조회ByNo(회원.getMno(), 회원.getPassword());
		if(isInputedCorrect == null) {
		System.out.println("비밀번호 확인값 널 값");
		}
		if(isInputedCorrect != null &&  isInputedCorrect) {
			 회원DAO.update회원정보(회원, 이미지변경여부);
			 System.out.println("작동");
		}
		
		return isInputedCorrect;
	}
	
	@Override
	public void 회원탈퇴서비스(int no) {
		
		회원DAO.delete회원ByNo(no);
	}
}
