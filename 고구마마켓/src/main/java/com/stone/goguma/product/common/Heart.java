package com.stone.goguma.product.common;

import com.stone.goguma.member.common.Member;

public class Heart {
	private int hno; // 일련번호
	private Product product;
	private Member member;
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
}
