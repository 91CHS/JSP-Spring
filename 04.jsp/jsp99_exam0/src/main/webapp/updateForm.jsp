<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

int custno = Integer.parseInt(request.getParameter("custno"));
String custname = "";
String phone    = "";
String address  = "";
Date joindate = null;
String grade    = "";
String city     = "";


Class.forName("oracle.jdbc.OracleDriver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String usr = "scott";
String pwd = "tiger";
String sql = "select * from member_tbl_02 where custno = " + custno ;

try {
	conn = DriverManager.getConnection(url, usr, pwd);
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	
	if(rs.next()) {
		custname = rs.getString("custname");
		phone    = rs.getString("phone");
		address  = rs.getString("address");
		joindate = rs.getDate("joindate");
		grade    = rs.getString("grade");
		city     = rs.getString("city");
	} else {
		out.write("<h3>" + custno + "를 찾지 못했습니다!!</h3>");
	}
} catch(Exception e) {
	out.write("<h3>DB접속실패!!!</h3><br>");			
} finally {
	try {
		if(rs != null) rs.close();
		if(stmt != null) stmt.close();
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
		<h3>홈쇼핑 회원 정보 수정</h3>
		
		<form action="updateMember.jsp" method="post">
		
		
			<table border="1">
			
				<tr>
					<td >회원번호(자동발생)</td>
					<td><input type="text" name="" value="<%= custno %>" disabled></td>
					    <input type="hidden" name="custno" value="<%=custno%>" >
				</tr>	
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" value="<%= custname %>" ></td>
				</tr>	
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" value="<%= phone %>" ></td>
				</tr>	
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" value="<%= address %>" ></td>
				</tr>	
				<tr>
					<td>가입일자</td>
					<td><input type="date" name="joindate" value="<%= joindate %>"></td>
				</tr>	
				<tr>
					<td>고객등급(A:VIP,B:일반,C:직원)</td>
					<td><input type="text" name="grade" value="<%= grade %>" ></td>
				</tr>	
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value="<%= city %>" ></td>
				</tr>	

				</tr>	
			</table>	
			<input type="submit" value="수정"/>
			<button><a href="listMember.jsp">조회</a></button>
		</form>
		
	
		</div>
	</section>
	<footer style="text-align : center; background-color: brown; color: white;" > HRDKOREA Copyright&copy;2016 All rights reserved Human Resources Development Service of Korea. </footer>
</body>
</html>