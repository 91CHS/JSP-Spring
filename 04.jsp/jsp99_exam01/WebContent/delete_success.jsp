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
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		stmt = conn.prepareStatement("delete from member_tbl_02 where custno = ?");
		stmt.setInt(1, custNo);
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
	alert("삭제성공!!!")
	location.href = "list.jsp";
</script>
