package com.lec.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.lec.member.action.Action;
import com.lec.member.action.LoginAction;
import com.lec.member.action.MembershipAction;
import com.lec.member.vo.ActionFoward;



@WebServlet("*.mb")
public class MemberController extends HttpServlet{

	Action action = null;
	ActionFoward forward = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doProcess(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, res);
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {		
		
		req.setCharacterEncoding("utf-8");
		
//		String p = req.getParameter("p");
//		String f = req.getParameter("f");
//		String q = req.getParameter("q");
		
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		// http://localhost:8088/jsp06_board/boardWriteForm.bo
		// System.out.println(requestURI + "\n" + contextPath + "\n" + command);
		
	
		if(command.equals("/memberlogin.mb")) {
			forward = new ActionFoward();
			forward.setPath("/member/member_login.jsp?");
		} 
		
		  else if(command.equals("/memberjoin.mb")) {
			  forward = new ActionFoward();
			  forward.setPath("/member/member_join.jsp?");
		}
		  else if(command.equals("/membersuccess.mb")) {
			  action = new MembershipAction();
			  try { forward = action.execute(req, res); } catch (Exception e) { e.printStackTrace(); }
		} else if(command.equals("/loginsuccess.mb")) {
			action = new LoginAction();
			try { forward = action.execute(req, res); } catch (Exception e) { e.printStackTrace(); }
		}	  
//		} else if(command.equals("/boardModifyForm.bo")) {
//			action = new BoardModifyFormAction();
//			try { forward = action.execute(req, res); } catch (Exception e) { e.printStackTrace(); }
//		} else if(command.equals("/boardModify.bo")) {
//			action = new BoardModifyAction();
//			try { forward = action.execute(req, res); } catch (Exception e) { e.printStackTrace(); }
//		} else if(command.equals("/boardDeleteForm.bo")) {
//			forward = new ActionFoward();
//			forward.setPath("/board/board_delete.jsp?p=" + p + "&f=" + f + "&q=" + q);				
//		} else if(command.equals("/boardDelete.bo")) {
//			action = new BoardDeleteAction();
//			try { forward = action.execute(req, res); } catch (Exception e) { e.printStackTrace(); }			
//		} else if(command.equals("/boardReplyForm.bo")) {
//			action = new BoardReplyFormAction();
//			try { forward = action.execute(req, res); } catch (Exception e) { e.printStackTrace(); }			
//
//		} else if(command.equals("/boardReply.bo")) {
//			action = new BoardReplyAction();
//			try { forward = action.execute(req, res); } catch (Exception e) { e.printStackTrace(); }			
//		} else if(command.equals("/download.bo")) {
//			forward = new ActionFoward();
//			forward.setPath("/board/board_download.jsp?p=" + p + "&f=" + f + "&q=" + q);			
		
		
//		} else if(command.equals("/error.bo")) {
//			
//			System.out.println("==> xxxxxx " + forward.isRedirect());
//	
//			forward = new ActionFoward();
//			forward.setPath("/board/error.jsp");
//			System.out.println(forward.getPath());
//			
//			
//			
//			
//			
//		}
		if(forward != null) {
			if(forward.isRedirect()) {
				res.sendRedirect(forward.getPath());
			} else {				
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, res);
			}
		}
	}

}










