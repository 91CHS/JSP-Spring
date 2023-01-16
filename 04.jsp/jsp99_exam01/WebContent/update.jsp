<%@page import="member.vo.Member"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int custNo = Integer.parseInt(request.getParameter("custNo"));

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	Member member = new Member();
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		stmt = conn.prepareStatement("select * from member_tbl_02 where custno = ?");
		stmt.setInt(1, custNo);
		rs = stmt.executeQuery();
		if(rs.next()) {
			member.setCustNo(rs.getInt("CUSTNO"));
			member.setCustName(rs.getString("CUSTNAME"));
			member.setPhone(rs.getString("PHONE"));
			member.setAddress(rs.getString("ADDRESS"));
			member.setJoinDate(rs.getDate("JOINDATE"));
			member.setGrade(rs.getString("GRADE"));
			member.setCity(rs.getString("CITY"));
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
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<h1 align="center">회원수정/삭제</h1>

	<div align="center">	
		<form action="update_success.jsp" method="get" name="updateForm">
			<table border="1">
			<tr><td>회원번호(자동) :</td><td><input type="text" name="" value="<%= member.getCustNo() %>" disalbed></td></tr>
			<tr><td>회원성명       :</td><td><input type="text" name="custName" value="<%= member.getCustName() %>" ></td></tr>
			<tr><td>회원전화       :</td><td><input type="text" name="phone" value="<%= member.getPhone() %>" ></td></tr>
			<tr><td>회원주소       :</td><td><input type="text" name="address" value="<%= member.getAddress() %>" ></td></tr>
			<tr><td>가입일자       :</td><td><input type="date" name="joinDate" value="<%= member.getJoinDate() %>" ></td></tr>
			<tr><td>고객등급       :</td><td><input type="text" name="grade" value="<%= member.getGrade() %>" size="1"></td></tr>
			<tr><td>도시코드       :</td><td><input type="text" name="city" value="<%= member.getCity() %>" size="2"></td></tr>
			<input type="hidden" name="custNo" value="<%= member.getCustNo() %>" >
			<tr><td align="center" colspan="2"><input type="submit" value="수정" onclick="return updateCheck();"/>&nbsp;&nbsp;&nbsp;
			<button type="button"  onclick="return deleteCheck()">삭제</button></td></tr>
			</table>
		</form>
	</div>
	<hr />
	
	<script>
		function updateCheck() {
			if (document.updateForm.custName.value == ""){
				alert("이름을 입력하세요!!");
				document.updateForm.custName.focus();
				return false;
			} else {
				if(confirm("수정을 하겠습니까?")) {
					return true; // form.submit();							
				} else {
					return false;
				}
			}
		}	
		
		function deleteCheck() {
			if (document.updateForm.custName.value == ""){
				alert("이름을 입력하세요!!");
				document.updateForm.custName.focus();
				return false;
			} else {
				if(confirm("삭제을 하겠습니까?")) {
					location.href="delete_success.jsp?custNo=" + document.updateForm.custNo.value;				
				} else {
					return false;
				}
			}
		}			
	</script>
</body>
</html>
















