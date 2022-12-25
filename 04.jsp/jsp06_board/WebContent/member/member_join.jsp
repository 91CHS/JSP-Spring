<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">  
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<style>
		.login-btn {
			clear: black;
			background-color: #FFC312
			width:100px;
		}
		.login-btn:hover {
			clear: white;
			background-color: black;
		}
		.input-group-prepend span {
			color: black;
			border-left-color: : #FF312;
			width: 40px;
			border: 0 !important;
		}
	</style>
</head>
<body>
		<div class="container" align="center">

		<div class="jumbotron">
			<h3>회원가입</h3>
			<p>회원가입 페이지 입니다. 글을 작성해 주세요!!</p>
		</div>
	
		<form action="membersuccess.mb?" method="post" class="form-group" 
			name="memberform" >   <!-- enctype="multipart/form-data" -->
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-user"></i></span></div>
				<input type="text" class="form-control" name="member_id" id="member_id" value="" required
				placeholder="아이디를 입력하세요...."/>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-key"></i></span></div>
				<input type="password" class="form-control" name="member_pw" id="member_pw" value="1" required
				placeholder="비밀번호를 입력하세요...."/>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-clipboard"></i></span></div>
				<input type="text" class="form-control" name="member_name" id="member_name" value="" required
				placeholder="이름을 입력하세요...."/>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-comment-dots"></i></span></div>
				<input type="text" class="form-control" name="member_age" id="member_age" value="1" required
				placeholder="나이를 입력하세요....">
			</div>
			
		    <div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-clipboard"></i></span></div>
				<input type="text" class="form-control" name="member_gender" id="member_gender" value="" required
				placeholder="성별을 입력하세요...."/>
			</div>
			
			<div class="form-group input-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-clipboard"></i></span></div>
				<input type="text" class="form-control" name="member_email" id="member_email" value="" required
				placeholder="이메일을 입력하세요...."/>
			</div>
			

			
			<div class="form-group mt-md-5">
				<input type="reset" class="btn btn-success float-right login-btn ml-sm-2" value="새로고침"/>
				<input type="submit" class="btn btn-success float-right login-btn" value="등록"/>
			</div>
		</form>
	</div>
</body>
</html>