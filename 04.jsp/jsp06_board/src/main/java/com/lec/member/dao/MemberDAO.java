package com.lec.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import com.lec.db.JDBCUtility;
import com.lec.db.JDBCUtility2;
import com.lec.member.vo.MemberBean;

public class MemberDAO {
		
	private MemberDAO() {}
	private static MemberDAO memberDAO;
	public static MemberDAO getInstance() { 
		if(memberDAO == null) memberDAO = new MemberDAO();
		return memberDAO; 
}

	Connection conn = null;
	DataSource ds = null;
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	// 회원가입
	public int insertMember(MemberBean member) {
		
		PreparedStatement pstmt = null;
		String sql = "insert into member(member_id , member_pw, member_name, member_age, member_gender, member_email)"
				               + "values(?,?,?,?,?,?)" ; 
		
		int insertCount = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getMember_pw());
			pstmt.setString(3, member.getMember_name());
			pstmt.setInt(4, member.getMember_age());
			pstmt.setString(5, member.getMember_gender());
			pstmt.setString(6, member.getMember_email());
			insertCount = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원 등록 실패!!! : " + e.getMessage());
		} finally {
			JDBCUtility2.close(null, pstmt, null);
		}
		return insertCount;
	}

	
	// 로그인
	public boolean loginMember(String member_id,String member_pw) {
		
		boolean isLogin = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where member_id = " + member_id ;
				                           
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			if(member_pw.equals(rs.getString("member_pw"))) isLogin = true;
	
		} catch (Exception e) {
			System.out.println("비밀번호가 틀립니다. 다시 입력하세요!! " + e.getMessage());
		} finally {
			JDBCUtility.close(null, pstmt, null);
		}

		return isLogin;
	}
	
	
	
	
	
	
	
	
	
	
}

















