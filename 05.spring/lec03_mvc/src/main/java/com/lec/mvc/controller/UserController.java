package com.lec.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.lec.mvc.service.UserService;
import com.lec.mvc.vo.UserVO;

@Controller
public class UserController {

	@Autowired  // userServiceImpl의 @Service가 연결된 부분인 것 같다.
	private UserService userService;

//	@PathVariable                PathVariable 사용법도 있다. 궁금하면 찾아보기
//	@RequestMapping("getUserList.do/{1}")   
	@RequestMapping("getUserList.do")
	public String getUserList(UserVO userVO,Model model,
			@RequestParam(defaultValue="1") int p,
			@RequestParam(defaultValue="10") int perPage) {
		
		//PageInfo pageInfo;
			
		model.addAttribute("userList", userService.getUserList(p, perPage));
		
		
		return "user/user_list.jsp";
		
	}
			
	
	
	@RequestMapping("insertUser.do")
	public String insertUser(UserVO user) {
		int insertCount = userService.insertUser(user);
		return "getUserList.do";
	}
	
	
	@RequestMapping(value="/deleteUser.do", method=RequestMethod.GET)
	public String deleteUserView(@RequestParam String id) {
		return "user/user_delete.jsp?id=" + id;
	}
	
	@RequestMapping(value="/deleteUser.do", method=RequestMethod.POST)
	public String deleteUser(@RequestParam String id) {
		int deleteCount = userService.deleteUser(id);
		return "getUserList.do";
	}
	
//	@RequestMapping("updateUser.do")
//	public String updateUser(UserVO user) {
//		int deleteCount = userService.updateUser(user);
//		return "getUserList.do";
//	}
	
	
	
}
