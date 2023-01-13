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
	<div class="container"  align="center">
		<div class="mt-4 p-5 bg-primary text-white rounded">
			<h3>게시글 상세</h3>
	    	<a href="logout.do" class="col-1 btn btn-primary me-2">로그아웃</a>		
		</div>
	</div>		

	<div class="container mt-3" align="center">
		<form action="updateBoard.do" method="post">
			<input name="seq" type="hidden" value="${board.seq}" />
			<div class="input-group mb-3">
  				<span class="input-group-text" id="desc_title"><i class="fas fa-address-book"></i></span>
  				<input type="text" class="form-control" name="title" value="${ board.title }">
			</div>
			<div class="input-group mb-3">
  				<span class="input-group-text" id="desc_title"><i class="fas fa-user"></i></span>
  				<input type="text" class="form-control" name="writer" value="${ board.writer }" disabled>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text"><i class="fas fa-clipboard"></i></span>
			  <textarea class="form-control"  name="content" rows="15" >${ board.content }</textarea>
			</div>	
			<div class="input-group mb-3">
  				<span class="input-group-text" id="desc_title"><i class="fas fa-calendar"></i></span>
  				<input type="text" class="form-control" name="writer" value="${board.regDate }" disabled>
			</div>
			<div class="input-group mb-3">
  				<span class="input-group-text" id="desc_title"><i class="fas fa-hashtag"></i></span>
  				<input type="text" class="form-control" name="writer" value="${ board.cnt }" disabled>
			</div>
			
			<div class="container" align="center">
				<a href="logout.do" class="btn btn-primary mt-3">logout</a>
				<input type="submit" class="btn btn-primary mt-3" value="게시글수정"/>
				<a href="deleteBoard.do?seq=${board.getSeq()}" class="btn btn-primary mt-3">게시글삭제</a>
				<a href="getBoardList.do" class="btn btn-primary mt-3">게시글목록</a>			
			</div>
		</form>			
	</div>

	<script>
		function deleteBoard() {
			if(confirm("자료를 삭제하겠습니까?")) {
		    	self.location.href = "deleteBoard.do?seq=${ board.seq }";
		    }
		}
	</script>
</body>
</html>
