package com.stone.goguma.loginout.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stone.goguma.member.common.Member;
import com.stone.goguma.member.dataservice.I회원DAO;

@Service
public class 로그인아웃서비스 {

	@Autowired
	I회원DAO 회원DAO;
	
	public int 로그인서비스(String id, String password) {
		
		Member 찾은회원 = 회원DAO.get회원ById(id);
		if(찾은회원 == null) {
			return -99;
		}
		else {
			if(password.equals(찾은회원.getPassword()))
				return 찾은회원.getMno();
			else {
				return -1;
			}
		}
	}
}
