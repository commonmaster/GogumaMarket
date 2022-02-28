package com.stone.goguma.member.service;

import com.stone.goguma.member.common.Member;

public interface I회원관리서비스 {

	Integer 회원등록서비스(Member 새회원);

	boolean ID사용가능확인서비스(String id);

	Member 회원찾기서비스ByMno(int mno);
	
	Member 회원찾기서비스ById(String id);

	Boolean 비밀번호변경서비스(int no, String origin_password, String new_password);

	Boolean 회원정보변경서비스(Member 회원, int 이미지변경여부);

	void 회원탈퇴서비스(int no);

}