package com.lec.member.service;

import java.sql.Connection;

import com.lec.db.JDBCUtility2;
import com.lec.member.dao.MemberDAO;


public class LoginService {

	public boolean loginMember(String member_id,String member_pw) {
		
		boolean isLogin = false;
		
		Connection conn = JDBCUtility2.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		
		isLogin = memberDAO.loginMember(member_id,member_pw);
		JDBCUtility2.close(conn, null, null);
		return isLogin;
	}

}
