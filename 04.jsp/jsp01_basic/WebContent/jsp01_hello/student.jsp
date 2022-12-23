<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%
		int num = 1000;
		String name = "홍길동";
		String gender = "남자";
		int age = 43;
		
		ArrayList<String> list = new ArrayList<>();
		list.add("2000");
		list.add("소향");
		list.add("여자");
		list.add("44");
		
		
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- 실습. 변수 사용해서 학생1명의 정보를 출력하기 (h1태그등 사용)
			 번호 : 1000
			 이름 : 홍길동
			 성별 : 남자
			 나이 : 43
		-->	
		<h2> 변수 사용하여 학생 1명의 정보</h2>
		<h2> 번호 : <%=num%> <h2>
		<h2> 이름 : <%=name%> <h2>
		<h2> 성별 : <%=gender%> <h2>
		<h2> 나이 : <%=age%> <h2>
		<hr>

		<!--
			실습2. ArrayList<String>를 이용해서 학생 1명만 출력
			번호 : 2000
			이름 : 소향
			성별 : 여자
			나이 : 44
		-->	
 		<h2> ArrayList 사용하여 학생 1명의 정보</h2>
		<h2> 번호 : <%=list.get(0)%>   </h2>
		<h2> 이름 : <%=list.get(1)%>   </h2>
		<h2> 성별 : <%=list.get(2)%>   </h2>
		<h2> 나이 : <%=list.get(3)%>    </h2>
		<hr>
		
		<h3><%= 100*100 %></h3>
</body>
</html>