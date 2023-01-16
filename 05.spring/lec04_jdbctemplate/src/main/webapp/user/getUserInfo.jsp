<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Spring Framework</title>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" 
		integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" 
		crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>	
</head>
<body>

	
	<div class="container" align="center">
		<div class="mt-4 p-5 bg-success text-white rounded">
			<h3>사용자정보</h3>
			<p>상세설명.................</p>
		</div>
	</div>
	
	
	<div class="container col-3 mt-4">
		<form>
			<div class="col-2 input-group mb-3">
				<div class="input-group-text"><i class="fas fa-user"></i></div>
				<input type="text" name="id" class="form-control" value="${ sessionScope.user.getId() }" disabled>
			</div>
			<div class="col-2 input-group mb-3">
				<div class="input-group-text"><i class="fas fa-address-book"></i></div>
				<input type="text" name="name" class="form-control" value="${ sessionScope.user.getName() }" disabled>
			</div>
			<div class="col-2 mb-3 form-check start-0">
			    <input type="checkbox" class="form-check-input" name="role" ${ sessionScope.user.getRole().toUpperCase() == "ADMIN" ? "checked" : "" } disabled>
			    <label class="form-check-label" for="role">Administrator</label>
			</div>
		</form>			
	</div>	
		
	<div class="container" align="center">
			
		<a href="logout.do" class="btn btn-primary mt-3">logout</a>
		<c:if test="${ sessionScope.user.getRole().toUpperCase() == 'ADMIN' }">
			<a href="getUserList.do" class="btn btn-primary mt-3">사용자목록보기</a>
		</c:if>	
		<a href="getBoardList.do" class="btn btn-primary mt-3">게시판목록보기</a>
		
	</div>	
	
</body>
</html>		