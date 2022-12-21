<%@page import="com.lec.board.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lec.board.BoardList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardList bl = new BoardList();
	ArrayList<Board> board_list = bl.getBoardList();
	String bd_tbl = "<table border='1'>";
	
	for(Board board:board_list) {
		bd_tbl += "<tr><td>" + board.getBno() + "</td>"
			    + "<td>" + board.getSubject() + "</td>"
			    + "<td>" + board.getWriter()  + "</td>"
			    + "<td>" + board.getContent() + "</td></tr>";	
	}
			
	bd_tbl += "</table>";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= bd_tbl %>
</body>
</html>