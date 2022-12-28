package com.lec.mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lec.mvc.dao.UserDAO;
import com.lec.mvc.vo.UserVO;

@Controller
public class LoginController {
	
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login(UserVO user, HttpSession sess) {
		
		
		user.setId("zxpo8422");
		user.setName("한솔");
		user.setPassword("0430");
		user.setRole("유저");
		// user로 넘겼지만 받을땐 userVO로 받아진다. 그냥 타입이랑 변수랑 같게 하는게 마음편하다.
		
		sess.setAttribute("isLoginSuccess", true);
		// sess은 스코프 영역이라서 넘어가는게 좀 다르다.
			
		return "login/login.jsp";}
	

	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVO userVO, UserDAO userDAO, HttpSession sess) {
		
		UserVO user = userDAO.getUser(userVO.getId());
   //3. 정보를 담음   //2.DAO처리  // 1.input받은 정보
		
		if(user == null) {
			sess.setAttribute("isLoginSuccess", false);
			return "login/login.jsp";
		}
		
		if(!user.getPassword().equals(userVO.getPassword())) {
			sess.setAttribute("matchedPassword", false);
			return "login/login.jsp";
		} else {
			sess.setAttribute("matchedPassword", true);
		}
		
		if(user.getId().equalsIgnoreCase(userVO.getId())) {
			sess.setAttribute("user", user);	 // sess에 객체를 통째로 계속 가지고 있게하기 (로그인되어있게)
			sess.setAttribute("perPage", 10);
			if(user.getRole().equalsIgnoreCase("ADMIN")) {  //관리자 권한
				sess.setAttribute("isAdmin", true);
			} else {
				sess.setAttribute("isAdmin", false);
			}
			return "login/logout.jsp";
		} else {
			sess.setAttribute("isLoginSuccess", false);
		} return "login/login.jsp";
	}
	
	
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public String logout(UserVO userVO, HttpSession sess) {
		sess.invalidate(); // 정보를 날림
		return "index.jsp";
	}
	
	
	
	
	
	
	
	
	
	
}
	
