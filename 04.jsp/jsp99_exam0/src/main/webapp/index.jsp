<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h3 align="center">쇼핑몰 회원관리 프로그램</h3>
		쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.
		프로그램 작성 순서
		1. 회원정보 테이블을 생성한다. <br />
		2. 매출정보 테이블을 생성한다. <br />
		3. 회원정보,매출정보테이블에 제시된 문제지의 참조데이터를 추가 생성한다. <br />
		4. 회원정보 입력 화면프로그램을 작성한다. <br />
		5. 회원정보 조회 프로그램을 작성한다. <br />
		6. 회원매출정보 조회 프로그램을 작성한다.  <br />
	</section>
	<footer style="text-align : center; background-color: brown; color: white;" > HRDKOREA Copyright&copy;2016 All rights reserved Human Resources Development Service of Korea. </footer>
</body>
</html>