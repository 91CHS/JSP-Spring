<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<header> <h2 style="text-align : center; background-color: brown; color: white;" >쇼핑몰 회원관리 ver 1.0</h2> </header>
	<nav>
		<ul style="list-style: none; background-color: green; color: white;" >
			<li style="display:inline; margin-left: 10px;"><a href="insertForm.jsp">회원등록</a></li>
			<li style="display:inline; margin-left: 30px;"><a href="listMember.jsp">회원목록조회/수정</a></li>
			<li style="display:inline; margin-left: 30px;"><a href="memberMoney.jsp">회원매출조회</a></li>
			<li style="display:inline; margin-left: 30px;"><a href="index.jsp">홈으로.</a></li>
		</ul>
	</nav>
	<section>
	  <div align="center">
		<h3>회원목록조회/수정</h3>
		
		 	<table border="1">
		 	
		 		<tr>
		 			<th>회원번호</th>
		 			<th>회원성명</th>
		 			<th>전화번호</th>
		 			<th>주소</th>
		 			<th>가입일자</th>
		 			<th>고객등급</th>
		 			<th>거주지역</th>
		 		</tr>
  <%
	Class.forName("oracle.jdbc.OracleDriver");
	   Connection conn = null;
	   PreparedStatement stmt = null;
	   ResultSet rs = null;
	   
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String usr = "scott";
		String pwd = "tiger";
		String sql = "select * from member_tbl_02";
		
	try {
		conn = DriverManager.getConnection(url, usr, pwd);
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		while(rs.next()) {
			int custno      = rs.getInt("custno");
			String custname = rs.getString(2);
			String phone    = rs.getString(3);
			String address  = rs.getString(4);
			Date joindate   = rs.getDate(5);
			String grade    = rs.getString(6);
			String city     = rs.getString(7);
			
%>
		<tr>
			<td><a href="updateForm.jsp?custno=<%=custno%>"><%=custno%></a></td>
			<td><%= custname %></td>
			<td><%= phone %></td>
			<td><%= address %></td>
			<td><%= joindate %></td>
			<td><%= grade %></td>
			<td><%= city %></td>
	    </tr>
	<%						
 }
	} catch(Exception e) {
		out.write("<h3 class='bg-danger text-white'>DB접속실패!!!</h3><br>" + e.getMessage());			
	} finally {
		// 5. close() DB 연결 해제
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			// dummy
		}
	}					
%>		 	 	
		 </table>	
	  </div>
	</section>
	<footer style="text-align : center; background-color: brown; color: white;" > HRDKOREA Copyright@2016 All rights reserved Human Resources Development Service of Korea. </footer>
</body>
</html>