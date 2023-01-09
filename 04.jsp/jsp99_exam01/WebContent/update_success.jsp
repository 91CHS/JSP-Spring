<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int custNo = Integer.parseInt(request.getParameter("custNo"));
	String custName = request.getParameter("custName");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joinDate = request.getParameter("joinDate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;	
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		stmt = conn.prepareStatement("update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? " +
									 " where custno = ?");
		stmt.setString(1, custName);
		stmt.setString(2, phone);
		stmt.setString(3, address);
		stmt.setString(4, joinDate);
		stmt.setString(5, grade);
		stmt.setString(6, city);
		stmt.setInt(7, custNo);
		stmt.executeUpdate();
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
<script>
	alert("수정성공!!!")
	location.href = "list.jsp";
</script>
