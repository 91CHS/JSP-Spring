package com.lec.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.member.service.LoginService;
import com.lec.member.vo.ActionFoward;
import com.lec.member.vo.MemberBean;

public class LoginAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		ActionFoward forward = null;
		
		
		
		String member_id = req.getParameter("member_id");
		String member_pw = req.getParameter("member_pw");
		

		LoginService loginService = new LoginService();
		boolean isLogin = loginService.loginMember(member_id,member_pw);
			
		if(isLogin) {
			forward = new ActionFoward();
			forward.setRedirect(true);
			forward.setPath("index.jsp");	
		} else {
			res.setContentType("text/html; charset=UTF-8" );
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("   alert('로그인에 실패했습니다!!')");
			out.println("   history.back();");
			out.println("</script>");
		}
	
		return forward;
	}

}











