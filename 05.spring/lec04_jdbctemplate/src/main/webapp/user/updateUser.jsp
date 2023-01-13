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
			<h3>사용자 수정하기</h3>
			<p>상세설명.................</p>
		</div>
	</div>
	
	<div class="container col-3 mt-4">
		<form action="updateUser.do" method="post">
			<input type="hidden" name="id" value="${user.getId()}">
			<input type="hidden" name="curPage" value="${searchVO.getCurPage()}">
			<input type="hidden" name="rowSizePerPage" value="${searchVO.getRowSizePerPage()}">
			<input type="hidden" name="searchCategory" value="${searchVO.getSearchCategory()}">
			<input type="hidden" name="searchType" value="${searchVO.getSearchType()}">
			<input type="hidden" name="searchWord" value="${searchVO.getSearchWord()}">
			
			<div class="col-2 input-group mb-3">
				<div class="input-group-text"><i class="fas fa-user"></i></div>
				<input type="text" name="id" class="form-control" value="${ user.getId() }" disabled>
			</div>
			<div class="col-2 input-group mb-3">
				<div class="input-group-text"><i class="fas fa-address-book"></i></div>
				<input type="password" name="password" class="form-control" value="${ user.getPassword() }" disbled>
			</div>
			<div class="col-2 input-group mb-3">
				<div class="input-group-text"><i class="fas fa-address-book"></i></div>
				<input type="text" name="name" class="form-control" value="${ user.getName() }">
			</div>
			<div class="col-2 mb-3 form-check start-0">
			    <input type="checkbox" class="form-check-input" name="role" ${ user.getRole().toUpperCase() == "ADMIN" ? "checked" : "" }>
			    <label class="form-check-label" for="role">Administrator</label>
			</div>
			
			<div class="container" align="center">
				<a href="logout.do" class="btn btn-primary mt-3">logout</a>
				<input type="submit" class="btn btn-primary mt-3" value="사용자수정"/>
				<a href="deleteUser.do?id=${user.getId()}" class="btn btn-primary mt-3">사용자삭제</a>
				<a href="getUserList.do" class="btn btn-primary mt-3">사용자목록</a>			
			</div>	
		</form>			
	</div>	
</body>
</html>		