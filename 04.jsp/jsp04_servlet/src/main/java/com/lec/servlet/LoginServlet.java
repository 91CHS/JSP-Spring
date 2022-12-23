package com.lec.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")

public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String[] hobbies = req.getParameterValues("hobbies");
		String major  = req.getParameter("majors");
		String protocol  = req.getParameter("protocol");
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.println("<html>");
		writer.println("<head><title>Login Servlet!! </title></head>");
		writer.println("<body>");
		writer.println("아이디 = " + id + "<br>");
		writer.println("비밀번호 = " + pw + "<br>");
		writer.println("취미 = " + Arrays.toString(hobbies) + "<br>");
		writer.println("전공 = " + major + "<br>");
		writer.println("프로토콜 = " + protocol + "<br>");
		writer.println("</body>");
		writer.println("</html>");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
