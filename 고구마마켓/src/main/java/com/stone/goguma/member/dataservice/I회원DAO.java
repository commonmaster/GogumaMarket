package com.stone.goguma.member.dataservice;

import com.stone.goguma.member.common.Member;

public interface I회원DAO {

	Integer insert회원(Member 새회원);

	Member get회원ByNo(int no);

	Member get회원ById(String id);

	boolean 아이디가있는가(String id);

	Boolean 비밀번호일치조회ByNo(int no, String pwd);

	int update비밀번호(int no, String pwd);

	int update회원정보(Member 회원, int 이미지변경여부);

	void delete회원ByNo(int no);

}