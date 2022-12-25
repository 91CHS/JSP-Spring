package com.lec.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.lec.member.service.MembershipService;
import com.lec.member.vo.ActionFoward;
import com.lec.member.vo.MemberBean;

public class MembershipAction implements Action {

	@Override
	public ActionFoward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		ActionFoward forward = null;
		MemberBean member = null;
		
		try {
			member = new MemberBean();
			member.setMember_id(req.getParameter("member_id"));  
			member.setMember_pw(req.getParameter("member_pw"));
			member.setMember_name(req.getParameter("member_name"));
			member.setMember_age(Integer.parseInt(req.getParameter("member_age")));
			member.setMember_gender(req.getParameter("member_gender"));
			member.setMember_email(req.getParameter("member_email"));
			
			MembershipService membershipService = new MembershipService();
			boolean isJoinSuccess = membershipService.joinMember(member);
			
			if(isJoinSuccess) {
				forward = new ActionFoward();
				forward.setRedirect(true);
				forward.setPath("default.jsp");
			} else {
				res.setContentType("text/html; charset=UTF-8" );
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println("   alert('회원 등록을 실패했습니다!!')");
				out.println("   history.back();");
				out.println("</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			forward = new ActionFoward();
			forward.setRedirect(false);
			forward.setPath("error.mb?");	
	
		}
		return forward;
	}

}
