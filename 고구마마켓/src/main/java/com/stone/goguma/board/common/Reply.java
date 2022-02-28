package com.stone.goguma.board.common;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.stone.goguma.member.common.Member;

public class Reply {
	int rno;
	Board bno; //게시물 번호
	Member mno; //작성자id
	String contents; //내용
	Timestamp cdate; //작성시간
	String cdate_str;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public Board getBno() {
		return bno;
	}
	public void setBno(Board bno) {
		this.bno = bno;
	}
	public Member getMno() {
		return mno;
	}
	public void setMno(Member mno) {
		this.mno = mno;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getCdate() {
		
				
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}	
	
	public void setCdate_str(String cdate_str) {
		this.cdate_str = cdate_str;
	}
	
	public String getCdate_str() {
		Date d = new Date(cdate.getTime());
		SimpleDateFormat f = new SimpleDateFormat("YYYY-MM-dd hh:mm");
		String s = f.format(d);
		
		return s;
	}
	

	
	
}
