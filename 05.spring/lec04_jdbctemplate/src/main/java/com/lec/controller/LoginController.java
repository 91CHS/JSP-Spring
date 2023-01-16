package com.lec.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lec.jdbc.impl.UserServiceImpl;
import com.lec.jdbc.vo.UserVO;

@Controller
public class LoginController {

	@Autowired
	UserServiceImpl userService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login(UserVO vo) {
		return "login/login.jsp";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(UserVO vo, ModelAndView mav, HttpSession sess) {
		UserVO user = userService.getUser(vo);
		mav.setViewName("user/getUserInfo.jsp");
		sess.setAttribute("user", user);
		return mav.addObject("user", user);
	}	
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession sess) {
		sess.invalidate();
		return "index.jsp";
	}
}