<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	String DRV = "org.mariadb.jdbc.Driver";
	String URL = "jdbc:mariadb://localhost:3306/jspstudy";
	String USR = "root";
	String PWD = "12345";
	
	Class.forName(DRV);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int row = 0;
	String sql = "update member set password=?, name=? , email=? where id=?";
	    
    
	try {
		conn = DriverManager.getConnection(URL, USR, PWD);
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pw);
		pstmt.setString(2, name);
		pstmt.setString(3, email);
		pstmt.setString(4, id);
		
		row = pstmt.executeUpdate();
			
	} catch(Exception e) {
		out.write("<h3 class='bg-danger text-white'>DB접속실패!!!</h3><br>" + e.getMessage());	
		e.printStackTrace();
	} finally {
		// 5. close() DB 연결 해제
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
     <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
	<h1>회원수정</h1>
	
	<%
		if(row >0) {
	%>
	   <h3 class="bg-info text-white"> <%= id %> 회원의 정보가 성공적으로 수정되었습니다.</h3>
	<%  } else {
	      %>
	    <h3 class="bg-danger text-white">회원정보실패!! <%= id %>를 찾지 못했습니다!</h3>
	   <% } %>
	   
	   <a href="jsp05_listMember.jsp" class="btn btn-primary">회원목록</a>
	   </div>
</body>
</html>