<%@page import="java.sql.DriverManager"%>
<%@page import="member.vo.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// db접솓방법 
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	List<Member> memberList = new ArrayList<>();
	
	// sql 문장하는 법 
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		stmt = conn.prepareStatement("select * from member_tbl_02 order by custno");
		rs = stmt.executeQuery();
		while(rs.next()) {
			Member member = new Member();
			member.setCustNo(rs.getInt("custno"));
			member.setCustName(rs.getString("CUSTNAME"));
			member.setPhone(rs.getString("PHONE"));
			member.setAddress(rs.getString("ADDRESS"));
			member.setJoinDate(rs.getDate("JOINDATE"));
			member.setGrade(rs.getString("GRADE"));
			member.setCity(rs.getString("CITY"));
			memberList.add(member);
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch(Exception e) {
			// dummy
		}
	}
	
	//db에서 읽은 것
	
	String member_table = "<table border='1'>"
			   + "<tr><th>고객번호</th><th>고객이름</th><th>전화번호</th><th>주소</th><th>가입일</th><th>등급</th><th>도시</th></tr>";
	for(Member member:memberList) {
		member_table += "<tr><td><a href='update.jsp?custNo=" +  member.getCustNo() + "'>" + member.getCustNo()+ "</a></td>"
			    + "<td>" + member.getCustName() + "</td>"
			    + "<td>" + member.getPhone() + "</td>"
			    + "<td>" + member.getAddress() + "</td>"
			    + "<td>" + member.getJoinDate() + "</td>"
			    + "<td>" + member.getGrade() + "</td>"
			    + "<td>" + member.getCity() + "</td></tr>";			
	}
	member_table += "</table>";    // 테이블을 만들어서 고대로 출력해도 됩니다~
%>	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	

</head>
<body>
	<header>
		<h1 align="center">회원목록/수정</h1>
	</header>
	
	<div align="center">
<%-- 	   	<%= memberList.toString() %> --%>
		<%= member_table %> <br>
		<button type='button' onclick="location.href='index.jsp'">홈으로 돌아가기</button>
	</div>
</body>
</html>