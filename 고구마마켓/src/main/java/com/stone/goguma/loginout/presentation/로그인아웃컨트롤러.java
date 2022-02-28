package com.stone.goguma.loginout.presentation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stone.goguma.loginout.service.로그인아웃서비스;

@Controller
public class 로그인아웃컨트롤러 {

	@Autowired
	로그인아웃서비스 로그인업무서비스;
	@Autowired
	com.stone.goguma.member.service.I회원관리서비스 회원관리서비스;

	@GetMapping("/login")
	public ModelAndView 로그인화면을준비하다(HttpSession session, HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		
		//System.out.println("요청명 로그인 준비: " + request.getAttribute("prev_url"));
		
		String prev_url = (String)request.getAttribute("prev_url");
		Integer 회원번호 = (Integer) session.getAttribute("mno");
		// 이미 로그인되어 있다면 로그인화면으로 이동
		if (회원번호 != null) {

			mav.setViewName("redirect:/main");
		} else {

			mav.setViewName("login/로그인");
			mav.addObject("prev_url", prev_url);
		}

		return mav;
	}

	@PostMapping("/login")
	public ModelAndView 로그인하다(String id, String password, HttpSession session, String prev_url) {

		ModelAndView mav = new ModelAndView();

//		if(prev_url == null) {
//			System.out.println("주소값 null");
//		}
//		else if(prev_url.trim().equals("")) {
//			System.out.println("주소값 빈칸");
//		}
//		else {
//			System.out.println("도대체 머냐");
//		}
		
		if (id != null && password != null) {

			int result = 로그인업무서비스.로그인서비스(id, password);
			
			// 아이디와 비밀번호가 일치한다면
			if (result > 0) {
					
				session.setAttribute("mno", result);
				
				// 이전 요청이 없다면 메인으로
				if(prev_url == null || prev_url.trim().equals("")) {
					prev_url = "/main";
					
				}			
				System.out.println("redirect:" + prev_url);
				mav.setViewName("redirect:" + prev_url);
				
				System.out.println("로그인 실행");
				
			// 아이디나 비밀번호가 일치하지 않거나 아이디가 없는 경우	
			} else {

				mav.addObject("result", result);
				mav.setViewName("login/로그인");
			}
			
			// 데이터 전달에 이상이 있을 경우
		} else {
			mav.setViewName("error");
		}

		return mav;

	}

	@RequestMapping("/logout")
	public ModelAndView 로그아웃하다(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		mav.setViewName("redirect:/main");

		return mav;
	}

}
