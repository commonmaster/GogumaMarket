package com.stone.goguma.member.dataservice;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.stone.goguma.member.common.Member;

import config.DBUtil;

@Repository
public class 회원DAO implements I회원DAO {

	@Autowired
	I회원Mapper 회원Mapper;
	
	@Transactional
	@Override
	public Integer insert회원(Member 새회원) {

		return 회원Mapper.insert회원(새회원);
	}

	@Transactional
	@Override
	public Member get회원ByNo(int mno) {

		return 회원Mapper.get회원ByNo(mno);
	}

	@Transactional
	@Override
	public Member get회원ById(String id) {

		return 회원Mapper.get회원ById(id);
	}

	@Transactional
	@Override
	public boolean 아이디가있는가(String id) {

		Member 찾은회원 = 회원Mapper.아이디가있는가(id);
		
		// 찾은회원이 없다면 아이디를 사용가능
		if(찾은회원 != null) {
			System.out.println("찾은 id: " + 찾은회원.getId());
			return true;
		}		
		
		return false;
	}

	@Override
	public Boolean 비밀번호일치조회ByNo(int mno, String pwd) {

		Member 찾은회원 = 회원Mapper.비밀번호일치조회ByNo(mno);
		if(찾은회원 == null) {
			return null;
		}
		else {
			if(pwd.equals(찾은회원.getPassword())){
				return true;
			}
			else {
				return false;
			}
		}
	}

	@Transactional
	@Override
	public int update비밀번호(int mno, String new_password) {

		return 회원Mapper.update비밀번호(mno, new_password);
	}

	
	@Transactional
	@Override
	public int update회원정보(Member member, int 이미지변경여부) {

		int success = -99;
		
		if (이미지변경여부 == 0) {
			success= 회원Mapper.update회원정보(member);
		}
		else {
			success = 회원Mapper.update회원정보이미지포함(member);
		}
		
		return success;
	}

	@Override
	public void delete회원ByNo(int mno) {

		int success = 회원Mapper.delete회원ByNo(mno);
	}	
}
