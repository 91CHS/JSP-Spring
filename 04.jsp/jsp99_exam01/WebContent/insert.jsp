<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

// 손에 익히기 
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	int last_custNo = 0;
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		stmt = conn.prepareStatement("select max(custno)+1 from member_tbl_02");
		rs = stmt.executeQuery();
		if(rs.next()) {
		// 자동으로 번호를 넘버링해주기 위해서
			last_custNo = rs.getInt(1);  
		} else {
			last_custNo = 1;
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
	
	// 익히자
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<h1 align="center">회원등록</h1>

	<div align="center">	
		<form action="insert_success.jsp" method="get" name="insertForm">
			<table border="1">
			<tr><td>회원번호(자동) :</td><td><input type="text" name="" value="<%= last_custNo %>" disalbed></td></tr> <!-- 라스트번호는 이곳에 -->
			<tr><td>회원성명       :</td><td><input type="text" name="custName" value="" placeholder="이름을 입력하세요..."></td></tr>
			<tr><td>회원전화       :</td><td><input type="text" name="phone" value="" placeholder="전화번호를 입력하세요..."></td></tr>
			<tr><td>회원주소       :</td><td><input type="text" name="address" value="" placeholder="주소를 입력하세요..."></td></tr>
			<tr><td>가입일자       :</td><td><input type="date" name="joinDate" value="" placeholder="가입일 입력하세요..."></td></tr>
			<tr><td>고객등급       :</td><td><input type="text" name="grade" value=""  placeholder="등급을 입력하세요..." size="1"></td></tr>
			<tr><td>도시코드       :</td><td><input type="text" name="city" value=""  placeholder="도시를 입력하세요..." size="2"></td></tr>
			<input type="hidden" name="custNo" value="<%= last_custNo %>">
			<tr><td align="center" colspan="2"><input type="submit" value="등록" onclick="return check();"/>&nbsp;&nbsp;&nbsp; <!-- 온클릭 체크function -->
			<button type="button"  onclick="location.href='list.jsp'">조회</button></td></tr>
			</table>
		</form>
	</div>
	<hr />
	
	<div align="center">
		<form action="insert_alert.jsp" method="post">
			<input type="hidden" name="custNo" value="<%= last_custNo %>">
			<input type="submit" value="등록후 알람"/>&nbsp;&nbsp;&nbsp;
		</form>
	</div>
	
	<!-- RunCheck는 이곳으로 갑니다~ -->
	<!-- 제시된 문항의 체크하는 문장 -->
	<script>
		function check() {
			if (document.insertForm.custName.value == ""){ // custName이라는 값이 공란이라면
				alert("이름을 입력하세요!!"); 				// 이름을 입력하세요
				document.insertForm.custName.focus();
				return false;
			} else {
				return true; // insertForm.submit();							
			}
		}		
	</script>
	
	

</body>
</html>
















