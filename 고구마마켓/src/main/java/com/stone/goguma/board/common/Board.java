package com.stone.goguma.board.common;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.stone.goguma.member.common.Member;



public class Board {
	private int bno;
	private String title;
	private String contents;
	private Member writer;//객체간의 관계는 참조로 구현한다.
	private int views; //조회수
	private Timestamp date;
	private String date_str;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public Member getWriter() {
		return writer;
	}
	public void setWriter(Member writer) {
		this.writer = writer;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}	
	
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	public String getDate_str() {
		Date d = new Date(date.getTime());
		SimpleDateFormat f = new SimpleDateFormat("YYYY-MM-dd hh:mm");
		String s = f.format(d);
		
		return s;
	}
	public void setDate_str(String date_str) {
		this.date_str = date_str;
	}
	
	
	
	
}
