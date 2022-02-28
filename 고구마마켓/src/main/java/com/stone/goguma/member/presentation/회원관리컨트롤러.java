package com.stone.goguma.member.presentation;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.servlet.ModelAndView;

import com.stone.goguma.member.common.Member;
import com.stone.goguma.member.service.I회원관리서비스;

@Controller
public class 회원관리컨트롤러 {

	@Autowired
	I회원관리서비스 회원관리서비스;

	@GetMapping("/join")
	public String 회원가입화면을준비하다() {

		return "member/회원가입";
	}

	@GetMapping("/duplication")
	public String ID중복체크화면을준비하다() {

		return "member/id중복확인";
	}

	@PostMapping("/duplication")
	public ModelAndView ID중복체크하다(String id) {

		boolean canUse = 회원관리서비스.ID사용가능확인서비스(id);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/id중복확인");
		mav.addObject("canUse", canUse);
		mav.addObject("id", id);

		return mav;

	}

	@GetMapping("/profile/{회원번호}") // 예 /profile/1
	public ModelAndView 제품사진을주다(@PathVariable("회원번호") int mno) {
		ModelAndView mav = new ModelAndView();

		Member 찾은회원 = 회원관리서비스.회원찾기서비스ByMno(mno);

		mav.setViewName("member/프로필");
		mav.addObject("profile", 찾은회원.getProfile());

		return mav;
	}

	@PostMapping("/join")
	public ModelAndView 회원가입하다(Member member, HttpSession session) {

		ModelAndView mav = new ModelAndView();

		Integer success = 회원관리서비스.회원등록서비스(member);

		System.out.println("성공" + success);

		if (success == 1) {
			mav.addObject("name", member.getName());
			mav.setViewName("member/회원가입결과창");
			Member 찾은회원 = 회원관리서비스.회원찾기서비스ById(member.getId());
			session.setAttribute("회원번호", 찾은회원.getMno());

		} else {
			mav.addObject("id", "이미사용중인ID");
			// 중복확인을 했으나 그 사이에 이미 아이디 등록됨
			mav.setViewName("forward:/join");
		}

		return mav;

	}

	@GetMapping("/member")
	public ModelAndView 회원정보화면을준비하다(HttpSession session) {

		ModelAndView mav = new ModelAndView();

		Integer 회원번호 = (Integer) session.getAttribute("mno");
		// System.out.println("id:" + id);
		if (회원번호 == null) {
			mav.setViewName("login/로그인");
			System.out.println("로그인 안됨 에러");
		} else {

			Member member = 회원관리서비스.회원찾기서비스ByMno(회원번호);
			if (member != null) {
				mav.setViewName("member/회원정보");
				mav.addObject("member", member);
				if (member.getProfile() != null) {
					if (member.getProfile().length == 0) {
						mav.addObject("profileSetting", false);
					} else {
						mav.addObject("profileSetting", true);
					}
				}else {
					mav.addObject("profileSetting", false);
				}

			} else {
				System.out.println("DB에서 회원 정보가져오지 못했거나 없음");
			}
		}
		return mav;
	}

	@PostMapping("/member")
	public ModelAndView 회원정보변경하다(Member member, int isImgChange) {

		ModelAndView mav = new ModelAndView();

		Boolean isSuccess = 회원관리서비스.회원정보변경서비스(member, isImgChange);
		if (isSuccess == null) {

			mav.setViewName("error");
		} else {
			mav.setViewName("member/회원정보변경결과");
			mav.addObject("isSuccess", isSuccess);
		}

		return mav;
	}

	@GetMapping("/pwd_change")
	public String 비밀번호변경화면을준비하다() {

		return "member/비밀번호변경";
	}

	@PostMapping("pwd_change")
	public ModelAndView 비밀번호변경하다(HttpSession session, String origin_password, String password) {

		ModelAndView mav = new ModelAndView();

		int 회원번호 = (int) session.getAttribute("mno");
		Boolean isSuccess = 회원관리서비스.비밀번호변경서비스(회원번호, origin_password, password);
		if (isSuccess == null) {

			mav.setViewName("error");
		} else {
			mav.setViewName("member/비밀번호변경결과");
			mav.addObject("isSuccess", isSuccess);
		}

		return mav;
	}

	@GetMapping("/withdraw")
	public ModelAndView 회원탈퇴준비하다(HttpSession session, Integer incorrect) {
		int 회원번호 = (int) session.getAttribute("mno");
		Member 탈퇴할회원 = 회원관리서비스.회원찾기서비스ByMno(회원번호);
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", 탈퇴할회원);
		mav.addObject("incorrect", incorrect);
		mav.setViewName("member/회원탈퇴확인");
		
		
		return mav;
	}

	@PostMapping("/withdraw")
	public ModelAndView 회원탈퇴하다(HttpSession session, String password) {

		ModelAndView mav = new ModelAndView();
		int 회원번호 = (int) session.getAttribute("mno");
		Member 회원 = 회원관리서비스.회원찾기서비스ByMno(회원번호);
		if(회원.getPassword().equals(password)) {
			회원관리서비스.회원탈퇴서비스(회원번호);
			session.invalidate();					
			mav.setViewName("redirect:/main");
		}
		else {
			mav.addObject("incorrect",1);
			mav.setViewName("redirect:/withdraw");
		}
		
		return mav;
	}

}
