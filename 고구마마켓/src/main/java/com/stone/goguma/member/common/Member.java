package com.stone.goguma.member.common;

import java.io.IOException;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Member {

	private int mno; // 회원번호
	private MultipartFile profileFile;
	private byte[] profile;
	private String id; // 회원아이디
	private String password; // 회원비밀번호
	private String name; // 회원이름
	private String email; // 회원이메일
	private String tel; // 회원연락처
	private int mstate; // 회원상태(가입, 탈퇴 등등)
	private int likeCount; // 좋아요갯수
	// private int likeScore; //좋아요점수
	private Date regDate; // 가입일
	private Date withdrawDate; // 탈퇴일

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public MultipartFile getProfileFile() {
		return profileFile;
	}

	public void setProfileFile(MultipartFile profileFile) {
		this.profileFile = profileFile;
	}

	public byte[] getProfile() {

		if (profileFile != null & profile == null) {
			try {
				profile = profileFile.getBytes();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}

		return profile;
	}

	public void setProfile(byte[] profile) {
		this.profile = profile;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getMstate() {
		return mstate;
	}

	public void setMstate(int mstate) {
		this.mstate = mstate;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

//	public int getLikeScore() {
//		return likeScore;
//	}
//
//	public void setLikeScore(int likeScore) {
//		this.likeScore = likeScore;
//	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getWithdrawDate() {
		return withdrawDate;
	}

	public void setWithdrawDate(Date withdrawDate) {
		this.withdrawDate = withdrawDate;
	}

}
