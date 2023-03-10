package com.lec.servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/life"},
			initParams = { @WebInitParam(name="user", value="root", description="사용자아이디")})
public class ServeletLifeCycle extends HttpServlet {

		// 기본생성자
		public ServeletLifeCycle() {super();}

		@PostConstruct
		public void initPostConstruct() {
			System.out.println("1. initPostConstruct() 메서드 실행");
		}

		@Override
		public void init() throws ServletException {
			System.out.println("2. init() 메서드 실행");
		}

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			System.out.println("3. doGet() 메서드 실행");
		}

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			doGet(req,resp);
		}

		@PreDestroy
		public void preDestroy() {
			System.out.println("4. preDestroy() 메서드 실행");
		}

		@Override
		public void destroy() {
			System.out.println("5. destroy()메서드 실행");
		}
}
