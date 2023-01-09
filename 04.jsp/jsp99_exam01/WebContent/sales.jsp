<%@page import="member.vo.Money"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="member.vo.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	List<Money> moneyList = new ArrayList<>();
	
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		stmt = conn.prepareStatement("select * from money_tbl_02 order by amount desc");
		rs = stmt.executeQuery();
		while(rs.next()) {
			Money money = new Money();
			money.setCustNo(rs.getInt("custno"));
 			money.setSalenol(rs.getInt("salenol"));
			money.setPcost(rs.getInt("pcost"));
			money.setAmount(rs.getInt("amount"));
			money.setPrice(rs.getInt("price"));
			money.setPcode(rs.getString("pcode"));
			money.setSdate(rs.getDate("sdate")); 
			moneyList.add(money);
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
	
	String money_table = "<table border='1'>" 
			   + "<tr><th>고객번호</th><th>판매번호</th><th>단가</th><th>수량</th><th>가격</th><th>상품코드</th><th>판매일자</th></tr>";
	for(Money money:moneyList) {
		money_table += "<tr><td>" + money.getCustNo()+ "</td>"
			    + "<td>" + money.getSalenol() + "</td>"
			    + "<td>" + money.getPcost() + "</td>"
			    + "<td>" + money.getAmount() + "</td>"
			    + "<td>" + money.getPrice() + "</td>"
			    + "<td>" + money.getPcode() + "</td>"
			    + "<td>" + money.getSdate() + "</td></tr>";			
	}
	money_table += "</table>";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<header>
		<h1 align="center">회원목록/수정</h1>
	</header>
	
	<div align="center">
		<%= money_table %> <br>
		<button type='button' onclick="location.href='index.jsp'">홈으로 돌아가기</button>
	</div>
</body>
</html>