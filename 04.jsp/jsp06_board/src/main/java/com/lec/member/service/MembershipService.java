package com.lec.member.service;

import java.sql.Connection;


import com.lec.db.JDBCUtility2;
import com.lec.member.dao.MemberDAO;
import com.lec.member.vo.MemberBean;

public class MembershipService {

	public boolean joinMember(MemberBean member) {
		
		boolean isJoinSuccess = false;
		
		Connection conn = JDBCUtility2.getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(conn);
		int insertCount = memberDAO.insertMember(member);
		
		if(insertCount>0) {
			JDBCUtility2.commit(conn);
			JDBCUtility2.close(conn, null, null);
			isJoinSuccess = true;
		} else {
			JDBCUtility2.rollback(conn);
		}
		return isJoinSuccess;
	}
	
}
