package com.stone.goguma.product.common;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import com.stone.goguma.member.common.Member;


public class Product {
	

private int pno;	     //물품번호
private String title; 	 //물품명
private int price; 		 //물품가격
private String contents; //물품설명
private int pstate;   //물품상태
private Member user;    //물품 등록 객체
private int likecnt; 				//물품 좋아요 갯수
private int views;				 //물품 조회수
private Date date; 		 		//물품 등록 날짜
private Timestamp modifyDate;
private MultipartFile picturefile;//업로드된 파일 매칭요
private byte [] picture;          // 프로필사진 (데이터)  
private double latitude;
private double longitude;
private String address;


public int getPno() {
	return pno;
}
public void setPno(int pno) {
	this.pno = pno;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public String getContents() {
	return contents;
}
public void setContents(String contents) {
	this.contents = contents;
}
public int getPstate() {
	return pstate;
}
public void setPstate(int pstate) {
	this.pstate = pstate;
}

public Member getUser() {
	return user;
}
public void setUser(Member user) {
	this.user = user;
}
public int getLikecnt() {
	return likecnt;
}
public void setLikecnt(int likecnt) {
	this.likecnt = likecnt;
}
public int getViews() {
	return views;
}
public void setViews(int views) {
	this.views = views;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}

public Timestamp getModifyDate() {
	return modifyDate;
}
public void setModifyDate(Timestamp modifyDate) {
	this.modifyDate = modifyDate;
}
public MultipartFile getPicturefile() {
	return picturefile;
}
public void setPicturefile(MultipartFile picturefile) {
	this.picturefile = picturefile;
}
public byte[] getPicture() {
	if(picturefile != null && picture == null) {
		try {
			picture = picturefile.getBytes();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	return picture;
}
public void setPicture(byte[] picture) {
	this.picture = picture;
}

public double getLatitude() {
	return latitude;
}
public void setLatitude(double latitude) {
	this.latitude = latitude;
}
public double getLongitude() {
	return longitude;
}
public void setLongitude(double longitude) {
	this.longitude = longitude;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}

}
