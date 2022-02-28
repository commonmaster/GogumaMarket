package com.stone.goguma.main.presentation;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import com.stone.goguma.member.service.I회원관리서비스;
import com.stone.goguma.product.service.I물품서비스;

@Controller
public class 메인컨트롤러 {

	@Autowired
	I회원관리서비스 회원관리서비스;
	@Autowired
	I물품서비스 물품서비스;

	@GetMapping("/main")
	public ModelAndView 메인화면을준비하다(HttpSession session) {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("main/메인");

		return mav;
	}

}
