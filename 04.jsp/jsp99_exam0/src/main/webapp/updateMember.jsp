<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
int custno = Integer.parseInt(request.getParameter("custno"));
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");


Connection conn = null;
PreparedStatement pstmt = null;

int count = 0;
boolean isConn = true;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String usr = "scott";
String pwd = "tiger";
String sql = "update member_tbl_02 set custname=?,phone=?,address=?,joindate=?,grade=?,city=?  where custno= ? ";

try {
	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url, usr, pwd);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, custname);
	pstmt.setString(2, phone);
	pstmt.setString(3, address);
	pstmt.setString(4, joindate);
	pstmt.setString(5, grade);
	pstmt.setString(6, city);
	pstmt.setInt(7, custno);
	count = pstmt.executeUpdate();
} catch(Exception e) {
	isConn = false;
	out.write("<h3>DB접속실패!!!</h3><br>" + e.getMessage());		
} finally {
	try {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	} catch(Exception e) {
		// dummy
	}
}	

%>
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
	
		<h1>회원정보수정하기</h1>
		

		
			<% if(isConn){%>
			<script>alert('회원정보수정이 완료 되었습니다.')</script>
			    <h3>회원이 성공적으로 수정되었습니다.</h3>
				회원번호   : <%= custno %> <br>
				회원성명   : <%= custname %> <br>
				회원전화   : <%= phone %> <br>
				회원준소   : <%= address %> <br>
				기입일자   : <%= joindate %> <br>
				고객등급   : <%= grade %> <br>
				도시코드   : <%= city %> <br>
				
			<% } else { %>

				<h3 >회원수정을 실패했습니다!!</h3>
				
			<% } %>
			

			<button><a href="listMember.jsp">회원목록</a></button>



	</section>
	<footer style="text-align : center; background-color: brown; color: white;" > HRDKOREA Copyright&copy;2016 All rights reserved Human Resources Development Service of Korea. </footer>
</body>
</html>